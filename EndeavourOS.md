# EndeavourOS <!-- omit from toc -->

EndeavourOS running notes

_For package details, see the [Software](Software.md) page._

- [References](#references)
- [Basic Setup](#basic-setup)
- [Terminal Config](#terminal-config)
- [Laptop Battery Management](#laptop-battery-management)
- [GUI Apps](#gui-apps)
  - [Alacarte](#alacarte)
  - [Office Apps](#office-apps)
  - [Other GUI Apps](#other-gui-apps)
- [Programming](#programming)
- [AI Tools](#ai-tools)
  - [Terminal AI Clients](#terminal-ai-clients)
    - [aichat](#aichat)
  - [Local LLMs](#local-llms)
- [Cloud Tools](#cloud-tools)
- [Containers](#containers)
- [Configuration](#configuration)
  - [Bluetooth](#bluetooth)
  - [NeoVim](#neovim)

## References

- [Awesome TUIs](https://github.com/rothgar/awesome-tuis)

## Basic Setup

Mandatory system wide packages:

```shell
sudo pacman --refresh --sync --needed \
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
  fastfetch \
  fd \
  fdupes \
  fzf \
  gdb \
  ghostty \
  git \
  glow \
  gping \
  gron \
  hq \
  hyperfine \
  iotop \
  jless \
  jq \
  lsof \
  ltrace \
  lsd \
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
  thunar \
  tigervnc \
  tmux \
  ttf-cascadia-code \
  tumbler \
  vegeta \
  yamllint \
  yazi \
  yq \
  zellij \
  zoxide
```

Mise user-space packages:

```bash
#!/usr/bin/env bash
#
# This script sets up the global mise configuration file and installs the
# specified runtimes. It is idempotent.

# Exit immediately if a command exits with a non-zero status.
set -o pipefail

MISE_CONFIG_DIR="$HOME/.config/mise"
MISE_CONFIG_FILE="$MISE_CONFIG_DIR/config.toml"

echo "Ensuring mise configuration directory exists at $MISE_CONFIG_DIR..."
mkdir -p "$MISE_CONFIG_DIR"

echo "Creating mise configuration file at $MISE_CONFIG_FILE..."
cat > "$MISE_CONFIG_FILE" <<'EOF'
[tools]
claude-code = "latest"
go = "latest"
node = "latest"
opentofu = "latest"
python = "latest"
terraform-docs = "latest"
tflint = "latest"
uv = "latest"
EOF

echo "Configuration file successfully created."
echo

echo "Running 'mise install' to set up your global runtimes..."
mise install

echo
echo "Mise setup complete. All global runtimes are now installed."
```

Specialised packages:

```shell
yay --sync \
  jnv
  syncthing-gtk
```

Fonts:

```shell
# Font Awesome and Nerd Fonts help 'lsd' show icons in the terminal
sudo pacman --sync --noconfirm \
  otf-cascadia-code \
  otf-font-awesome \
  nerd-fonts
```

For Gnome:

```shell
sudo pacman --sync hunspell-en_au
```

Network monitoring:

```shell
sudo pacman --sync vnstat
sudo systemctl enable vnstat
sudo systemctl start vnstat
```

Time sync:

```shell
sudo systemctl enable ntpd
sudo systemctl start ntpd
```

## Terminal Config

Ghostty config:

```shell
nvim .config/ghostty/config
# font-size = 18
# theme = Breeze
```

Starship config:

```shell
# Starship Config (https://starship.rs/config/)
nvim .config/starship.toml
# Places the directory on the second line
format = '$all$directory$character'
```

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

# D-Bus Monitoring
sudo pacman --sync bustle d-spy
```

Aqua for GitHub releases: https://aquaproj.github.io/

```
export PATH="${PATH}:${HOME}/.local/share/aquaproj-aqua/bin
```

## AI Tools

### Terminal AI Clients

#### aichat

[aichat](https://github.com/sigoden/aichat): All-in-one AI CLI tool

```shell
# aichat installed with pacman above
nvim ~/.config/aichat/config.yaml
```

```yaml
model: xai:grok-3-mini-latest
stream: true
keybindings: vim
editor: nvim
wrap: auto
wrap_code: false
clients:
- type: openai-compatible
  name: xai
  base: https://api.x.ai/v1
  api_key: null
```

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

mise tool install awslogs --force

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

### NeoVim

- [lazy.nvim](https://lazy.folke.io/) - Modern plugin manager for Neovim
- [hardtime](https://github.com/m4xshen/hardtime.nvim) - Break bad habits, master Vim motions

HOME/.config:

```txt
> nvim
├── > init.lua
├── > lazy-lock.json
└── > lua
    ├── > config
    │   └── > lazy.lua
    └── > plugins
        └── > hardtime.lua
```

init.lua:

```lua
require("config.lazy")

```

config.lazy:

```lua
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

```

hardtime.lua:

```lua
return {
   "m4xshen/hardtime.nvim",
   lazy = false,
   dependencies = { "MunifTanjim/nui.nvim" },
   opts = {},
}
```
