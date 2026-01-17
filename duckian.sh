#!/usr/bin/env sh


####################################################################################################


# duckian.sh
# MIT License
#
# Copyright (c) 2026 DuckAfire <https://duckafire.gitlab.io>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


####################################################################################################


# IN SUMMARY, WHAT WILL THIS DO?
# [This text snippet IS NOT a warranty, please revise the script.]
#
# Update APT package list;
#
# Install UFW (Uncomplicated FireWall) with APT;
#
# Enable UFW with its default options:
# * deny (incoming),
# * allow (outgoing),
# * disabled (routed);
#
# Disable Bluetooth on by default (it will need to be turned on manually);
#
# Try mute microphone (after this, it will stop to "heard" all);
#
# Purge default packages from LXQT 2.x with APT:
# * feathernotes,
# * libreoffice-draw,
# * libreoffice-impress,
# * libreoffice-math,
# * xsane,
# * smplayer,
# * qmmp,
# * mpv,
# * hexchat,
# * meteo-qt,
# * synaptic,
# * nano,
# * cups;
#
# Remove configuration directories (of purged packages) with `rm`:
# * "$HOME/.sane",
# * "$HOME/.config/smplayer",
# * "$HOME/.config/qmmp",
# * "$HOME/.cache/qmmp",
# * "$HOME/.config/mpv",
# * "$HOME/.config/hexchat",
# * "$HOME/.config/meteo-qt",
# * "$HOME/.local/share/nano",
# * /root/.local/share/nano,
# * /usr/share/cups,
# * /etc/ufw/applications.d/cups,
# * /etc/init.d/cups,
# * /etc/pam.d/cups,
# * /etc/cups,
# * /var/cache/cups,
# * /var/log/cups,
# * /run/cups;
#
# Install utility packages (no recommends packages; no suggests packages) with APT:
# * jq,
# * tree,
# * wget,
# * git,
# * vim-gtk3,
# * docker.io,
# * docker-cli,
# * gcc,
# * g++,
# * make,
# * cmake,
# * gdb,
# * luajit,
# * openjdk-25-jdk;
#
# Add "executor user" to Docker Group (user name is obtained through `$HOME`).
#
# Disable Docker Daemon on by default (it will need to be turned on manually);
#
# Create a black-list with Docker Networks to NetworkManager;
#
# Create `~/.duckian_bashrc` to increment `~/.bashrc`:
# * Change "Prompt" structure (header before major of user inputs),
# * Add permission mask `0077` to created files (high privacy),
# * Add directory to executable files of the user (`~/.mybin`);
#
# Add `~/.bash_aliases` with shortcuts to start/stop:
# * Bluetooth,
# * Docker Daemon;
#
# Download DuckAfire's profile repository from GitHub, or GitLab (fallback) to `~/Downloads/repo/`;
#
# Add symbilic link of `~/Downloads/repo/duckafire/mybin` to `~/.mybin/`;
#
# Run `~/Downloads/repo/duckafire/vim/update`:
# * Create `~/.vimrc` based `~/Downloads/repo/duckafire/vim/vimrc`,
# * Download plug.vim.


####################################################################################################


echo '
$$$$$$   $$   $$  $$$$$$$  $$  $$  $$$$  $$$$$$  $$   $$
$$$$$$$  $$   $$  $$$$$$$  $$  $$  $$$$  $$$$$$  $$$  $$
$$   $$  $$   $$  $$       $$  $$   $$   $$  $$  $$$$$$$
$$   $$  $$   $$  $$       $$$$$    $$   $$$$$$  $$$$$$$
$$   $$  $$   $$  $$       $$$$$    $$   $$$$$$  $$ $$$$
$$$$$$$  $$$$$$$  $$$$$$$  $$  $$  $$$$  $$  $$  $$  $$$
$$$$$$   $$$$$$$  $$$$$$$  $$  $$  $$$$  $$  $$  $$   $$

                                                      v0.0.1

