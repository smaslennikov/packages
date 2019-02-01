# My Packages [![Build Status](https://travis-ci.org/smaslennikov/packages.svg?branch=master)](https://travis-ci.org/smaslennikov/packages)

This repo contains CentOS packages I frequently need that aren't supplied by EPEL or base repositories. Incidentally, I've had to build Ubuntu packages, which are housed here as well.

## Binaries

...are to be found under [Releases](https://github.com/smaslennikov/packages/releases).

## Usage

This is a big fat TODO.

## Testing procedure

### Ubuntu

Building these packages requires installing some of their dependencies, so as I build them in Travis CI, I install them all. That means that Travis won't pass unless all packages install successfully. Consider this **my testing apparatus: Travis CI's Ubuntu 16.04**.

## CentOS

I use GPG on a regular basis and primarily use CentOS. Whatever issues arise will be fixed as they're introduced.

## License

Code here is licensed with [GNU GPL v3.0](LICENSE).
