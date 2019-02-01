Install on CentOS/RHEL (tested on CentOS 7) by acquiring the RPMs and installing them altogether:

```
wget https://github.com/smaslennikov/packages/releases/download/v1.1.0/gpg-2.2.12-1.noarch.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.0/libassuan-2.5.2-1.noarch.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.0/libgcrypt18-1.8.4-1.noarch.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.0/libgpg-error-1.35-1.noarch.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.0/libksba-1.3.5-1.noarch.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.0/npth-1.6-1.noarch.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.0/ntbtls-0.1.2-1.noarch.rpm
wget https://github.com/smaslennikov/packages/releases/download/v1.1.0/pinentry-1.1.0-1.noarch.rpm
sudo yum install *.rpm
```
