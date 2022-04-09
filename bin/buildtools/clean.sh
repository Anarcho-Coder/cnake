#! /bin/bash

clean()
{   
    FILES=$(find . -not -name "*.sh" -and -not -name "*.vim" -type f)
    
    if [ ! -z "$FILES" ]
    then
        echo "Clean: Removing following files:"
        echo "$FILES"
        echo $FILES | xargs rm 
    else
        echo "Clean: Nothing to remove"
    fi
    
}


