# google-photos-takeout-cleaner

First export and download all the Google Photos data in tar.gz format on https://takeout.google.com/

Put all the tar.gz files in the same folder. Do not extract them.

Then execute the short script below to extract, process and organize all the files:

```bash
docker pull denouche/google-photos-takeout-cleaner:main

export INPUT=/tank/takeout/input    # path to folder containing all takeout*.tgz files
export OUTPUT=/tank/takeout/output  # path where all the processed photos will be stored. Give an empty folder.

docker run -v $INPUT:/input -v $OUTPUT:/output --rm -it denouche/google-photos-takeout-cleaner:main
```

That's all!

This project uses this tool: https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper
