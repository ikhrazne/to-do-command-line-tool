#!/bin/bash

# author : mohamed ikhrazne
# flags documentation
# -a : print all tasks to finish
# -t : add new task to todolist
# -f : finish task , and move it to deletedtasks
# -e : edit tasks
# -n : the number of todotasks
# -nd or -dn : the number of deleted tasks
# --hel

if [ $1 == "-a" ]
then
   echo $1
elif [ $1 == "-t" ]
then
   echo $1
elif [ $1 == "-f" ]
then
   echo $1
elif [ $1 == "n" ]
then
   echo $1
elif [ $1 == "-e" ]
then
   echo $1
elif [ $1 == "-nd" -o $1 == "-dn" ]
then
   echo $1
elif [ $1 == "--help" -o $1 == "-h" ]
then
   echo $1
else
   echo "please enter a valid flag or run the command with --help or -h to understand"
fi


