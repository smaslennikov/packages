PACKAGE?=
PLATFORM?=centos
OPTIONS?=--no-deps

ubuntu-packages:
	sudo apt-get install -y -q \
		ruby-dev \
		ruby-bundler \
		cmake \
		libfltk1.3-dev \
		libassuan-dev \
		libgcrypt20-dev \
		libksba-dev \
		libgtk2.0-dev \
		libgpgme11-dev \
		libsqlite3-dev \
		gcc-8

install-build-deps:
	cd $(PACKAGE) bundle exec fpm-cook install-build-deps

prepare:
	bundle install --path=./.gems/ --quiet

build:
	cd $(PACKAGE) && bundle exec fpm-cook --platform $(PLATFORM) $(OPTIONS)

clean:
	cd $(PACKAGE) && bundle exec fpm-cook clean

build-all:
	set -ex; for i in $$(find . -name recipe.rb | grep -v .gems | cut -d'/' -f2); do \
		PACKAGE=$$i make clean build; \
	done
