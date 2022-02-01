#!/bin/bash

echo "Starting process"
date

cd /input
cat takeout-* | tar xzivf - 2> /input/tar_error.logs 1> /input/tar_output.logs

date

google-photos-takeout-helper -i /input/Takeout -o /output --divide-to-dates

date
echo "Processing done"
