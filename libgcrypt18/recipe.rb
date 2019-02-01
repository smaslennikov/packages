#!/usr/bin/env ruby

class Libgcrypt18 < FPM::Cookery::Recipe
  name              'libgcrypt18'
  description       'GnuPG package for RHEL/CentOS 7: libgcrypt dependency'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '1.8.4'
  revision          '1'
  arch              'amd64'

  source            "https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-#{version}.tar.bz2"
  sha256            'f638143a0672628fde0cad745e9b14deb85dffb175709cacc1f4fe24b93f2227'

  depends           'libgpg-error >= 1.25'

  platforms [:centos, :rhel] do
    replaces          'libgcrypt20-dev'
    conflicts         'libgcrypt20-dev'
  end

  platforms [:ubuntu] do
    replaces          'libgcrypt',
                      'libgcrypt20-dev',
                      'libgcrypt-devel'
    conflicts         'libgcrypt',
                      'libgcrypt20-dev',
                      'libgcrypt-devel'
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
