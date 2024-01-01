# Debian GNU/Linux Notes and Resources

This document lists common resources, software, and helpful resources for the Debian GNU/Linux operating system.

Table of Contents:

- References
- Basic Setup
- Packages

## References

Debian GNU/Linux:

- [Debian Homepage](https://www.debian.org/)
- [Debian Wiki](https://wiki.debian.org/)
- [deb-multimedia](http://www.deb-multimedia.org/)

Desktop:

- [Gnome](https://www.gnome.org/)
- [XFCE](https://www.xfce.org/)

Learning:

- [Shell productivity tips and tricks](https://blog.balthazar-rouberol.com/shell-productivity-tips-and-tricks.html)

## Basic Setup

Run the following commands to install and configure the basics:

```bash
su root
sed -i 's/main/main contrib non-free/' /etc/apt/sources.list
apt update; apt-get -y full-upgrade

# Server Installation
apt install sudo vim ntp git tmux curl btop bmon lsd fd-find mtr ripgrep lshw build-essential apt-listbugs apt-listchanges netselect-apt apt-file rsync bash-completion dnsutils

# Desktop Installation
apt install sudo vim ntp git tmux curl btop bmon lsd fd-find mtr ripgrep lshw lshw-gtk  build-essential apt-listbugs apt-listchanges netselect-apt apt-file rsync bash-completion dnsutils alacarte pavucontrol gnote

vim /etc/sudoers # Add your account with desired permissions
exit
```

Generate an SSH key:

```bash
ssh-keygen -t ed25519 -C "<key note here>"
```

Find fastest mirror:

```bash
sudo netselect-apt -c australia -t 15 -a amd64 -n unstable
```

Change the terminal edit mode:

```bash
cd ~
echo set editor-mode vi > .inputrc
```

Install extra tools:

```bash
# Node.js version manager 'n'.
curl -L https://git.io/n-install | bash

# tldr documentation tool batch install
# https://github.com/raylee/tldr
mkdir -p ~/bin
curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
chmod +x ~/bin/tldr
echo export PATH=$PATH:~/bin >> ~/.bashrc

pip3 install pinggraph # Installs gping
```

## Packages

### Tools

- htop - Command line mornitor and task manager
- bmon (run bmon -b for bps)
- iostat
- tcpdump
- vim
- ntp
- build-essentals
- git
- apt-listbugs
- apt-listchanges
- guake
- tmux
- [tldr](https://github.com/tldr-pages/tldr) - A collection of simplified and community-driven man pages.
- zsh
- mtr
- progress

### Internet

- Chrome
- Vivaldi
- youtube-dl

### Audio

- pithos
- musescore
- handbrake
- vlc

### Video

- flowblade
- openshot
- vlc

### Images

- inkscape
- gimp

### Productivity

- liferea
- bibletime
- virtualbox
- zim
- jitsi

### Programming

- [Python3](https://wiki.debian.org/Python)
- [Spyder IDE](https://www.spyder-ide.org/) (inc: matplotlib, pandas, numpy, sympy, scipy, scikit-learn)
- [Node.js](https://nodejs.org/en/)
  - [n](https://github.com/tj/n) Node.js version manager ([n-install script](https://github.com/mklement0/n-install))
- [VSCode](https://code.visualstudio.com/)

### Games

- steam
- http://www.penguspy.com/
- freeciv
