#!/bin/bash
# This file is used to create VIM project files for C/C++ project.

function log() {
    echo `date +"%Y-%m-%d %H:%M:%S"` $* 
}

if [ $# -ne 1 ]; then
    echo "Usage $0 project_path"
    exit 1;
fi

# cd project's path, and get the absolute path
cd $1
os=`uname | grep MINGW`
if [ "x$os" != "x" ]; then
    base_path=`pwd | awk '{disk=substr($0, 2, 1); print toupper(disk)":"substr($0, 3)}'`
else
    base_path=`pwd`
fi
log "Base_path: ${base_path}"

# create project dir
proj_dir=".vimproj"
if [ ! -d ${proj_dir} ]; then
    log "mkdir '${proj_dir}'"
    mkdir ${proj_dir}
fi
cd ${proj_dir}


# findstr="-name \"*.[ch]\" -o -name \"*.cpp\" -o -name \"*.inl\""
# findstr='-name "*.[ch]" -o -name "*.cpp" -o -name "*.inl"'

# create file used by plugin 'lookupfile', id: 1581
log "Create file 'filenametags' ..."
(echo '!_TAG_FILE_SORTED	2	/2=foldcase/'; 
    (find ${base_path} \( -name "*.[ch]" -o -name "*.cpp" -o -name "*.inl" \) -printf "%f\t%p\t1\n" | \
    sort -f)) > ./filenametags

# create cscope file
log "Create file 'cscope.files' ..."
find ${base_path} -name "*.[ch]" -o -name "*.cpp" -o -name "*.inl" > cscope.files
cscope -bq

# create ctag file
log "Create file 'tags' ..."
ctags --fields=+aiS --C++-types=+p --extra=+q -L cscope.files

# get include path, so that we can use 'Ctrl-Wgf' or 'Ctrl-gf' to open a include file with filename under cursor 
inc_dirs=`grep "\.h$" cscope.files | awk '{n=split($0, a, "/"); print substr($0, 0, length($0) - length(a[n]))}' | sort | uniq`
tmppath=""
for one in $inc_dirs
do
    tmppath+=${one}","
done

# create file project.vim 
log "Create file 'project.vim' ..."
echo "set tags=${base_path}/${proj_dir}/tags
cs add ${base_path}/${proj_dir}/cscope.out
let g:LookupFile_TagExpr = string('${base_path}/${proj_dir}/filenametags')
set path+=${tmppath}
" > project.vim

# add directory '.vimproj' to git's ignore list 
cd ..
file=".git/info/exclude"
if [ -f $file ]; then
    x=`grep ${proj_dir} $file`
    if [ "x$x" == "x" ]; then
        log "Change Git's exclude file."
        echo "${proj_dir}/" >> $file
    fi
fi

log "Exit."

