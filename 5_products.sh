#!/bin/bash

source /Users/kboumedh/bin/util.sh

backtotop
desc "Let's use products, which sit on top of plans to ease reutilization"
run ""

backtotop
desc "List available repos"
run "kcli list --repos"

backtotop
desc "It s just a git repo btw, cloned in ~/.kcli/plans"
run "ls ~/.kcli/plans/karmab"

backtotop
desc "List products"
run "kcli list --products"

backtotop
desc "List products of a given group(which basically live under a common directory)"
run "kcli list --products --group openshift"

backtotop
desc "Get info on a given product"
run "kcli product kubevirt -i"

backtotop
desc "Deploy kubevirt product"
run "kcli product kubevirt"

backtotop
desc "Deploy openshift product, overriding some parameters"
run "kcli product origin -P knative=true"

backtotop
desc "Check vms"
run "kcli list"
