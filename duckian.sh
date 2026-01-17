#!/usr/bin/env sh


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
