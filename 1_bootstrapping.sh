#!/bin/bash

source /Users/kboumedh/bin/util.sh

backtotop
desc "Let's add a first provider and launch a vm on it"
run ""

backtotop
desc "Let's delete my current kcli config"
run "rm ~/.kcli/config.yml"

backtotop
desc "Bootstrap a remote libvirt client, naming it mylibvirt and using qemu+ssh as uri"
run "kcli bootstrap -n mylibvirt -H 192.168.1.5"

backtotop
desc "Check resulting config file"
run "cat ~/.kcli/config.yml"

backtotop
desc "List available clients"
run "kcli list --clients"

backtotop
desc "Check which cloud images/template can be downloaded"
run "kcli download -h"

backtotop
desc "Check which ones are there"
run "kcli list --templates"

backtotop
desc "Download cirros image/template"
run "kcli download cirros"

backtotop
desc "Check template is there"
run "kcli list --templates"

backtotop
desc "Create a vm named vm1 with default settings"
run "kcli vm -p CentOS-7-x86_64-GenericCloud.qcow2 vm1"

backtotop
desc "Create a vm named vm2 with custom settings, memory and disks in this case"
run "kcli vm -p CentOS-7-x86_64-GenericCloud.qcow2 vm2 -P memory=2048 -P disks=[10,20]"

backtotop
desc "List vms. Note ips get reported"
run "kcli list"

backtotop
desc "Ssh into vm1"
run "kcli ssh vm1"

backtotop
desc "Delete previous vms"
run "kcli delete --yes vm1 vm2"
