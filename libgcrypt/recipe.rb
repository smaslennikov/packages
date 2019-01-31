#!/usr/bin/env ruby

class Libgcrypt < FPM::Cookery::Recipe
  name              'libgcrypt'
  description       'GnuPG package for RHEL/CentOS 7: libgcrypt dependency'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '1.8.4'
  revision          '1'
  arch              'all'

  source            "https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-#{version}.tar.bz2"
  sha256            'f638143a0672628fde0cad745e9b14deb85dffb175709cacc1f4fe24b93f2227'

  depends           'libgpg-error >= 1.25'

  replaces          'libgcrypt',
                    'libgcrypt-devel'
  conflicts         'libgcrypt',
                    'libgcrypt-devel'

  def build
    #configure :prefix => prefix, 'disable-install-doc' => true
    configure
    make
  end

  def install
    #make :install, 'DESTDIR' => destdir
    make :install
  end
end
