#! /bin/bash

build() 
{
  echo "Build: Attempting to compile these source files:"
  echo
  echo $@
  echo

 gcc -o cnake $@ -lSDL2 
}


