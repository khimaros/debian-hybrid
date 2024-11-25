install:
	ifneq ($(shell id -u), 0)
	sudo make $@
else
	apt-get -u -y install debsecan
	rm /etc/apt/sources.list
	install -o root -g apt -m 0644 trixie.sources /etc/apt/sources.list.d/
	install -o root -g apt -m 0644 99debsecan /etc/apt/apt.conf.d/
	install -o root -g adm -m 0755 debsecan-apt-priority /usr/sbin/
	install -o root -g apt -m 0644 pinning /etc/apt/preferences.d/20non-default
	install -o root -g apt -m 0644 unstable-packages /etc/apt/preferences.d/
endif
uninstall:
	ifneq ($(shell id -u), 0)
	sudo make $@
else
	rm /etc/apt/sources.list.d/trixie.sources
	rm /etc/apt/apt.conf.d/99debsecan
	rm /usr/sbin/debsecan-apt-priority
	rm /etc/apt/preferences.d/20non-default
	rm /etc/apt/preferences.d/unstable-packages
	sed 's/bookworm/trixie/g' /usr/share/doc/apt/examples/sources.list > /etc/apt/sources.list
endif
