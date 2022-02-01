# google-photos-takeout-cleaner


```bash
docker pull denouche/google-photos-takeout-cleaner:main

export INPUT=/path/to/folder  # path to folder containing all takeout*.tgz files
export OUTPUT=/output/folder  # path where all the processed photos will be stored

docker run -v $INPUT:/input -v $OUTPUT:/output --rm -it denouche/google-photos-takeout-cleaner:main
```
