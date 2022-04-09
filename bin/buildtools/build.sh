#! /bin/bash

GCC_FLAGS="-lSDL2"
OUTPUT_FILE="game"

build()
{
    echo "Build: Attempting to compile these source files into $OUTPUT_FILE:"

    for item in $@
    do
        echo $item
    done


    gcc -o $OUTPUT_FILE $@ $GCC_FLAGS

    if [ $? -eq 0 ]
    then
        echo "Build: Compile Succesful, now just run $(readlink -f .)/$OUTPUT_FILE" 
    fi
}


