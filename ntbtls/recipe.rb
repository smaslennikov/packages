#!/usr/bin/env ruby

class Ntbtls < FPM::Cookery::Recipe
  name              'ntbtls'
  description       'GnuPG package for RHEL/CentOS 7: ntbtls dependency'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '0.1.2'
  revision          '1'
  arch              'amd64'

  source            "https://gnupg.org/ftp/gcrypt/#{name}/#{name}-#{version}.tar.bz2"
  sha256            '8240db84e50c2351b19eb8064bdfd4d25e3c157d37875c62e335df237d7bdce7'

  build_depends     'libgcrypt',
                    'libksba-dev'

  platforms [:ubuntu] do
    depends           'libgpg-error0 >= 1.17',
                      'libgcrypt20',
                      'libassuan >= 2.5.0',
                      'npth >= 1.2'
  end

  platforms [:centos, :redhat] do
    depends           'libgpg-error >= 1.17',
                      'libgcrypt20',
                      'libassuan >= 2.5.0',
                      'npth >= 1.2'
  end

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
