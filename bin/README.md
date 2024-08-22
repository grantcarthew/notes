# My Notes Scripts

## gp

```text
Usage: gp [file_filter] [-h]

Copies my AI Prompts from GitHub into the local clipboard

Dependencies:
  curl                For fetching GitHub API data
  jq                  For parsing JSON output
  rg                  For regex matching
  xclip               For copying content to the clipboard

Optional arguments:
  file_filter        The file name or part thereof
  -h, --help         Show this help message and exit
```