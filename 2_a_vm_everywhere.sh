#!/bin/bash

source /Users/kboumedh/bin/util.sh

backtotop
desc "Let s create a vm in several providers"
run ""

backtotop
desc "Restablish my own config file"
run "cp ~/.kcli/config.yml.old  ~/.kcli/config.yml"

backtotop
desc "List my available clients"
run "kcli list --clients"

backtotop
desc "Create a vm in my default (libvirt) client"
run "kcli vm -p CentOS-7-x86_64-GenericCloud.qcow2 vm10"

backtotop
desc "Create a vm in my gcp client (the latest centos-7 cloud image from centos family will be used)"
run "kcli -C gcp_cnvlab vm -p CentOS-7-x86_64-GenericCloud.qcow2 vm10"

backtotop
desc "Create a vm in my aws client"
run "kcli -C aws vm -p CentOS-7-x86_64-GenericCloud.qcow2 vm10"

backtotop
desc "Create a vm in my ovirt client"
run "kcli -C my_ovirt vm -p CentOS-7-x86_64-GenericCloud.qcow2 vm10"

backtotop
desc "list vms on my default provider"
run "kcli list"

backtotop
desc "list vms on my gcp provider"
run "kcli -C gcp_cnvlab list"

backtotop
desc "list vms on my  aws provider"
run "kcli -C aws list"

backtotop
desc "list vms on my ovirt provider"
run "kcli -C my_ovirt list"

backtotop
desc "And we would do the same in kubevirt or openstack"

backtotop
desc "Let's delete vm10 on each provider"
run "kcli -C aws,gcp_cnvlab,my_ovirt,twix delete --yes vm10"
