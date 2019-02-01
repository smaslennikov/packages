PACKAGE?=
PLATFORM?=centos
OPTIONS?=--no-deps

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

build-all:
	for i in $$(find . -name recipe.rb | grep -v .gems | cut -d'/' -f2); do \
		PACKAGE=$$i $(MAKE) clean build; \
	done

travis-build:
	for i in libgpg-error \
			libassuan \
			libgcrypt \
			libksba \
			npth \
			ntbtls \
			pinentry \
			gnupg; do \
		PACKAGE=$$i PLATFORM=ubuntu $(MAKE) clean build; \
		sudo dpkg -i $(PACKAGE)/pkg/*deb; \
	done
