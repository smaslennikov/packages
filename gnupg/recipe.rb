#!/usr/bin/env ruby

class GnuPG < FPM::Cookery::Recipe
  name              'gnupg'
  description       'GnuPG package for RHEL/CentOS 7'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '2.2.12'
  revision          '1'
  arch              'all'

  build_depends     'libsqlite3-dev'

  depends           'libgpg-error >= 1.24',
                    'libgcrypt >= 1.7.0',
                    'libassuan >= 2.5.0',
                    'libksba >= 1.3.4',
                    'npth >= 1.2',
                    'ntbtls >= 0.1.0',
                    'sqlite-devel >= 3.0.0'

  source            "https://gnupg.org/ftp/gcrypt/gnupg/gnupg-#{version}.tar.bz2"
  sha256            'db030f8b4c98640e91300d36d516f1f4f8fe09514a94ea9fc7411ee1a34082cb'

  replaces          'gnupg2'
  conflicts         'gnupg2'

  def build
    configure :prefix => prefix, 'disable-install-doc' => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
