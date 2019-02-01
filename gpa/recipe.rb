#!/usr/bin/env ruby

class Gpa < FPM::Cookery::Recipe
  name              'gpa'
  description       'GnuPG package for RHEL/CentOS 7: optional gpa dependency'
  maintainer        'Svyatoslav I. Maslennikov <me@smaslennikov.com>'
  section           'main'

  version           '0.10.0'
  revision          '1'
  arch              'all'

  source            "https://gnupg.org/ftp/gcrypt/#{name}/#{name}-#{version}.tar.bz2"
  sha256            '95dbabe75fa5c8dc47e3acf2df7a51cee096051e5a842b4c9b6d61e40a6177b1'

  build_depends     'libgtk2.0-dev',
                    'libgpgme-dev'

  replaces          'gpa',
                    'gpa-devel'
  conflicts         'gpa',
                    'gpa-devel'

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
