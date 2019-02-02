# My Packages [![Build Status](https://travis-ci.org/smaslennikov/packages.svg?branch=master)](https://travis-ci.org/smaslennikov/packages)

This repo contains CentOS packages I frequently need that aren't supplied by EPEL or base repositories. Incidentally, I've had to build Ubuntu packages, which are housed here as well.

## Binaries

...are to be found under [Releases](https://github.com/smaslennikov/packages/releases).

## Usage

Follow instructions [in the INSTALL.md](INSTALL.md). Keep in mind that no warranty is included, and there are **seriously janky decisions throughout**, thankfully for Ubuntu only. Here's an incomplete list:

- in legacy Ubuntu we depend on [forcefully removing several packages](.travis.yml#L10)
- packages don't neatly upgrade old ones in Ubuntu - PRs welcome
- in legacy Ubuntu we have to [symlink](gnupg/post-install#L5) `libreadline`, even though we don't touch it
- in legacy Ubuntu we have to [remove](libassuan/post-install#L3) all old `libassuan` files, and I don't know where they come from (no package is responsible afaict)
- in legacy Ubuntu we have to [remove](libksba/post-install#L3) all old `libksba` files, and I don't know where they come from (no package is responsible afaict)

## Testing procedure

### Ubuntu

Building these packages requires installing some of their dependencies, so as I build them in Travis CI, I install them all. That means that Travis won't pass unless all packages install successfully. Consider this **my testing apparatus: Travis CI's Ubuntu 16.04**.

## CentOS

I use GPG on a regular basis and primarily use CentOS. Whatever issues arise will be fixed as they're introduced.

## Contributions

...are always welcome!

## License

Code here is licensed with [GNU GPL v3.0](LICENSE).
