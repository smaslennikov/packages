#!/usr/bin/env ruby

class Libassuan < FPM::Cookery::Recipe
  name              'libassuan'
  description       'GnuPG package for RHEL/CentOS 7: libassuan dependency'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '2.5.2'
  revision          '1'
  arch              'all'

  source            "https://gnupg.org/ftp/gcrypt/libassuan/libassuan-#{version}.tar.bz2"
  sha256            '986b1bf277e375f7a960450fbb8ffbd45294d06598916ad4ebf79aee0cb788e7'

  depends           'libgpg-error >= 1.17'

  replaces          'libassuan',
                    'libassuan-devel'
  conflicts         'libassuan',
                    'libassuan-devel'

  def build
    configure :prefix => prefix, 'disable-install-doc' => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
