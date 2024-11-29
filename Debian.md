missing - fonts-cascadia-code, gping


# Debian <!-- omit from toc -->

Debian running notes

Review the following:
- [Basic Setup](#basic-setup)
- [GUI Apps](#gui-apps)
- [AI Tools](#ai-tools)
- [Cloud Tools](#cloud-tools)
- [Containers](#containers)
- [Configuration](#configuration)


## References
- [Awesome TUIs](https://github.com/rothgar/awesome-tuis)

## Basic Setup

```shell
sudo apt update && sudo apt install -y \
    bash-completion \
    bat \
    btop \
    curl \
    entr \
    fdupes \
    fzf \
    gdb \
    git \
    gron \
    hyperfine \
    iotop \
    jq \
    lsd \
    lsof \
    ltrace \
    mtr \
    ncdu \
    neovim \
    ngrep \
    ntp \
    p7zip \
    pipx \
    progress \
    ranger \
    remmina \
    ripgrep \
    rmlint \
    rsync \
    sd \
    shellcheck \
    speedtest-cli \
    strace \
    syncthing \
    syncthing-gtk \
    tlp \
    tmux \
    yamllint \
    yq \
    zoxide

# Install https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install \
  aichat \
  bandwhich \
  broot \
  ctop \
  curlie \
  difftastic \
  dog \
  dua-cli \
  fd \
  hq \
  jless \
  mcfly \
  oha \
  ouch \
  procs \
  starship \
  vegeta \
  yazi \
  zellij

# Fonts
# Font Awesome and Nerd Fonts help 'lsd' show icons in the terminal
[getnf](https://github.com/getnf/getnf)

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
- [dog](https://github.com/ogham/dog): A command-line DNS client
- [dua](https://github.com/Byron/dua-cli): View disk space usage and delete unwanted data, fast
- [entr](https://github.com/eradman/entr): Run arbitrary commands when files change
- [fd](https://github.com/sharkdp/fd): A simple, fast and user-friendly alternative to 'find'
- [fdupes](https://github.com/adrianlopezroche/fdupes): Identifying or deleting duplicate files
- [fzf](https://github.com/junegunn/fzf): A command-line fuzzy finder
- [gdb](https://sourceware.org/gdb/): GNU Project debugger
- [gdu](https://github.com/dundee/gdu): Fast disk usage analyzer with console interface written in Go
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
- [starship](https://github.com/starship/starship): The minimal, blazing-fast, and infinitely customizable prompt
- [strace](https://man7.org/linux/man-pages/man1/strace.1.html): Trace system calls and signals
- [syncthing](https://syncthing.net/): Continuous file synchronization program
- [syncthing-gtk](https://github.com/kozec/syncthing-gtk): GTK3 based GUI and notification area icon for Syncthing
- [tigervnc](https://github.com/TigerVNC/tigervnc): High performance, multi-platform VNC client and server 
- [tlp](https://github.com/linrunner/TLP): Optimize Linux Laptop Battery Life
- [tmux](https://github.com/tmux/tmux): Terminal multiplexer
- [ttf-cascadia-code](https://github.com/microsoft/cascadia-code): Programming and terminal font
- [vegeta](https://github.com/tsenart/vegeta): HTTP load testing tool and library. It's over 9000!
- [yamllint](https://github.com/adrienverge/yamllint): Linter for YAML files
- [yazi](https://github.com/sxyazi/yazi): Blazing fast terminal file manager written in Rust, based on async I/O
- [yq](https://github.com/mikefarah/yq): YAML, JSON, XML, CSV, TOML and properties processor
- [zellij](https://github.com/zellij-org/zellij): A terminal workspace with batteries included 
- [zoxide](https://github.com/ajeetdsouza/zoxide): A smarter cd command

Descriptions (yay):
- [jnv](https://github.com/ynqa/jnv): Interactive JSON filter using jq

## GUI Apps

```shell
sudo apt update && sudo apt install -y \
    alacarte \
    chromium \
    copyq \
    gnome-browser-connector \
    gnome-firmware \
    gnome-software \
    gpick \
    flatpak \
    libreoffice \
    vlc \
    xclip \
    xournalpp

# Missing options for now:
- pinta
- code

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

### Office Apps

```shell

flatpak install flathub com.github.IsmaelMartinez.teams_for_linux

```

Descriptions:

- [teams-for-linux](https://github.com/IsmaelMartinez/teams-for-linux): Unofficial Microsoft Teams for Linux client

### Other GUI App

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
 
## AI Tools

```shell
# aichat installed above
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


## Cloud Tools

```shell
sudo apt update && sudo apt install -y \
    # missing for now helm \
    kubernetes-client \
    kubectx \
    # missing for now terraform

#yay --sync --noconfirm stu tflint

#yay --sync --noconfirm opentofu

pipx install awslogs --force

#yay --sync --noconfirm awsvpnclient
```

Descriptions:

- [aws-cli-v2](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html): Unified tool to manage your AWS services
- [awslogs](https://github.com/jorgebastida/awslogs): AWS CloudWatch logs for Humans
- [awsvpnclient](https://aur.archlinux.org/packages/awsvpnclient): AWS VPN Client supporting SSO
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





