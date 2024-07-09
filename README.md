# vcdextract - Utility for extracting files out of saturn disc images

## Docker

Build a docker image with the binary using the following command:

```shell
$ docker build -t vcdextract:local .
```

Then use it by running:
```shell
$ docker run -v "$(pwd):/mnt/workspace:rw" --rm -it vcdextract:local <arguments_here>
```
