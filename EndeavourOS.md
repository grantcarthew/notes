# EndeavourOS <!-- omit from toc -->

EndeavourOS running notes

Review the following:
- [Basic Setup](#basic-setup)
- [GUI Apps](#gui-apps)
- [Cloud Tools](#cloud-tools)

## References
- [Awesome TUIs](https://github.com/rothgar/awesome-tuis)

## Basic Setup

```shell
sudo pacman -Sy \
    bandwhich \
    bash-completion \
    bat \
    broot \
    btop \
    ctop \
    curlie \
    dog \
    dua-cli \
    entr \
    fd \
    fdupes \
    fzf \
    git \
    gping \
    hq \
    jq \
    lsd \
    mcfly \
    mtr \
    ncdu \
    neovim \
    ngrep \
    ntp \
    ouch \
    procs \
    progress \
    python-pipx \
    ranger \
    ripgrep \
    rsync \
    shellcheck \
    speedtest-cli \
    tlp \
    tmux \
    ttf-cascadia-code \
    yamllint \
    yq

yay -S jnv

# Fonts
# Font Awesome and Nerd Fonts help 'lsd' show icons in the terminal
sudo pacman -S \
    otf-cascadia-code \
    otf-font-awesome \
    nerd-fonts

# For Gnome
sudo pacman -S hunspell-en_au

# Time sync
sudo systemctl enable ntpd
sudo systemctl start ntpd
```

Descriptions (pacman):

- [bandwhich](https://github.com/imsnif/bandwhich): Terminal bandwidth utilization tool
- [bash-completion](https://github.com/scop/bash-completion): Programmable completion functions for bash
- [bat](https://github.com/sharkdp/bat): A cat clone with syntax highlighting and Git integration
- [broot](https://github.com/Canop/broot): A new way to see and navigate directory trees
- [btop](https://github.com/aristocratos/btop): A monitor of resources
- [ctop](https://github.com/bcicen/ctop): Top-like interface for container metrics
- [curlie](https://github.com/rs/curlie): The power of curl, the ease of use of httpie
- [dog](https://github.com/ogham/dog): A command-line DNS client
- [dua](https://github.com/Byron/dua-cli): View disk space usage and delete unwanted data, fast
- [entr](https://github.com/eradman/entr): Run arbitrary commands when files change
- [fd](https://github.com/sharkdp/fd): A simple, fast and user-friendly alternative to 'find'
- [fdupes](https://github.com/adrianlopezroche/fdupes): Identifying or deleting duplicate files
- [fzf](https://github.com/junegunn/fzf): A command-line fuzzy finder
- [git](https://git-scm.com/): Source code management
- [gping](https://github.com/orf/gping): Ping, but with a graph
- [hq](https://github.com/coderobe/hq): A HTML processor inspired by jq
- [jq](https://github.com/jqlang/jq): Command-line JSON processor
- [lsd](https://github.com/lsd-rs/lsd): The next gen ls command 
- [mcfly](https://github.com/cantino/mcfly): McFly replaces your default ctrl-r shell history search
- [mtr](https://github.com/traviscross/mtr): Combines the functionality of traceroute and ping into one tool
- [ncdu](https://en.wikipedia.org/wiki/Ncdu): Disk usage analyzer with an ncurses interface
- [neovim](https://github.com/neovim/neovim) (nvim): Better vim
- [ngrep](https://github.com/jpr5/ngrep): GNU grep applied to the network layer
- [ntp](https://en.wikipedia.org/wiki/Network_Time_Protocol): Time sync
- [ouch](https://github.com/ouch-org/ouch): Painless compression and decompression in the terminal
- [procs](https://github.com/dalance/procs): A modern replacement for ps written in Rust
- [progress](https://github.com/Xfennec/progress/tree/master): Displays percentage of running core util commands
- [pipx](https://github.com/pypa/pipx): Install and Run Python Applications in Isolated Environments 
- [ranger](https://github.com/ranger/ranger): A VIM-inspired filemanager for the console
- [ripgrep](https://github.com/BurntSushi/ripgrep) (rg): Better file text search
- [rsync](https://en.wikipedia.org/wiki/Rsync): Efficiently transferring and synchronizing files between a computer and a storage
- [shellcheck](https://www.shellcheck.net/): Finds bugs in your shell scripts
- [speedtest-cli](https://github.com/sivel/speedtest-cli): Command line network speed test
- [tlp](https://github.com/linrunner/TLP): Optimize Linux Laptop Battery Life
- [tmux](https://github.com/tmux/tmux): Terminal multiplexer
- [ttf-cascadia-code](https://github.com/microsoft/cascadia-code): Programming and terminal font
- [yamllint](https://github.com/adrienverge/yamllint): Linter for YAML files
- [yq](https://github.com/mikefarah/yq): YAML, JSON, XML, CSV, TOML and properties processor
- (removed due to lsd) [exa](https://github.com/ogham/exa): A modern replacement for ‘ls’
- (removed due to btop) [htop](https://github.com/htop-dev/htop): An interactive process viewer
- (removed as unused) [mosh](https://github.com/mobile-shell/mosh): Mobile shell that supports roaming and intelligent local echo
- (removed due to ouch) [p7zip](https://www.7-zip.org/download.html) (7z): File archiver with a high compression ratio
- (removed due to ouch) [unzip](https://man.archlinux.org/man/unzip.1.en): File decompression

Descriptions (yay):
- [jnv](https://github.com/ynqa/jnv): Interactive JSON filter using jq

## GUI Apps

```shell
sudo pacman -S \
    gnome-browser-connector \
    gpick \
    flatpak \
    libreoffice-fresh \
    pinta \
    xournalpp

```

Descriptions:

- [gnome-browser-connector](https://wiki.gnome.org/Projects/GnomeShellIntegration/Installation): Native host messaging connector
- [Gpick](https://www.gpick.org/): Advanced color picker and palette editing tool
- [flatpak](https://flathub.org/): Apps for Linux
- [LibreOffice](https://www.libreoffice.org/): Free Office Suite
- [Pinta](https://www.pinta-project.com/): Pinta is a free, open source program for drawing and image editing
- [Xournal++](https://xournalpp.github.io/): Take handwritten notes with ease

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

- [chatGPT-shell-cli](https://github.com/0xacx/chatGPT-shell-cli/tree/main): Simple shell script to use OpenAI's ChatGPT and DALL-E from the terminal
- [shell_gpt](https://github.com/TheR1D/shell_gpt): [Python] A command-line productivity tool powered by GPT-3 and GPT-4
- [aichat](https://github.com/sigoden/aichat): [Rust] Use GPT-4(V), Gemini, LocalAI, Ollama and other LLMs in the terminal

## Cloud Tools

```shell
sudo pacman -S \
    aws-cli-v2 \
    helm \
    kubectl \
    kubectx \
    terraform

yay -S opentofu
```

Descriptions:

- [aws-cli](https://aws.amazon.com/cli/): Unified tool to manage your AWS services
- [kubectl](https://kubernetes.io/docs/tasks/tools/): Kubernetes command-line tool
- [kubectx](https://github.com/ahmetb/kubectx) (includes kubens): Faster way to switch between clusters and namespaces in kubectl
- [opentofu](https://opentofu.org/): The open source infrastructure as code tool
- [terraform](https://www.terraform.io/): Infrastructure automation to provision and manage resources in any cloud or data center
- [helm](https://helm.sh/): Package manager for Kubernetes
