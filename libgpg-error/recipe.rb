#!/usr/bin/env ruby

class Libgpgerror < FPM::Cookery::Recipe
  platforms [:centos, :redhat] do
    name              'libgpg-error'
  end

  platforms [:ubuntu] do
    name              'libgpg-error0'
  end

  description       'GnuPG package for RHEL/CentOS 7: libgpg-error dependency'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '1.35'
  revision          '1'
  arch              'all'

  source            "https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-#{version}.tar.bz2"
  sha256            'cbd5ee62a8a8c88d48c158fff4fc9ead4132aacd1b4a56eb791f9f997d07e067'

  replaces          'libgpg-error',
                    'libgpg-error-dev',
                    'libgpg-error0'
  conflicts         'libgpg-error',
                    'libgpg-error-dev',
                    'libgpg-error0'

  platforms [:centos, :redhat] do
    provides          'libgpg-error.so.0()(64bit)'
  end

  platforms [:ubuntu] do
    provides          'libgpg-error',
                      'libgpg-error-dev',
                      'libgpg-error0'
  end

  def build
    configure :prefix => prefix, 'disable-install-doc' => true
  end

  def install
    make :install, 'DESTDIR' => destdir

    # remove info listing in wait of resolution https://github.com/bernd/fpm-cookery/issues/205
    FileUtils.rm_r(destdir('usr/share/info/'))
  end
end
