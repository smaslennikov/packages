# My Packages [![Build Status](https://travis-ci.org/smaslennikov/packages.svg?branch=master)](https://travis-ci.org/smaslennikov/packages)

This repo contains CentOS packages I frequently need that aren't supplied by EPEL or base repositories. Incidentally, I've had to build Ubuntu packages, which are housed here as well.

## Binaries

...are to be found under [Releases](https://github.com/smaslennikov/packages/releases).

## Usage

Follow instructions [in the INSTALL.md of the most current release](https://github.com/smaslennikov/packages/releases). Keep in mind that no warranty is included, and there are **questionable hacks** to get things working smoothly. Here's an incomplete list of issues:

- for Ubuntu we have to [symlink](gnupg/ubuntu-post-install#L5) `libreadline`
- for CentOS we have to [symlink](gnupg/centos-post-install#L4) `libbz2`
- for the following packages we ignore `usr/share/info/` because [I don't know how to share it between packages properly](https://github.com/bernd/fpm-cookery/issues/205)
    - `gnupg`
    - `pinentry`
    - `libassuan`
    - `libgpg-error`
    - `libgcrypt`
    - `gpgme`
    - `libksba`
- for Ubuntu we have to [remove](libassuan/post-install#L3) all old `libassuan` files
- for Ubuntu we have to [remove](libksba/post-install#L3) all old `libksba` files

## Testing procedure

### Ubuntu

Tested in bare Ubuntu 16.04 and 18.04.

## CentOS

Tested on CentOS 7.

## Contributions

...are always welcome!

## License

Code here is licensed with [GNU GPL v3.0](LICENSE).
