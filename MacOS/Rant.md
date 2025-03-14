# macOS Rant

The following things are driving me crazy and are good reasons for a Linux user to not want to ever work with a Mac. They probably apply to Windows users also.

## Boot After Login

You sit down to work on your machine and type in your user name and password. After hitting enter, you wait while the system boots. What a broken experience. Well done, Linux and Windows.

## Click Selects the Window

When you are working on one application window, then move the mouse to "click a button" in another window, it does not click the button. It simply selects the other application window.

I can see this as a design choice for an operating system, but I think it is the wrong choice.

## Global Keyboard Shortcuts

I've created a few global keyboard shortcuts, but they just don't work in all situations. Drives me crazy.

## Modifier Keyboard Shortcuts

You can open the system settings to change keyboard shortcuts. What you can't do is assign a task to a single modifier key.

I fixed this with [Karabiner-Elements](https://github.com/grantcarthew/notes/blob/main/MacOS/README.md#karabiner-elements) to enable similar functionality to the [GNOME Activities Overview](https://github.com/grantcarthew/notes/blob/main/MacOS/gnome-activities-overview.json).

## Closing Applications

When you click the red "x" at the top left (not right) of an application window, it does not close the application, meaning kill the process gracefully. It keeps it open in the background, like on your phone.

I am a desktop user and I have finished with this application. I don't want it open anymore. I don't want it using system resources. I don't want this behavior.

## Firefox Window Sessions

I like to have Firefox keep my previous session when I open it the next day. Thanks to the "Closing Applications" issue discussed above, sometimes in the morning when I start Firefox, I have to go to my history and select "Recently closed windows" to find my main browser session.

## Mission Control (GNOME Activities)

I love the GNOME desktop experience. To macOS's credit, they at least have something similar called Mission Control (silly name in my mind).

I have mapped the keyboard using [Karabiner-Elements](https://github.com/grantcarthew/notes/blob/main/MacOS/README.md#karabiner-elements) to allow me to launch Mission Control when I press the Super key, but the application is extremely limited.

## Third-Party Application Package Manager

To a power user, macOS is useless without installing [Homebrew](https://brew.sh/). This is just wrong. I've seen so many people comment about how much they love Brew. Come on people, this is a workaround. I should note that Windows has this same issue.

If you haven't tried Linux, do so (apt, pacman, yum, the list goes on).

## Broken Applications

There are some open-source applications that I use. They don't seem to work correctly. Windows flicker and other launching issues. This is really the operating system's fault.

Another issue I've seen with applications is the need to launch them twice. This is probably related to the stupid "Closing Applications" issue mentioned above.
