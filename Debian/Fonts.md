# notes-debian
Links and documentation for using Debian GNU\Linux for development.

## Fonts

* [How can I fix ugly fonts in Firefox?](https://www.reddit.com/r/debian/comments/b2io8l/how_can_i_fix_ugly_fonts_in_firefox/)

Here's what I did and would therefore suggest:

1. Install font-manager with apt install font-manager
1. Open Font Manager
1. Go to Preferences > Rendering
1. Turn on Antialias
1. Turn on Hinting
1. Check Enable Autohinter
1. Select Hinting Style to Slight
1. Now go to Display
1. Select LCD Filter to Default
1. Select Subpixel Geometry to RGB
1. Now Save and close it. This did the trick for me.

### Packages

* [ttf-mscorefonts-installer](https://packages.debian.org/search?keywords=ttf-mscorefonts-installer) - Installer for Microsoft TrueType core fonts.
* [Cascadia Code](https://github.com/microsoft/cascadia-code) - Monospaced font that includes programming ligatures.
