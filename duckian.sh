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
# Add "executor user" to Docker Group.
#
# Disable Docker Daemon on by default (it will need to be turned on manually);
#
# Create a black-list with Docker Networks to NetworkManager;
#
# Increment `~/.bashrc`:
# * Change "Prompt" structure (header before major of user inputs),
# * Add permission mask `0077` to created files (high privacy),
# * Add directory to executable files of the user (`~/.mybin`);
#
# Add `~/.bash_aliases` with shortcuts to start/stop:
# * Bluetooth,
# * Docker Daemon,
# * Microphone;
#
# Try to download DuckAfire's profile repository from GitHub, or GitLab (fallback) to `~/Downloads/repo/`;
#
# Try to add symbilic link of `~/Downloads/repo/duckafire/mybin` to `~/.mybin/`;
#
# Try to run `~/Downloads/repo/duckafire/vim/update`:
# * Create `~/.vimrc` based `~/Downloads/repo/duckafire/vim/vimrc`,
# * Download plug.vim.
#
# Ask whether you want to reboot your OS after to run this script.


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
* Have a ISO file to reinstall your OS (whether necessary);
* Have sure of this process will not be interrupted (it can corrupt some things); and
* Execute this using `sudo` (do not use `su` directly, because it will attribute file to Super User, instead your "main" user).

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
YES [ENTER]
NO  [^C]
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

set -u

TRUE=0
FALSE=1

# Separated with spaces.
SUPPORTED_VERSIONS="13"

# It indicates this script already was runned.
GUARD_FILE="/var/.duckian.sh"

# It is not using `whoami` because it will
# return "root".
USER_NAME="$(basename "$HOME")"

NET_MAN_BLACK_LIST="/etc/NetworkManager/conf.d/docker-unmanaged.conf"

# Common Installation Flags.
APT_CIF="-y --no-install-recommends --no-install-suggests"

# Directory to store Git repositories.
REPO_DIR="$HOME/Downloads/repo"

# It contains user executable files.
MYBIN_DIR="$HOME/.mybin"

# Symbolic link to `~/Downloads/repo/duckafire/mybin`.
DUCKBIN_DIR="$HOME/.duckbin"

clear_global_scope()
{
	unset TRUE FALSE SUPPORTED_VERSIONS GUARD_FILE USER_NAME NET_MAN_BLACK_LIST APT_CIF MYBIN_DIR DUCKBIN_DIR
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
	echo "Run this script using \`sudo\`."
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

	if $is_supported_version -eq $FALSE
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

if [ "$(echo "$XDG_CURRENT_DESKTOP" | tr '[:upper:]' '[:lower:]')" != "lxqt" ]
then
	echo "Unsupported desktop environment: \"$XDG_CURRENT_DESKTOP\"."
	echo "Expecting: lxqt"
	inc_gerr
fi

unset OS_RELEASE OS_VERSION OS_NAME is_supported_version guard_errors

if [ $guard_errors -ne 0 ]
then
	clear_global_scope
	exit $guard_errors
fi


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
ufw --force enable

systemctl disable --now bluetooth

# Turn off microphone.
amixer set Capture nocap


####################################################################################################


purge_packages='feathernotes
libreoffice-draw
libreoffice-impress
libreoffice-math
xsane
smplayer
qmmp
mpv
hexchat
meteo-qt
synaptic
nano
cups'

purge_conf=''"$HOME"'/.sane/xsane"
'"$HOME"'/.config/smplayer"
'"$HOME"'/.config/qmmp"
'"$HOME"'/.cache/qmmp"
'"$HOME"'/.config/mpv"
'"$HOME"'/.config/hexchat"
'"$HOME"'/.config/meteo-qt"
'"$HOME"'/.local/share/nano"
/root/.local/share/nano
/usr/share/cups
/etc/ufw/applications.d/cups
/etc/init.d/cups
/etc/pam.d/cups
/etc/cups
/var/cache/cups
/var/log/cups
/run/cups'

install_packages='jq
tree
wget
git
vim
docker.io
docker-cli
gcc
g++
make
cmake
gdb
luajit
openjdk-25-jdk'

apt purge -y $purge_packages
rm -rf $purge_conf
apt autoremove -y

apt install $APT_CIF $install_packages

unset purge_packages purge_conf install_packages


####################################################################################################


usermod -aG docker "$USER_NAME"
systemctl disable --now docker

echo '[keyfile]
unmanaged-devices=interface-name:docker0;interface-name:br-*
' > "$NET_MAN_BLACK_LIST"

# Apply black-list.
systemctl reload NetworkManager


####################################################################################################


echo '
### START: from duckian.sh

# Set "title text" in terminals
case "$TERM" in
	xterm-color|*-256color)
		PS1='"'"'${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\]\$ '"'"'
		;;
	xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
		;;
	*)
		PS1='"'"'${debian_chroot:+($debian_chroot)}\w\$ '"'"'
		;;
esac

# Define permission to created
# files (RW to OWNER).
umask 0077

# Set directory to user customized
# executable files.
PATH="$PATH:'"$MYBIN:$DUCKBIN"'"

### END: duckian.sh
' >> "$HOME/.bashrc"

mkdir "$MYBIN_DIR"


####################################################################################################

# CREATE ~/.bash_aliases
echo '### START: duckian.sh
alias BLUE_ON="sudo systemctl start bluetooth"
alias BLUE_OFF="sudo systemctl stop bluetooth"

alias DOCKER_ON="sudo systemctl start docker"
alias DOCKER_OFF="sudo systemctl stop docker"

alias MP_ON="amixer set Capture cap"
alias MP_OFF="amixer set Capture nocap"
### END: duckian.sh
' > "$HOME/.bash_aliases"


####################################################################################################


test ! -d "$REPO_DIR" && mkdir --parents "$REPO_DIR"
(
	cd "$REPO_DIR"

	if git clone "https://github.com/duckafire/duckafire" # gitHUB
	|| git clone "https://gitlab.com/duckafire/duckafire" # gitLAB (fallback)
	then
		ln -s "./duckafire/mybin" "$HOME/.duckbin"
		./duckafire/vim/update
	else
		mkdir --parents "$HOME/.vim/autoload" "$HOME/.vim/backup" "$HOME/.vim/swap"

		# This has a fallback.
		wget --quiet --output-document="$HOME/.vimrc" "https://raw.githubusercontent.com/duckafire/duckafire/refs/heads/main/vim/vimrc" || wget --quiet --output-document="$HOME/.vimrc" "https://gitlab.com/duckafire/duckafire/-/raw/main/vim/vimrc?ref_type=heads"

		wget --quiet --output-document="$HOME/.vim/autoload/plug.vim" "https://www.vim.org/scripts/download_script.php?src_id=23826"
	fi

	# Silent failure.
)


####################################################################################################


clear_global_scope

echo 'Do you want to reboot your OS now?
Yes [ENTER]
No  [^C]
'
read placeholder

echo 'DO YOU WANT TO REBOOT YOUR OS NOW?
YES [ENTER]
NO  [^C]
'
read placeholder

unset placeholder
reboot


####################################################################################################
