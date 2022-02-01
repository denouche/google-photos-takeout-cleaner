#!/bin/bash

cd /input
date
cat takeout-* | tar xzivf - 2> /input/tar_error.logs 1> /input/tar_output.logs
date
google-photos-takeout-helper -i /input/Takeout -o /output --divide-to-dates
date

