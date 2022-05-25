FROM python:3.9-slim

WORKDIR /usr/src/app
SHELL ["/bin/bash", "-c"]
RUN chmod 777 /usr/src/app

RUN apt-get -qq update && \
    apt-get -qq install -y unzip

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash","start.sh"]
