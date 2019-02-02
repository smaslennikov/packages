## Please do read the commands you'll be executing! I'm not responsible for your mishaps.

Install on Ubuntu (tested on 16.04 and 18.04) by acquiring the DEBs and installing them altogether:

```
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/gpgme_1.12.0-1_amd64.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/gpg_2.2.12-1_amd64.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/libassuan_2.5.2-1_amd64.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/libgcrypt20_1.8.4-1_amd64.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/libgpg-error_1.35-1_amd64.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/libksba_1.3.5-1_amd64.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/npth_1.6-1_amd64.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/ntbtls_0.1.2-1_amd64.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/pinentry_1.1.0-1_amd64.deb
sudo dpkg -r --force-depends libgpg-error0
sudo dpkg -i *.deb
```

Install on CentOS/RHEL (tested on CentOS 7) by acquiring the RPMs and installing them altogether:

```
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/gpg-2.2.12-1.x86_64.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/gpgme-1.12.0-1.x86_64.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/libassuan-2.5.2-1.x86_64.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/libgcrypt20-1.8.4-1.x86_64.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/libgpg-error-1.35-1.x86_64.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/libksba-1.3.5-1.x86_64.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/npth-1.6-1.x86_64.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/ntbtls-0.1.2-1.x86_64.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.2/pinentry-1.1.0-1.x86_64.rpm
sudo yum install *.rpm
```
