PACKAGE?=
PLATFORM?=centos
OPTIONS?=--no-deps

ubuntu-packages:
	sudo apt-get install -y -q \
		ruby-dev \
		ruby-bundler \
		cmake \
		libsqlite3-dev

prepare:
	bundle install --path=./.gems/ --quiet

build:
	cd $(PACKAGE) && \
		bundle exec fpm-cook --platform $(PLATFORM) $(OPTIONS)

clean:
	cd $(PACKAGE) && \
		bundle exec fpm-cook clean && \
		rm -rf tmp-dest \
			tmp-build \
			cache \
			pkg

install:
	sudo dpkg -i $(PACKAGE)/pkg/*deb

build-all:
	set -ex; \
	for i in $$(find . -name recipe.rb | grep -v .gems | cut -d'/' -f2); do \
		PACKAGE=$$i $(MAKE) clean build; \
	done

travis-build-install:
	PLATFORM=ubuntu $(MAKE) clean build install

travis-build-in-order:
	set -ex; \
	for i in libgpg-error \
			libassuan \
			libgcrypt \
			libksba \
			npth \
			ntbtls \
			pinentry \
			gnupg; do \
		PACKAGE=$$i $(MAKE) travis-build-install; \
	done
	PLATFORM=centos $(MAKE) build-all
