#!/bin/bash

source /Users/kboumedh/bin/util.sh

backtotop
desc "Let's use profiles, to create vms with custom settings"
run ""

backtotop
desc "Profiles are defined in ~/.kcli/profiles.yml. Lets check"
run "cat ~/.kcli/profiles.yml"

backtotop
desc "List profiles"
run "kcli list --profiles"

backtotop
desc "Create a vm with a random name from profile fosdem"
run "kcli vm -p fosdem"

backtotop
desc "Check the info of this vm"
run "kcli info"

backtotop
desc "Let's connect to this vm and check dns entry was created, along with custom motd"
run "kcli ssh"

backtotop
desc "Delete this vm"
run "kcli delete --yes"
