# Lenovo Legion Pro 7i (16", Gen 9) 16IRX9H

References:

- [Lenovo Legion Pro 7i (16", Gen9) | Sales and Marketing Page](https://www.lenovo.com/au/en/p/laptops/legion-laptops/legion-7-series/lenovo-legion-pro-7i-gen-9-(16-inch-intel)/83decto1wwau1)
- [Lenovo Legion Pro 7 16IRX9H |  Product Specifications Reference](https://psref.lenovo.com/Product/Legion/Legion_Pro_7_16IRX9H?MT=83de)
- [Lenovo Legion 7i | Arch Wiki](https://wiki.archlinux.org/title/Lenovo_Legion_7i)
- [Crashing Issues on Lenovo Legion Pro 7i (16”, Gen 9) | EndeavourOS Forum Discussion](https://forum.endeavouros.com/t/crashing-issues-on-lenovo-legion-pro-7i-16-gen-9/58375)
- [LenovoLegionLinux Issue](https://github.com/johnfanv2/LenovoLegionLinux/issues/173)

## Specifications

```text
Machine:
  Type: Laptop System: LENOVO product: 83DE v: Legion Pro 7 16IRX9H
    serial: <superuser required> Chassis: type: 10 v: Legion Pro 7 16IRX9H
    serial: <superuser required>
  Mobo: LENOVO model: LNVNB161216 v: SDK0T76461 WIN
    serial: <superuser required> part-nu: LENOVO_MT_83DE_BU_idea_FM_Legion Pro
    7 16IRX9H UEFI: LENOVO v: N2CN21WW date: 03/15/2024
```

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
