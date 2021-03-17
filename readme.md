# CI images for Nim

This repository contains the sources for a Docker image suitable to run the entirety of Nim's CI

## Environment

The CI image provides the following environment:

- Glibc 2.27
- GCC 8.4.0
- Node.js 12

Dependencies for Nim CI are also bundled, for more details, see [`extra-packages`](extra-packages).
