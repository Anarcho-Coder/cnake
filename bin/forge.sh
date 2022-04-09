#! /bin/bash
source ./buildtools/clean.sh
source ./buildtools/build.sh

declare -A ERRORS

ERRORS[INVALID_SOURCE_ERROR]=1
ERRORS[UNKOWN_ERROR]=2
ERRORS[INVALID_DIRECTORY_PARAMETERS_ERROR]=3

# Implement necessary functions

error()
{

    if [ -z $@ ] 
    then
        echo "[ERROR] Forge: Unkown Error"
        exit ${ERRORS[UNKOWN_ERROR]}
    else
        echo "[ERROR] Forge: $@"
        exit ${ERRORS[$@]}    
    fi
    
}

addDirectory()
{
    dir=$1
    src=""

    if [ $# -gt 1 ]
    then
       src=${$#}
    fi 

     for entry in $dir/*
     do
         if [[ -f $entry ]]
         then 
             src+=" $dir/$entry"
         elif [[ -d $entry ]]
         then
             src+="$(addDirectory $entry $src)"
         fi

     done      
}



# Star Script

clean

if [ "$#" -lt 1 ]
then
    echo "Forge: No files passed, building ../src/main.cpp"
    build ../src/main.cpp
else
   sourceFiles=""

   for file in $@
   do
       if [[ -f $file ]]
       then 
           sourceFiles="$sourceFiles $file"
       elif [[ -d $file ]]
       then
           sourceFiles="$(addDirectory $file $sourceFiles)"
       fi 
   done

   if [[ -z $sourceFiles ]]
   then
       echo "Forge: No Source Files Passed"
   else
       build "$sourceFiles"
   fi
fi

echo "Forge: Build Finished"
