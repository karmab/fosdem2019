#!/bin/bash

source /Users/kboumedh/bin/util.sh

backtotop
desc "Let's use plans, which allows us to create multiple objects(vms, networks, containers,...) at once"
run ""

backtotop
desc "Here s a simple plan"
run "cat simpleplan.yml"

backtotop
desc "Create the plan, giving it a name of myplan"
run "kcli plan -f simpleplan.yml myplan"

backtotop
desc "Check objects are there"
run "kcli list"

backtotop
desc "Check info of vm1"
run "kcli info vm1"

backtotop
desc "Rerun the plan and see how it doesnt create vms"
run "kcli plan -f simpleplan.yml"

backtotop
desc "Delete one of the vms"
run "kcli delete --yes vm3"

backtotop
desc "Rerun the plan and see how it recreates the missing vm"
run "kcli plan -f simpleplan.yml myplan"

backtotop
desc "Stop all the vms of the plan"
run "kcli plan --stop myplan"

backtotop
desc "Start all the vms of the plan"
run "kcli plan --start myplan"

backtotop
desc "Delete the plan"
run "kcli plan --delete --yes myplan"

backtotop
desc "Here s a more complex plan, using parameters"
run "cat complexplan.yml"

backtotop
desc "Check the script to be applied"
run "cat script1.sh"

backtotop
desc "Check one of the files to be injected"
run "cat file1.txt"

backtotop
desc "Create the plan, giving it a random name and overriding some of the parameters"
run "kcli plan -f complexplan.yml -P nodes=5 -P disk_size=30"

backtotop
desc "Lets wait a few seconds for vms to get their ip"
run ""

backtotop
desc "Connect to one of the resulting vms and check how files were copied and scripts executed"
run "kcli ssh devconf001"

backtotop
desc "Delete vms"
run "kcli delete --yes devconf001 devconf002 devconf003 devconf004 devconf005"