Pos-installing script to Debian: 13. MIT License
duckian.sh Copyright (c) 2026 DuckAfire <https://duckafire.gitlab.io>


[!] CAUTION

  This script will do significant changes in your OS, of which many
are irreversible. Before execute this script, PLEASE:

* Revise this script;
* Do a backup of your OS;
* Have a stable internet connect;
* Have a ISO file to reinstall your OS (whether necessary); and,
* Have sure of this process will not be interrupted (it can corrupt some things).

  This script "thinks" nothing changes was done in OS after its installation,
because of this, it does not verify the existing of some "things". Please,
avoid execute this script after to do significant changes in your OS.

  This script is provided NO WARRANTY; you are the ONLY resposible of
any and all problem caused by this script in your OS after run it,
what exempt ALL MANTAINERS of this project of any and all responsability.

'


####################################################################################################


placeholder=""

echo 'Do you want to continue the execution of this script?
Yes [ENTER]
No  [^C]
'
read placeholder

echo 'DO YOU WANT TO CONTINUE THE EXECUTION OF THIS SCRIPT?
Yes [ENTER]
No  [^C]
'
read placeholder

unset placeholder
echo "Start script..."
echo 'Please, DO NOT stop this process.
'


####################################################################################################


# Please update header after
# changes these information
# (whether necessary).

# Separated with spaces.
SUPPORTED_VERSIONS="13"

# It indicates this script already was runned.
GUARD_FILE="/var/.duckian.sh"

# Common Installation Flags.
APT_CIF="-y --no-install-recommends --no-install-suggets"

TRUE=1
FALSE=0

is_true()
{
	test $1 -eq $TRUE && return $TRUE
	return $FALSE
}

is_false()
{
	test $1 -eq $FALSE && return $TRUE
	return $FALSE
}

clear_global_scope()
{
	unset SUPPORTED_VERSIONS GUARD_FILE TRUE FALSE is_true is_false
}


####################################################################################################


OS_RELEASE="$(cat /etc/os-release)"
OS_VERSION="$(echo "$OS_RELEASE" | grep 'VERSION_ID' | grep -Po '\d+')"
OS_NAME="$(echo "$OS_RELEASE" | grep '^ID' | grep -Po '[a-z]+')"

is_supported_version=$FALSE
guard_errors=0

inc_gerr()
{
	guard_errors=$(($guard_errors + 1))
}

if [ "$(whoami)" != "root" ]
then
	echo "Run this script as Super User."
	inc_gerr
fi

if [ "$OS_NAME" = "debian" ]
then
	for v in $SUPPORTED_VERSIONS
	do
		if [ "$v" = "$OS_VERSION" ]
		then
			is_supported_version=$TRUE
			break
		fi
	done

	if is_false $is_supported_version
	then
		echo "Unsuppoted Debian version: \"$OS_VERSION\"."
		echo "Expecting one of these: $SUPPORTED_VERSIONS."
		inc_gerr
	fi
else
	echo "Unsupported Linux Distribution: \"$OS_NAME\"."
	echo "Expecting: Debain."
	inc_gerr
fi

if [ -f "$GUARD_FILE" ]
then
	echo "This script already was runned."
	inc_gerr
fi

clear_global_scope
unset OS_RELEASE OS_VERSION OS_NAME is_supported_version guard_error inv_gerr
test $guard_errors -eq 0 && exit $guard_errors


####################################################################################################


echo "$(date)"'
This OS was configured using `duckian.sh`,
from:
	* https://github.com/duckafire/duckafire
	* https://gitlab.com/duckafire/duckafire
' > "$GUARD_FILE"

apt update

# Uncomplicated FireWall; good to common users;
# using default configurations.
apt install $APT_CIF ufw
ufw enable

systemctl bluetooth --now disable

# Turn off microphone.
amixer set Capture nocap


####################################################################################################
