# Notes

General notes for technology and life.

## Bash Run Commands

Use the following on a new installation of Linux to replace everything in the ~/.bashrc file with the content of the [bashrc](bashrc) file in this repository.

```shell
#!/usr/bin/env bash

readonly source_url="https://raw.githubusercontent.com/grantcarthew/notes/main/bashrc"
readonly dest_file="${HOME}/.bashrc"
readonly temp_file="/tmp/.bashrc.new"
readonly backup_file="/tmp/.bashrc.bak"

echo "Downloading new .bashrc..."

if curl -sSL --fail -o "${temp_file}" "${source_url}"; then
  echo "Download successful."

  if [[ -f "${dest_file}" ]]; then
    echo "Backing up current .bashrc to ${backup_file}..."
    mv "${dest_file}" "${backup_file}"
  fi

  mv "${temp_file}" "${dest_file}"
  echo "✅ Successfully updated .bashrc."
else
  echo "❌ Error: Download failed. Your original .bashrc is untouched." >&2
  rm -f "${temp_file}"
  exit 1
fi
```
