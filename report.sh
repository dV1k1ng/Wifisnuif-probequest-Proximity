#!/bin/bash
#
csv_file=$1
cat $csv_file | awk -F\; '$4 >=-52 {print ;}'
