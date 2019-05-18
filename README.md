# Docker Image providing `qemu-user-static`, by [FEROX](https://ferox.yt)

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/frxyt/qemu-user-static.svg)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/frxyt/qemu-user-static.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/frxyt/qemu-user-static.svg)
![GitHub issues](https://img.shields.io/github/issues/frxyt/docker-qemu-user-static.svg)
![GitHub last commit](https://img.shields.io/github/last-commit/frxyt/docker-qemu-user-static.svg)

This image embbed `qemu-user-static`, so you can copy these binaries when cross-building your docker images !

This way, you can build and run an `arm32v7` or an `arm64v8` Docker image on a `x86 / amd64` host !

* Docker Hub: https://hub.docker.com/r/frxyt/qemu-user-static
* GitHub: https://github.com/frxyt/docker-qemu-user-static

## Docker Hub Image

**`frxyt/qemu-user-static`**

## Usage

1. Register `qemu-user-static` on your host with:
   `docker run --rm --privileged multiarch/qemu-user-static:register --reset`

1. Modify your `Dockerfile` to copy required `qemu-ARCH-static` package:

   * For `arm32v7`:

   ```Dockerfile
   FROM frxyt/qemu-user-static:latest AS qemu
   FROM arm32v7/debian:stable-slim
   COPY --from=qemu /usr/bin/qemu-arm-static /usr/bin
   ```

   * For `arm64v8`:

   ```Dockerfile
   FROM frxyt/qemu-user-static:latest AS qemu
   FROM arm64v8/debian:stable-slim
   COPY --from=qemu /usr/bin/qemu-aarch64-static /usr/bin
   ```

## Build

```sh
docker build -f Dockerfile -t frxyt/qemu-user-static:latest .
```

## License

This project and images are published under the [MIT License](LICENSE).

```
MIT License

Copyright (c) 2019 FEROX YT EIRL, www.ferox.yt <devops@ferox.yt>
Copyright (c) 2019 Jérémy WALTHER <jeremy.walther@golflima.net>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```