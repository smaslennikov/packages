#!/usr/bin/env ruby

class Ntbtls < FPM::Cookery::Recipe
  name              'ntbtls'
  description       'GnuPG package for RHEL/CentOS 7: ntbtls dependency'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '0.1.2'
  revision          '1'
  arch              'all'

  source            "https://gnupg.org/ftp/gcrypt/#{name}/#{name}-#{version}.tar.bz2"
  sha256            '8240db84e50c2351b19eb8064bdfd4d25e3c157d37875c62e335df237d7bdce7'

  build_depends     'libgcrypt20-dev',
                    'libksba-dev'

  depends           'libgpg-error >= 1.17',
                    'libgcrypt >= 1.6.0',
                    'libassuan >= 2.5.0',
                    'npth >= 1.2'

  replaces          'ntbtls',
                    'ntbtls-devel'
  conflicts         'ntbtls',
                    'ntbtls-devel'

  def build
    configure :prefix => prefix, 'disable-install-doc' => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
