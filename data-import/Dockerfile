FROM ruby:2.3-onbuild

RUN apt-get update && \
    apt-get install -y openjpeg-tools && \
    rm -rf /var/lib/apt/lists/*
