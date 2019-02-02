#!/usr/bin/env ruby

class Pinentry < FPM::Cookery::Recipe
  name              'pinentry'
  description       'GnuPG package for RHEL/CentOS 7: pinentry dependency'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '1.1.0'
  revision          '1'
  arch              'amd64'

  source            "https://gnupg.org/ftp/gcrypt/pinentry/pinentry-#{version}.tar.bz2"
  sha256            '68076686fa724a290ea49cdf0d1c0c1500907d1b759a3bcbfbec0293e8f56570'

  build_depends     'libfltk1.3-dev',
                    'libassuan >= 2.1.0'

  platforms [:ubuntu] do
    depends           'libgpg-error0 >= 1.16',
                      'libassuan >= 2.1.0'
  end

  platforms [:centos, :redhat] do
    depends           'libgpg-error >= 1.16',
                      'libassuan >= 2.1.0'
  end

  replaces          'pinentry',
                    'pinentry-curses',
                    'pinentry-devel'
  conflicts         'pinentry',
                    'pinentry-curses',
                    'pinentry-devel'

  def build
    configure :prefix => prefix, 'disable-install-doc' => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir

    # remove info listing in wait of resolution https://github.com/bernd/fpm-cookery/issues/205
    FileUtils.rm_r(destdir('usr/share'))
  end
end
