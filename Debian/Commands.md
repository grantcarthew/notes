# Common Commands

## Copy Files

Copy a file from `source` to `destination` while logged into `source`:

```sh
# scp <source> <destination>
scp /path/to/file username@host:/path/to/destination
```

## Package Management

List all files in a package:

```sh
dpkg -c <package name>
```

Determine which package owns a file:

```sh
dpkg -S /location/of/file
```
