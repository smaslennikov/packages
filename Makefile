PACKAGE?=
PLATFORM?=centos
OPTIONS?=--no-deps

ubuntu-packages:
	sudo apt-get install \
		ruby-dev \
		ruby-bundler \
		cmake \
		libfltk1.3-dev \
		libassuan-dev \
		libgcrypt20-dev \
		libksba-dev \
		libgtk2.0-dev \
		libgpgme-dev \
		libsqlite3-dev

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
