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
 
### Complex Modifications

- [Gnome Activities Overview](gnome-activities-overview.json): Simulates using the Super key (Window key) in Gnome to show the Activities Overview.
- [Print Screen](print-screen.json): Enable the PrtSc or Print Screen key to select an area of the screen to copy to the clipboard.
- [Home and End Mapping](home-and-end.json): Remaps the Home and End keys to go to the beginning and end of the current line.
