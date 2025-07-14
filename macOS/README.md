# Apple Mac Operating System Notes

## Desktop Changes

Set the dock to autohide in the System Settings and execute the following to reduce the time it takes to show when the mouse is at the bottom of the screen:

```sh
# The float value can be 0.15 or any part of a second
defaults write com.apple.dock autohide-delay -float 0; killall Dock
```

## Karabiner-Elements

The MacOS keyboard and desktop environment is a broken experience for Linux users. [Karabiner-Elements](https://karabiner-elements.pqrs.org/) can help with fixing some of the issues.

### Simple Modifications

- Apple Internal Keyboard:
  - left_command -> left_control
  - left_control -> left_command
- Other Keyboards:
  - left_control -> left_command
  - left_command -> left_option
  - left_option -> left_control
<<<<<<< HEAD

=======
 
>>>>>>> 69b41b2 (fix: macOS dir name)
### Complex Modifications

- [Gnome Activities Overview](gnome-activities-overview.json): Simulates using the Super key (Window key) in Gnome to show the Activities Overview.
- [Print Screen](print-screen.json): Enable the PrtSc or Print Screen key to select an area of the screen to copy to the clipboard.
- [Home and End Mapping](home-and-end.json): Remaps the Home and End keys to go to the beginning and end of the current line.
<<<<<<< HEAD

## Packages

Brew packages:

```bash
brew install \
  anythingllm \
  atuin \
  bandwhich \
  bash \
  bat \
  bottom \
  broot \
  btop \
  copyq \
  coreutils \
  coteditor \
  cowsay \
  ctop \
  curlie \
  delta \
  difftastic \
  diskus \
  docker \
  dua-cli \
  dust \
  entr \
  fastfetch \
  fd \
  firefox \
  fzf \
  ghostty \
  glab \
  google-cloud-sdk \
  gping \
  gron \
  helm \
  hq \
  hyperfine \
  jless \
  jq \
  karabiner-elements \
  kubectx \
  kubernetes-cli \
  lazydocker \
  lazygit \
  lsd \
  marta \
  mcfly \
  mise \
  mplayer \
  mtr \
  neovim \
  ngrep \
  nnn \
  oha \
  orion \
  ouch \
  pastel \
  pinta \
  postgresql@14 \
  procs \
  ranger \
  ripgrep \
  rsync \
  sd \
  shellcheck \
  slack \
  speedtest-cli \
  starship \
  stylua \
  terraform-docs \
  tflint \
  tmux \
  tree-sitter \
  trivy \
  vegeta \
  visual-studio-code \
  watch \
  yamllint \
  yazi \
  yq \
  zellij \
  zoxide
```

Mise config located at ~/.config/mise/config.toml.

Run `mise install` after creating the config.toml file.

```bash
#!/usr/bin/env bash
#
# This script sets up the global mise configuration file for runtimes.

# Exit immediately if a command exits with a non-zero status.
set -o pipefail

MISE_CONFIG_DIR="$HOME/.config/mise"
MISE_CONFIG_FILE="$MISE_CONFIG_DIR/config.toml"

echo "Ensuring mise configuration directory exists at $MISE_CONFIG_DIR..."
mkdir -p "$MISE_CONFIG_DIR"

echo "Creating mise configuration file at $MISE_CONFIG_FILE..."
cat > "$MISE_CONFIG_FILE" <<'EOF'
# Runtimes & Associated Packages managed by mise
[tools]
node = "latest"
python = "latest"
terraform = "1.11"
uv = "latest"
EOF

echo "Configuration file successfully created."
echo

echo "Running 'mise install' to set up your global runtimes..."
mise install

echo
echo "Mise setup complete. All global runtimes are now installed."
```
=======
>>>>>>> 69b41b2 (fix: macOS dir name)
