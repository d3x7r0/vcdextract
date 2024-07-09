FROM debian:bookworm AS builder

RUN apt-get update
RUN apt-get install -y build-essential cmake

RUN mkdir -p /usr/local/src/vcdextract

WORKDIR /usr/local/src/vcdextract

COPY . .

RUN cmake -B build -S .

WORKDIR /usr/local/src/vcdextract/build

RUN make

FROM debian:bookworm-slim

RUN mkdir -p /usr/local/bin
RUN mkdir -p /mnt/workspace

COPY --chmod=0755 --from=builder /usr/local/src/vcdextract/build/src/vcdextract /usr/local/bin/vcdextract

WORKDIR /mnt/workspace

ENTRYPOINT ["/usr/local/bin/vcdextract"]
