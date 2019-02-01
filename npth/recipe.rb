#!/usr/bin/env ruby

class Npth < FPM::Cookery::Recipe
  name              'npth'
  description       'GnuPG package for RHEL/CentOS 7: npth dependency'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '1.6'
  revision          '1'
  arch              'all'

  source            "https://gnupg.org/ftp/gcrypt/npth/npth-#{version}.tar.bz2"
  sha256            '1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1'

  replaces          'npth',
                    'libnpth0',
                    'npth-devel'
  conflicts         'npth',
                    'libnpth0',
                    'npth-devel'

  def build
    configure :prefix => prefix, 'disable-install-doc' => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
