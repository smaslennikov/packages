#!/usr/bin/env ruby

class Libksba < FPM::Cookery::Recipe
  name              'libksba'
  description       'GnuPG package for RHEL/CentOS 7: libksba dependency'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '1.3.5'
  revision          '1'
  arch              'all'

  source            "https://gnupg.org/ftp/gcrypt/libksba/libksba-#{version}.tar.bz2"
  sha256            '41444fd7a6ff73a79ad9728f985e71c9ba8cd3e5e53358e70d5f066d35c1a340'

  replaces          'libksba',
                    'libksba-dev',
                    'libksba-devel'
  conflicts         'libksba',
                    'libksba-dev',
                    'libksba-devel'

  platforms [:centos, :redhat] do
    provides          'libksba.so.8()(64bit)'
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
