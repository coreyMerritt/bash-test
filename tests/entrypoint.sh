#!/bin/bash

script_dir="$(dirname $0)"
source $script_dir/../bash-test
! (( ignore_errors )) && set -e
! (( ignore_errors )) && set -E
(( very_verbose )) && set -x

btStartTest '"true" returns success'
  true

btInfo "Info triggers test end..."
  (( bt_test_active )) && false
  
btStartTest '"! false" returns success'
  ! false

btStartTest '"btExpectFail false" returns success'
  btExpectFail false

btStartTest '"-v"'
  echo -e "\tThis should be visible only when using -v"

btStartTest '"btEndTest x2" doesnt duplicate output on success"'
  true
btEndTest
btEndTest

