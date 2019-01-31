#!/usr/bin/env ruby

class Pinentry < FPM::Cookery::Recipe
  name              'pinentry'
  description       'GnuPG package for RHEL/CentOS 7: pinentry dependency'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '1.1.0'
  revision          '1'
  arch              'all'

  source            "https://gnupg.org/ftp/gcrypt/pinentry/pinentry-#{version}.tar.bz2"
  sha256            '68076686fa724a290ea49cdf0d1c0c1500907d1b759a3bcbfbec0293e8f56570'

  build_depends     'libfltk1.3-dev',
                    'libassuan >= 2.1.0'

  depends           'libgpg-error >= 1.16',
                    'libassuan >= 2.1.0'

  replaces          'pinentry',
                    'pinentry-devel'
  conflicts         'pinentry',
                    'pinentry-devel'

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
