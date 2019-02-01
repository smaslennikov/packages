Install on Ubuntu (tested on 16.04 and 18.04) by acquiring the DEBs and installing them altogether:

```
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/gpg_2.2.12-1_all.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/libassuan_2.5.2-1_all.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/libgcrypt_1.8.4-1_all.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/libgpg-error_1.35-1_all.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/libksba_1.3.5-1_all.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/npth_1.6-1_all.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/ntbtls_0.1.2-1_all.deb
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/pinentry_1.1.0-1_all.deb
sudo dpkg -i *.deb
```

Install on CentOS/RHEL (tested on CentOS 7) by acquiring the RPMs and installing them altogether:

```
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/gpg-2.2.12-1.noarch.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/libassuan-2.5.2-1.noarch.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/libgcrypt-1.8.4-1.noarch.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/libgpg-error-1.35-1.noarch.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/libksba-1.3.5-1.noarch.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/npth-1.6-1.noarch.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/ntbtls-0.1.2-1.noarch.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.0.2/pinentry-1.1.0-1.noarch.rpm
sudo yum install *.rpm
```
