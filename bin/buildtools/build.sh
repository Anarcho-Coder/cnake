#! /bin/bash

build()
{
    echo "Build: Attempting to compile these source files:"

    for item in $@
    do
        echo $item
    done


    gcc -o cnake $@ -lSDL2
}


