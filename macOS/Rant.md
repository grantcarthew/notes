# macOS Rant

The following things are driving me crazy and are good reasons for a Linux user to not want to ever work with a Mac. They probably apply to Windows users as well.

_Update: While I'm at work using my macOS, I say nasty things under my breath all the time. This rant document is not a "list of annoying things that you will get used to". This is a list of constant misery using an Apple product. I don't want to lead people astray here, everytime I use it, CONSTANTLY. All the time. What a piece of garbage this operating system is._

## System Info

I got this info using [fastfetch](https://github.com/fastfetch-cli/fastfetch), which should show that I'm not using some ancient system:

```txt
Date: 2025-03-24
OS: macOS Sequoia 15.3.2 arm64
Host: MacBook Pro (16-inch, 2024, Three Thunderbolt 5 ports)
Kernel: Darwin 24.3.0
Shell: bash 5.2.37
Display (Colour LCD): 3456x2234 @ 120 Hz (as 1728x1117) in 16" [Built-in] *
DE: Aqua
WM: Quartz Compositor 278.2.7
WM Theme: Multicolour (Light)
CPU: Apple M4 Pro (14) @ 4.51 GHz
GPU: Apple M4 Pro (20) @ 1.58 GHz [Integrated]
Memory: 14.62 GiB / 24.00 GiB (61%)
Swap: Disabled
Disk (/): 74.59 GiB / 460.43 GiB (16%) - apfs [Read-only]
```

## Boot After Login

You sit down to work on your machine and type in your username and password. After hitting Enter, you wait while the system boots. What a broken experience. Linux and Windows handle this much better.

After using this system for some time now, I realised this is a security issue. I prefer to turn on my computer, perform tasks like getting a drink, and then log in to start working. On a macOS system, this workflow is impossible. If you press the power button, the system starts quickly but hasn't fully booted. You type your username and password, hit Enter, and then wait a long time for it to boot. The security issue arises because, after booting, the system automatically displays the desktop since you've already entered your credentials. You have no choice but to wait, leaving the system vulnerable to unauthorised access if unattended.

_Update: A friend at work suggested this is an issue because of all the work related processes, which it possible._

## Slow Unlock

You walk back to your desk, press a key (I normally hit ESC), and type in your password. Oh, no, not on a macOS device. You press a key, then wait. It's not long, but you can't just type in your password. Why? What has it been doing? Just let me unlock the device.

_Update: This may be due to the security software running in the company. Unknown at this point. Either way, still annoying everytime._

## Click Selects the Window

When you are working on one application window, then move the mouse to "click a button" in another window, it does not click the button. It simply selects the other window.

I can see this as a design choice for an operating system, but I think it is the wrong choice.

## Global Keyboard Shortcuts

I've created a few global keyboard shortcuts, but they just don't work in all situations. Drives me crazy.

_Update: I've confirmed this is a common issue to all mac users. Sucks to be a mac user._

## Modifier Keyboard Shortcuts

You can open the system settings to change keyboard shortcuts. What you can't do is assign a task to a single modifier key.

I fixed this with [Karabiner-Elements](https://karabiner-elements.pqrs.org/) to enable similar functionality to the GNOME Activities Overview.

## Closing Applications

When you click the red "x" at the top left (not right) of an application window, it does not terminate the application process. It keeps it open in the background, like mobile apps on iOS.

I am a desktop user and I have finished with this application. I don't want it open anymore. I don't want it using system resources. I don't want this behaviour.

## Firefox Window Sessions

I like to have Firefox keep my previous session when I open it the next day. Thanks to the "Closing Applications" issue discussed above, sometimes in the morning when I start Firefox, I have to go to my history and select "Recently closed windows" to find my main browser session.

_Update: This does not happen "sometimes" anymore, it is every morning._

## Mission Control (GNOME Activities)

I love the GNOME desktop experience. To macOS's credit, they at least have something similar called Mission Control (silly name in my mind).

I have mapped the keyboard using [Karabiner-Elements](https://karabiner-elements.pqrs.org/) to allow me to launch Mission Control when I press the Super key, but the application is extremely limited.

## Third-Party Application Package Manager

To a power user, macOS is useless without installing [Homebrew](https://brew.sh/). This is just wrong. I've seen so many people comment about how much they love Brew. Come on, people, this is a workaround. I should note that Windows has this same issue.

If you haven't tried Linux, do so (apt, pacman, yum, the list goes on).

## Broken Applications

There are some open-source applications that I use. They don't seem to work correctly. Windows flicker and other launching issues. This is really the operating system's fault.

Another issue I've seen with applications is the need to launch them twice. This is probably related to the "Closing Applications" issue mentioned above.

## File Explorer

The "Finder" app is just... not good.

Firstly, you can't remove it from the dock! I know it is probably the basis for the entire desktop, but still.

If you right-click an archive file, where is the option to "Extract here"? Basic functionality that is missing. OK, so you can double-click the file to extract it, but that's not what I want to do when I double-click it. When you double-click a file, you want to launch it, and in the case of an archive file, that means looking inside it. There should be a right-click option to extract it, not default to that. I imagine Mac users don't know how to manage files, by the looks of this.

_Update: I am trying to be open minded with this operating system, truly I am. Finder is really is bad. I hate finder._

_Update2: I've started using [Marta](https://marta.sh/), which is not ideal, but better than Finder._

## Performance

Everyone gets excited over the M-whatever performance. It might be a good chip, but from my experience, the usability is poor. Applications take quite a while to start (again, probably why they chose not to close applications properly). Graphics artefacts are noticeable here and there! An example is when using YouTube full-screen on Firefox. When going back to in-page view, the menus on Firefox have to redraw. Just shocking.

In general, I'm not impressed. My Linux laptop is a Lenovo Legion, and the performance from that is far better. I think that is probably the operating system, though. I was always under the impression that Apple fans were overly enthusiastic. I now believe this to be true based on my experience.

I will comment here about the battery life. It appears to be amazing. I say "appears" because I don't use it. If I'm working, I'm working at a desk. If I'm just fixing a thing or doing a quick job on my lap, it is for less than an hour. Almost any laptop will do for me. So I'm not a great judge of the battery life. This is, in my opinion, the one truly winning feature of the Mac, and I don't care. I have a lower-powered Lenovo E16 that I can plug into my Tesla Model 3 (2022) USB port and be online for a week.

## Hardware

Again, not impressed. The keyboard is just horrid. I use a Keychron mechanical keyboard that is delightful to type on. I also have a cheaper but quite good Cooler Master keyboard. Both with brown switches. I know it's a little unfair to compare a full mechanical keyboard to a laptop keyboard, and I'm not doing that here. I'm pointing out that I know what a good keyboard is.

For a laptop, though, the Mac keyboard is flat, has limited throw on the keys, and poor tactile feedback. It's like typing on a piece of paper. Yuck! The Lenovo laptops I have are fantastic to type on. I have many years of laptop ownership to lean on here. This Mac keyboard rates about a 1 out of 10 in my book.

The trackpad seems nice, but I don't use it.

The screen is beautiful, no doubt about it. Definitely one of the best features of this device. It's a shame it comes with macOS, but then, the keyboard is garbage, so...

I like that there are only USB-C ports. It's about time we got rid of USB-A. But any manufacturer can do this.

Would I buy this device if it came with Linux, or I could install Linux with ease? That's a big NO!

## Crashing

I've been using macOS for a few months now. It crashes, needing a reboot, more than my EndeavourOS system does. Here is the interesting point, though: Apple has complete control over the hardware. The operating system is built for Apple hardware only, and it is still unstable. Can you imagine if Linux had a fixed suite of hardware to support? Wow, that would be an amazingly stable system. This raises the question: why is macOS not an amazingly stable system?

## Junk Files

Working with archive files has revealed a new annoying thing you get using macOS: junk files. I'm talking about the operating system dropping `._` files (e.g., `._filename`), `.fseventsd`, `.spotlight-v100`, `.TemporaryItems`, `.Trashes`, `.DS_Store`, and other files onto the file system.

Now, I have to write "excludes" and other extra content into my Bash scripts to prevent littering my work with this garbage. It's horrible.

## CAPS LOCK

This is not a part of the "rant" topic. Credit where credit is due. I love how if you press **caps lock** there is a blue oval with a white up-arrow that shows under the mouse pointer when you are in a text input field. Just a brilliant addition to any operating system. I doubt we will see it in any other system though because of software patents (I'm speculating here).

## Lost Windows

This issue is less common but frustrating nonetheless. I've lost windows! I'm on the correct desktop with three monitors trying to access my application, but the window is missing. If I open the Mission Control, I can see it, but when I go back to work with the window, it is gone. The fix for this is not the same each time. Sometimes I've had to log off, sometimes it's resolved by moving the window between desktops. It changes. How much is this company worth? Single hardware support? This should not happen.

_Update: I found a workaround for this. Open the Mission Control app and select the window, then go to the the Window menu and select a Move & Resize value, any of them._

## Window Spanning

You can't span a window over multiple monitors! What? On Linux and Windows you can drag the edge of a window across two or more monitors to get a wider view. I use this feature in the terminal sometimes to show long strings. You can't do it in macOS.


