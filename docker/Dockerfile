FROM python:3-bullseye

RUN pip install -U google-photos-takeout-helper
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

