FROM ubuntu:22.04 AS base
RUN apt-get update && apt-get install -y build-essential cmake git
ADD . /cmake_git_version
WORKDIR /cmake_git_version

RUN cmake -B /build
RUN cmake --build /build
ENTRYPOINT ["/build/main"]
