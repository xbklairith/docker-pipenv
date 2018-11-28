FROM ubuntu:18.04

# -- Install Pipenv:
RUN apt update && apt install python3-pip git -y && pip3 install pipenv

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# -- Install Application into container:
RUN set -ex && mkdir /app
WORKDIR /app


ONBUILD COPY Pipfile Pipfile
ONBUILD COPY COPY Pipfile.lock Pipfile.lock
RUN set -ex && pipenv install --deploy --system