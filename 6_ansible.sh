#!/bin/bash

source /Users/kboumedh/bin/util.sh

backtotop
desc "Let's describe some of the ansible points of integration with kcli"
run ""
backtotop

desc "Create a couple of vms on my libvirt provider forcing their plan value to be named xxx"
run "kcli -C twix vm -p CentOS-7-x86_64-GenericCloud.qcow2 -P plan=xxx vm11"
run "kcli -C twix vm -p CentOS-7-x86_64-GenericCloud.qcow2 -P plan=xxx vm12"

desc "Create a couple of vms on my gcp provider forcing their plan value to be named yyy"
run "kcli -C gcp_cnvlab vm -p CentOS-7-x86_64-GenericCloud.qcow2 -P plan=yyy vm13"
run "kcli -C gcp_cnvlab vm -p CentOS-7-x86_64-GenericCloud.qcow2 -P plan=yyy vm14"

backtotop
desc "List vms of our current provider"
run "kcli list"

backtotop
desc "Ansible ping all the nodes of the plan xxx"
run "ansible -i ~/klist.py -m ping xxx"

backtotop
desc "Switch to gcp client"
run "kcli switch gcp_cnvlab"

backtotop
desc "List vms there"
run "kcli list"

backtotop
desc "Ansible ping all the nodes of the plan yyy. Note that we use the same inventory"
run "ansible -i ~/klist.py -m ping yyy"

backtotop
desc "Switch back to my libvirt client"
run "kcli switch twix"

backtotop
desc "Review a plan with a playbook. You can define as many as you want in the plan"
run "cat ansible_plan.yml"

backtotop
desc "Review the playbook to be used. The matching hosts will be the ones with the corresponding plan name"
run "cat frout.yml"

backtotop
desc "Launch a plan named testansible with an embedded playbook"
run "kcli plan -f ansible_plan.yml testansible"

backtotop
desc "Ssh to the node and check ansible was applied"
run "kcli ssh testansible02"

backtotop
desc "There are also ansible kcli modules you can check"
run ""
