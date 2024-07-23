# Lenovo Legion Pro 7i (16", Gen 9)

## Nvidia Support

```shell
sudo pacman --sync nvidia-inst
nvidia-inst -o
```

## Lenovo Drivers

[LenovoLegionLinux](https://github.com/johnfanv2/LenovoLegionLinux)

```shell
yay --sync lenovolegionlinux-git lenovolegionlinux-dkms-git
```


## Hybrid Graphics Utility

[supergfxctl](https://wiki.archlinux.org/title/Supergfxctl)

```shell
sudo pacman --sync nvidia-prime
yay -S supergfxctl
systemctl enable supergfxd
systemctl start supergfxd

superfgxctl -s        # List supported modes
superfgxctl -g        # Get current mode
supergfxctl -m hybrid # Switch to hybrid mode

prime-run /path/to/exe

```

Configuration `/etc/supergfxd.conf`
