# google-photos-takeout-cleaner

First export and download all the Google Photos data on https://takeout.google.com/

Then execute the short script below to extract, process and organize all the files:

```bash
docker pull denouche/google-photos-takeout-cleaner:main

export INPUT=/path/to/folder  # path to folder containing all takeout*.tgz files
export OUTPUT=/output/folder  # path where all the processed photos will be stored

docker run -v $INPUT:/input -v $OUTPUT:/output --rm -it denouche/google-photos-takeout-cleaner:main
```

That's all!

This project uses this tool: https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper
