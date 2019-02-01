#!/usr/bin/env ruby

class Libassuan < FPM::Cookery::Recipe
  name              'libassuan'
  description       'GnuPG package for RHEL/CentOS 7: libassuan dependency'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '2.5.2'
  revision          '1'
  arch              'amd64'

  source            "https://gnupg.org/ftp/gcrypt/libassuan/libassuan-#{version}.tar.bz2"
  sha256            '986b1bf277e375f7a960450fbb8ffbd45294d06598916ad4ebf79aee0cb788e7'

  depends           'libgpg-error >= 1.17'

  replaces          'libassuan',
                    'libassuan-devel'
  conflicts         'libassuan',
                    'libassuan-devel'

  platforms [:ubuntu] do
    post_install      'post-install'
  end

  platforms [:centos, :redhat] do
    provides          'libassuan.so.0()(64bit)',
                      'libassuan.so.0(LIBASSUAN_1.0)(64bit)'
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
