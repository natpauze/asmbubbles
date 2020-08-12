#!/bin/bash

echo "Running: $1"

let START_SECONDS=10#$(date "+%s")
let START_NS=10#$(date "+%N")

./$1

let TOTAL_SECONDS=10#$(date "+%s")-$START_SECONDS
let TOTAL_NS=10#$(date "+%N")-$START_NS

if [ $TOTAL_NS -lt 0 ]
then
    let TOTAL_NS=$TOTAL_NS+1000000000
    let TOTAL_SECONDS=$TOTAL_SECONDS-1
fi
echo "$TOTAL_SECONDS.$TOTAL_NS"
