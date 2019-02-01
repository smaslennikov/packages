#!/usr/bin/env ruby

class GnuPG < FPM::Cookery::Recipe
  name              'gpg'
  description       'GnuPG package for RHEL/CentOS 7'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '2.2.12'
  revision          '1'
  arch              'all'

  build_depends     'libsqlite3-dev'

  depends           'libgpg-error >= 1.24',
                    'libgcrypt18',
                    'libassuan >= 2.5.0',
                    'libksba >= 1.3.4',
                    'npth >= 1.2',
                    'ntbtls >= 0.1.0'

  source            "https://gnupg.org/ftp/gcrypt/gnupg/gnupg-#{version}.tar.bz2"
  sha256            'db030f8b4c98640e91300d36d516f1f4f8fe09514a94ea9fc7411ee1a34082cb'

  replaces          'gpg',
                    'gnupg2',
                    'gpgv'
  conflicts         'gpg'
                    'gnupg2'
                    'gpgv'

  provides          'gpg2'

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
