install:
ifneq ($(shell id -u), 0)
	sudo make $@
else
	apt-get -u -y install debsecan
	rm -f /etc/apt/sources.list
	install -o root -g root -m 0644 trixie.sources /etc/apt/sources.list.d/
	install -o root -g root -m 0644 sid.sources /etc/apt/sources.list.d/
	install -o root -g root -m 0644 99debsecan /etc/apt/apt.conf.d/
	install -o root -g root -m 0755 debsecan-apt-priority /usr/sbin/
	install -o root -g root -m 0644 pinning /etc/apt/preferences.d/20non-default
	apt-get update
	apt-cache policy
endif
uninstall:
ifneq ($(shell id -u), 0)
	sudo make $@
else
	rm -vf /etc/apt/sources.list.d/trixie.sources
	rm -vf /etc/apt/sources.list.d/sid.sources
	rm -vf /etc/apt/apt.conf.d/99debsecan
	rm -vf /usr/sbin/debsecan-apt-priority
	rm -vf /etc/apt/preferences.d/20non-default
	rm -vf /etc/apt/preferences.d/unstable-packages
	sed 's/bookworm/trixie/g' /usr/share/doc/apt/examples/sources.list > /etc/apt/sources.list
	apt-get update
	apt-cache policy
endif
browser:
ifneq ($(shell id -u), 0)
	sudo make $@
else
	install -o root -g root -m 0644 unstable-packages /etc/apt/preferences.d/
	apt-get update
	apt-cache policy chromium firefox
endif
