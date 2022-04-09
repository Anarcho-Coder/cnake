#! /bin/bash
source ./buildtools/clean.sh
source ./buildtools/build.sh

declare -A ERRORS

ERRORS[INVALID_SOURCE_ERROR]=1
ERRORS[UNKOWN_ERROR]=2
ERRORS[INVALID_DIRECTORY_PARAMETERS_ERROR]=3

DEFAULT_MAIN="../src/main.cpp"

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
    echo "Forge: addDirectory not implemented"
    #dir=$#1
    #src=""

    #if [ $# -gt 1 ]
    #then
    #src=${$#}
    #fi

    #for entry in $dir/*
    #do
    #if [[ -f $entry ]]
    #then
    #src+=" $entry"
    #elif [[ -d $entry ]]
    #then
    #echo "Forge: Adding source files from $entry"
    #src+="$(addDirectory $entry $src)"
    #fi

    #done

    #return "$src"
}



# Star Script

clean

if [ "$#" -lt 1 ]
then
    echo "Forge: No files passed, attempting to build $DEFAULT_MAIN"
    build $DEFAULT_MAIN
else
    sourceFiles=""

    for file in $@
    do
        if [[ -f $file ]]
        then
            sourceFiles="$sourceFiles $file"
        elif [[ -d $file ]]
        then
            echo "Forge: Adding source files from $file"
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
