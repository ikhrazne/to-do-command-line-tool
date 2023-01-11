#!/bin/bash

# author : mohamed ikhrazne
# flags documentation
# -a : print all tasks to finish
# -g : get task by id
# -t : add new task to todolist
# -f : finish task , and move it to deletedtasks
# -e : edit tasks
# -n : the number of todotasks
# -fa or -af : get all finished tasks
# -nd or -dn : the number of deleted tasks
# --hel

function addtask () {
   current_number=$(( $number_of_tasks + 1 ))
   current_date=`date`
   echo "$1 ($current_date)" >> todolist.txt
   echo "Done"
}

function getalltask () {
   cat -n todolist.txt
}

function finishtask () {
   sed -n "$1p" todolist.txt >> deletedtask.txt
   sed -i "$1d" "todolist.txt"
}

function edittask () {
   line_to_replace=`sed -n "$1p" todolist.txt`
   current_date=`date`

   sed -i "s/$line_to_replace/$2 ($current_date)/" todolist.txt
   echo "Done"
}

function number_of_tasks () {
   number_of_task=`wc -l < todolist.txt`
   echo $number_of_task
}

function number_of_deleted_tasks () {
   deleted_tasks=`wc -l < deletedtask.txt`
   echo $deleted_tasks
}

function get_by_umber () {
   sed -n "$1p" todolist.txt
}

function get_finished_tasks() {
   cat -n deletedtask.txt
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
   finishtask $2
elif [ $1 == "-g" ]
then
   get_by_number $2
elif [ $1 == "-n" ]
then
   number_of_tasks
elif [ $1 == "-e" ]
then
   edittask $2 $3
elif [ $1 == "-nd" -o $1 == "-dn" ]
then
   number_of_deleted_tasks
elif [ $1 == "--help" -o $1 == "-h" ]
then
   help_function
elif [ $1 == "-af" -o $1 == "-fa"]
then
   get_finished_tasks
else
   echo "please enter a valid flag or run the command with --help or -h to understand"
fi


