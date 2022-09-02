#!/bin/bash
./uno -x 2>&1 > /dev/null
if [ $? -ne 0 ]
then
  echo "Test invalid arg pass"
  exit 0
else
  echo "Test invalid arg failed"
  exit 1
fi
