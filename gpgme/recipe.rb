#!/usr/bin/env ruby

class Gpgme < FPM::Cookery::Recipe
  name              'gpgme'
  description       'GnuPG package for RHEL/CentOS 7: gpgme'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '1.12.0'
  revision          '1'
  arch              'amd64'


  build_depends     'libgcrypt20',
                    'gpg >= 2.2.12'

  source            "https://gnupg.org/ftp/gcrypt/gpgme/gpgme-#{version}.tar.bz2"
  sha256            'b4dc951c3743a60e2e120a77892e9e864fb936b2e58e7c77e8581f4d050e8cd8'

  replaces          'gpgme'
  conflicts         'gpgme'

  pre_install       'pre-install'

  platforms [:centos, :redhat] do
    provides          'libgpgme.so.11()(64bit)',
                      'libgpgme.so.11(GPGME_1.0)(64bit)',
                      'libgpgme.so.11(GPGME_1.1)(64bit)'
  end

  def build
    configure :prefix => prefix, 'disable-install-doc' => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir

    # remove info listing in wait of resolution https://github.com/bernd/fpm-cookery/issues/205
    FileUtils.rm_r(destdir('usr/share/info/'))
  end
end
