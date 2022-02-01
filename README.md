# google-photos-takeout-cleaner


```bash
INPUT=/path/to/folder  # path to folder containing all takeout*.tgz files
OUTPUT=/output/folder  # path where all the processed photos will be stored
docker pull denouche/google-photos-takeout-cleaner:main
docker run -v $INPUT:/input -v $OUTPUT:/output --rm -it denouche/google-photos-takeout-cleaner:tagname
```
