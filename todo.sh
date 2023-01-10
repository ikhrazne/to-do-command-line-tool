#!/bin/bash

# author : mohamed ikhrazne
# flags documentation
# -a : print all tasks to finish
# -g : get task by id
# -t : add new task to todolist
# -f : finish task , and move it to deletedtasks
# -e : edit tasks
# -n : the number of todotasks
# -nd or -dn : the number of deleted tasks
# --hel

function addtask() {
  number_of_tasks=`wc -l todolist.txt`
  current_number=$(( $number_of_tasks + 1 ))
  current_date=`date`
  echo "$current_number $1 $current_date" >> todolist.txt
  echo "Done"
}

function getalltask () {
  cat -n todolist.txt
}

function finishtask () {
    echo 1
}

function edittask () {
    echo 1
}

function numberOftasks () {
    number_of_task=`cat -n todolist.txt`
    echo $number_of_task
}

function numberofdeletedtask () {
    echo 1
}

function help_function () {
    echo "todo.sh is tool to create, edit, delete a task in to do task"
    echo "flags documentation"
    echo "-a : print all tasks to finish"
    echo "-t : add new task to todolist"
    echo "-f : finish task , and move it to deletedtasks"
    echo "-e : edit tasks"
    echo "-n : the number of todotasks"
    echo "-nd or -dn : the number of deleted tasks"
}


if [ $1 == "-a" ]
then
   getalltask
elif [ $1 == "-t" ]
then
   addtask $2
elif [ $1 == "-f" ]
then
   echo $1
elif [ $1 == "-g" ]
then
   echo $1
elif [ $1 == "-n" ]
then
   numberOftasks
elif [ $1 == "-e" ]
then
   echo $1
elif [ $1 == "-nd" -o $1 == "-dn" ]
then
   echo $1
elif [ $1 == "--help" -o $1 == "-h" ]
then
   help_function
else
   echo "please enter a valid flag or run the command with --help or -h to understand"
fi


