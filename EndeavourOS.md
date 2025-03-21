# EndeavourOS <!-- omit from toc -->

EndeavourOS running notes

Review the following:
- [Basic Setup](#basic-setup)
- [Laptop Battery Management](#laptop-battery-management)
- [GUI Apps](#gui-apps)
  - [Alacarte](#alacarte)
  - [Office Apps](#office-apps)
  - [Other GUI Apps](#other-gui-apps)
- [Programming](#programming)
- [AI Tools](#ai-tools)
  - [Terminal AI Clients](#terminal-ai-clients)
  - [Local LLMs](#local-llms)
- [Cloud Tools](#cloud-tools)
- [Containers](#containers)
- [Configuration](#configuration)
  - [Blue Tooth](#blue-tooth)


## References
- [Awesome TUIs](https://github.com/rothgar/awesome-tuis)

## Basic Setup

```shell
sudo pacman --refresh --sync \
    aichat \
    bandwhich \
    bash-completion \
    bat \
    broot \
    btop \
    ctop \
    curlie \
    difftastic \
    diskus \
    dog \
    dua-cli \
    entr \
    fd \
    fdupes \
    fzf \
    gdb \
    ghostty \
    git \
    gping \
    gron \
    hq \
    hyperfine \
    iotop \
    jless \
    jq \
    lsd \
    lsof \
    ltrace \
    mcfly \
    mtr \
    ncdu \
    neovim \
    ngrep \
    ntp \
    oha \
    ouch \
    p7zip \
    procs \
    progress \
    python-pipx \
    ranger \
    remmina \
    ripgrep \
    rmlint \
    rsync \
    sd \
    shellcheck \
    speedtest-cli \
    starship \
    strace \
    syncthing \
    tigervnc \
    tmux \
    ttf-cascadia-code \
    vegeta \
    yamllint \
    yazi \
    yq \
    zellij \
    zoxide

yay --sync jnv

yay --sync syncthing-gtk

# Fonts
# Font Awesome and Nerd Fonts help 'lsd' show icons in the terminal
sudo pacman --sync --noconfirm \
    otf-cascadia-code \
    otf-font-awesome \
    nerd-fonts

# For Gnome
sudo pacman --sync hunspell-en_au

# Network Monitoring
sudo pacman --sync vnstat
sudo systemctl enable vnstat
sudo systemctl start vnstat

# Time sync
sudo systemctl enable ntpd
sudo systemctl start ntpd

# Ghostty Config
# .config/ghostty/config
# font-size = 18
# theme = Breeze

# Starship Config (https://starship.rs/config/)
# .config/starship.toml
# Places the directory on the second line
format = '$all$directory$character'
```

Descriptions (pacman):

- [aichat](https://github.com/sigoden/aichat): All-in-one AI CLI tool
- [bandwhich](https://github.com/imsnif/bandwhich): Terminal bandwidth utilization tool
- [bash-completion](https://github.com/scop/bash-completion): Programmable completion functions for bash
- [bat](https://github.com/sharkdp/bat): A cat clone with syntax highlighting and Git integration
- [broot](https://github.com/Canop/broot): A new way to see and navigate directory trees
- [btop](https://github.com/aristocratos/btop): A monitor of resources
- [ctop](https://github.com/bcicen/ctop): Top-like interface for container metrics
- [curlie](https://github.com/rs/curlie): The power of curl, the ease of use of httpie
- [difftastic](https://github.com/Wilfred/difftastic): A structural diff that understands syntax
- [diskus](https://github.com/sharkdp/diskus): A minimal, fast alternative to 'du -sh' 
- [dog](https://github.com/ogham/dog): A command-line DNS client
- [dua](https://github.com/Byron/dua-cli): View disk space usage and delete unwanted data, fast
- [entr](https://github.com/eradman/entr): Run arbitrary commands when files change
- [fd](https://github.com/sharkdp/fd): A simple, fast and user-friendly alternative to 'find'
- [fdupes](https://github.com/adrianlopezroche/fdupes): Identifying or deleting duplicate files
- [fzf](https://github.com/junegunn/fzf): A command-line fuzzy finder
- [gdb](https://sourceware.org/gdb/): GNU Project debugger
- [gdu](https://github.com/dundee/gdu): Fast disk usage analyzer with console interface written in Go
- [Ghostty](https://ghostty.org/): Ghostty is a fast, feature-rich, and cross-platform terminal emulator
- [git](https://git-scm.com/): Source code management
- [gping](https://github.com/orf/gping): Ping, but with a graph
- [gron](https://github.com/FGRibreau/gron): Make JSON greppable!
- [hq](https://github.com/coderobe/hq): A HTML processor inspired by jq
- [hyperfine](https://github.com/sharkdp/hyperfine): A command-line benchmarking tool
- [iotop](https://github.com/Tomas-M/iotop): A top utility for IO
- [jless](https://github.com/PaulJuliusMartinez/jless): JSON viewer designed for reading, exploring, and searching through JSON data
- [jq](https://github.com/jqlang/jq): Command-line JSON processor
- [lsd](https://github.com/lsd-rs/lsd): The next gen ls command
- [lsof](https://github.com/lsof-org/lsof): List open files
- [ltrace](https://www.man7.org/linux/man-pages/man1/ltrace.1.html): A library call tracer
- [mcfly](https://github.com/cantino/mcfly): McFly replaces your default ctrl-r shell history search
- [mtr](https://github.com/traviscross/mtr): Combines the functionality of traceroute and ping into one tool
- [neovim](https://github.com/neovim/neovim) (nvim): Better vim
- [ngrep](https://github.com/jpr5/ngrep): GNU grep applied to the network layer
- [ntp](https://en.wikipedia.org/wiki/Network_Time_Protocol): Time sync
- [oha](https://github.com/hatoo/oha): HTTP load generator
- [ouch](https://github.com/ouch-org/ouch): Painless compression and decompression in the terminal
- [p7zip](https://7-zip.org/): File archiver with a high compression ratio
- [procs](https://github.com/dalance/procs): A modern replacement for ps written in Rust
- [progress](https://github.com/Xfennec/progress/tree/master): Displays percentage of running core util commands
- [pipx](https://github.com/pypa/pipx): Install and Run Python Applications in Isolated Environments 
- [ranger](https://github.com/ranger/ranger): A VIM-inspired filemanager for the console
- [remmina](https://gitlab.com/Remmina/Remmina): The GTK Remmina Remote Desktop Client
- [ripgrep](https://github.com/BurntSushi/ripgrep) (rg): Better file text search
- [rmlint](https://github.com/sahib/rmlint): Extremely fast tool to remove duplicates and other lint from your filesystem
- [rsync](https://en.wikipedia.org/wiki/Rsync): Efficiently transferring and synchronizing files between a computer and a storage
- [sd](https://github.com/chmln/sd): Intuitive find & replace CLI (sed alternative)
- [shellcheck](https://www.shellcheck.net/): Finds bugs in your shell scripts
- [speedtest-cli](https://github.com/sivel/speedtest-cli): Command line network speed test
- [starship](https://github.com/starship/starship) ([config](https://starship.rs/config/)): The minimal, blazing-fast, and infinitely customizable prompt
- [strace](https://man7.org/linux/man-pages/man1/strace.1.html): Trace system calls and signals
- [syncthing](https://syncthing.net/): Continuous file synchronization program
- [syncthing-gtk](https://github.com/kozec/syncthing-gtk): GTK3 based GUI and notification area icon for Syncthing
- [tigervnc](https://github.com/TigerVNC/tigervnc): High performance, multi-platform VNC client and server 
- [tmux](https://github.com/tmux/tmux): Terminal multiplexer
- [ttf-cascadia-code](https://github.com/microsoft/cascadia-code): Programming and terminal font
- [vegeta](https://github.com/tsenart/vegeta): HTTP load testing tool and library. It's over 9000!
- [vnstat](https://github.com/vergoh/vnstat): A network traffic monitor for Linux and BSD
- [yamllint](https://github.com/adrienverge/yamllint): Linter for YAML files
- [yazi](https://github.com/sxyazi/yazi): Blazing fast terminal file manager written in Rust, based on async I/O
- [yq](https://github.com/mikefarah/yq): YAML, JSON, XML, CSV, TOML and properties processor
- [zellij](https://github.com/zellij-org/zellij): A terminal workspace with batteries included 
- [zoxide](https://github.com/ajeetdsouza/zoxide): A smarter cd command

Descriptions (yay):
- [jnv](https://github.com/ynqa/jnv): Interactive JSON filter using jq

## Laptop Battery Management

[TLP](https://wiki.archlinux.org/title/TLP)

```shell
sudo pacman --refresh --sync tlp
sudo systemctl enable tlp.service
sudo systemctl start tlp.service
yay --sync tlpui

# ThinkPads Only
yay --refresh --sync threshy threshy-gui
```

- [tlp](https://github.com/linrunner/TLP): Optimize Linux Laptop Battery Life

## GUI Apps

```shell
sudo pacman --sync --noconfirm \
    alacarte \
    chromium \
    code \
    copyq \
    gnome-browser-connector \
    gnome-firmware \
    gnome-software \
    gpick \
    flatpak \
    libreoffice-fresh \
    pinta \
    vlc \
    xclip \
    xournalpp

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# https://flathub.org/setup/EndeavourOS
# Restart

flatpak install flathub info.beyondallreason.bar
flatpak install flathub net.nokyan.Resources
```

Descriptions:

- [Alacarte](https://gitlab.gnome.org/GNOME/alacarte): Menu editor for GNOME using the freedesktop.org menu specification.
- [chromium](https://www.chromium.org/chromium-projects/): Open-source browser project
- [code](https://github.com/microsoft/vscode): Visual Studio Code
- [copyq](https://github.com/hluk/CopyQ): Clipboard manager with advanced features
- [gnome-browser-connector](https://wiki.gnome.org/Projects/GnomeShellIntegration/Installation): Native host messaging connector
- [Gpick](https://www.gpick.org/): Advanced color picker and palette editing tool
- [flatpak](https://flathub.org/): Apps for Linux
- [LibreOffice](https://www.libreoffice.org/): Free Office Suite
- [Pinta](https://www.pinta-project.com/): Pinta is a free, open source program for drawing and image editing
- [Resources](https://github.com/nokyan/resources): Keep an eye on system resources
- [vlc](https://www.videolan.org/): Open source cross-platform multimedia player and framework
- [xclip](https://github.com/astrand/xclip): Command line interface to the X11 clipboard
- [Xournal++](https://xournalpp.github.io/): Take handwritten notes with ease

### Alacarte

Alacarte (Main Menu) created icons don't always comply with the Gnome pinned icon configurations.

If you find a pinned app, when launched, creates a new icon on the launcher, do the following:

```shell
# Get the WMClass
xprop | grep WM_CLASS # Then click the app window

# Add the StartupWMClass to the desktop file
ls ~/.local/share/applications/
nvim ~/.local/share/applications/alacarte-made.desktop # or the correct file
# Add:
# StartupWMClass=<value-from-xprop>
```

### Office Apps

```shell

yay -S teams-for-linux

```

Descriptions:

- [teams-for-linux](https://github.com/IsmaelMartinez/teams-for-linux): Unofficial Microsoft Teams for Linux client

### Other GUI Apps

- Open-Source API Clients:
  - [bruno](https://www.usebruno.com/): Fast and Git-Friendly Opensource API client
  - [Firecamp](https://firecamp.dev/): Developer-first OpenSource API DevTool, Postman/Insomnia alternative.
  - [Keyploy](https://keploy.io/): Open-source, developer-centric backend testing tool
- [Parabolic](https://github.com/NickvisionApps/Parabolic): Download web video and audio (YouTube Downloader)
- [Ticket Booth](https://flathub.org/apps/me.iepure.Ticketbooth): Keep track of your favorite shows
- [Upscaler](https://flathub.org/apps/io.gitlab.theevilskeleton.Upscaler): Upscale and enhance a given image
- [Warehouse](https://flathub.org/apps/io.github.flattool.Warehouse): Manages installed Flatpaks, their user data, and Flatpak remotes
- File sharing:
  - [Warp](https://apps.gnome.org/Warp/): Fast and secure file transfer
  - [zrok](https://zrok.io/): Open source sharing solution built on OpenZiti, the zero trust networking platform

## Programming

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sudo pacman --sync deno go lua rust zig

yay --sync nvm

nvm install node

# D-Bus Monitoring
sudo pacman --sync bustle d-spy
```

Aqua for GitHub releases: https://aquaproj.github.io/

```
export PATH="${PATH}:${HOME}/.local/share/aquaproj-aqua/bin
```
 
## AI Tools

### Terminal AI Clients
```shell
# aichat installed with pacman above
nvim ~/.config/aichat/config.yaml
```

```yaml
model: openai:gpt-4o
stream: true
keybindings: vim
editor: nvim
wrap: auto
wrap_code: false
clients:
- type: openai
  api_key: null
```

- [aichat](https://github.com/sigoden/aichat): All-in-one AI CLI tool

### Local LLMs

```shell
# Make sure the electron depencency is the right version
# Read the command output and don't install the source version of electron
yay --sync ollama anythingllm-desktop-bin electron26-bin
```

Descriptions:

- [Ollama](https://ollama.com/): Get up and running with large language models
- [Anything LLM](https://github.com/Mintplex-Labs/anything-llm): All-in-one AI app you were looking for

## Cloud Tools

```shell
sudo pacman --sync \
    dagger \
    helm \
    kubectl \
    kubectx \
    terraform

yay --sync --noconfirm stu tflint

yay --sync --noconfirm opentofu

pipx install awslogs --force

yay --sync --noconfirm awsvpnclient
```

Descriptions:

- [aws-cli-v2](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html): Unified tool to manage your AWS services
- [awslogs](https://github.com/jorgebastida/awslogs): AWS CloudWatch logs for Humans
- [awsvpnclient](https://aur.archlinux.org/packages/awsvpnclient): AWS VPN Client supporting SSO
- [dagger](https://dagger.io/): An engine to run your pipelines in containers 
- [kubectl](https://kubernetes.io/docs/tasks/tools/): Kubernetes command-line tool
- [kubectx](https://github.com/ahmetb/kubectx) (includes kubens): Faster way to switch between clusters and namespaces in kubectl
- [opentofu](https://opentofu.org/): The open source infrastructure as code tool
- [stu](https://github.com/lusingander/stu): TUI (Terminal/Text UI) application for AWS S3 Bucket
- [terraform](https://www.terraform.io/): Infrastructure automation to provision and manage resources in any cloud or data center
- [tflint](https://github.com/terraform-linters/tflint): A Pluggable Terraform Linter
- [helm](https://helm.sh/): Package manager for Kubernetes

## Containers

Containers using podman:

```shell
sudo pacman --sync \
  podman \
  buildah \
  cockpit-podman
```

Docker runtime:

```shell
sudo pacman -S docker docker-compose minikube
# Restart
minikube start
```

## Configuration

### Bluetooth

[Bluetooth - ArchWiki](https://wiki.archlinux.org/title/bluetooth)

```shell
sudo pacman --refresh --sync bluez bluez-utils
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
```

