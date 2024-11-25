# overview

**WARNING**: these commands can be very disruptive. review each of the files and the installation target files which they will replace before executing the commands below.

after following the installation instructions, scripts in this repository will be executed automatically at the end of each `apt update`.

for each vulnerable package in testing which has been fixed in unstable, the script will create a priority 990 pin for the unstable package.

# background

from https://wiki.debian.org/DebianTesting:

> It is a good idea to install security updates from unstable since they take extra time to reach testing and the security team only releases updates to unstable. If you have unstable in your apt sources but pinned lower than testing, you can automatically add temporary pinning for packages with security issues fixed in unstable using the output of debsecan.

inspired by https://bugs.debian.org/725934

# prerequisites

these instructions assume you've cloned this repository and that it is your working directory.

these scripts assume that you are running debian testing and have enabled the unstable repositories but pinned at a lower priority by default.

this can usually be achieved by running the commands below:

**USE WITH CAUTION** and check that the output looks reasonable before proceeding.

```shell
sudo ./configure-sources.sh

sudo apt full-upgrade --autoremove --purge
```

# installation

the commands below will automate the following:

- change your sources.list to include debian testing and debian unstable
- enable the unstable repositories pinned at a lower priority
- configure debsecan to run with each `apt update`

```shell
sudo ./enable-unstable-updates.sh

sudo apt full-upgrade --autoremove --purge
```

you can view the list of packages which will be installed from unstable in `/var/lib/debsecan/apt_preferences`

# special cases

i recommend **always** running chromium and firefox from unstable.

this can be achieved with the following:

```shell
sudo cp ./unstable-packages /etc/apt/preferences.d/unstable-packages

sudo apt update

sudo apt install -y chromium firefox
```

# uninstallation

note: uninstalling will not downgrade packages to their testing versions. you will need to do this yourself or wait for the packages to catch up on their own (which should typically happen within a few weeks).

```shell
./disable-unstable-updates.sh
```
