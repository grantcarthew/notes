# Google Gemini

- GitHub Repo: https://github.com/google-gemini/gemini-cli


~/.gemini/settings.json

```json
{
  "theme": "Default",
  "selectedAuthType": "vertex-ai",
  "preferredEditor": "vscode",
  "contextFileName": "AGENTS.md"
}
```

## Docker Image

docker run --rm -it us-docker.pkg.dev/gemini-code-dev/gemini-cli/sandbox:0.1.1

## aichat

To use the [aichat](https://github.com/sigoden/aichat) open source tool and work with Google Gemini, you'll need to do the following:

1. Install aichat `sudo pacman -Sy aichat`
2. Install [gcloud and authenticate](https://cloud.google.com/sdk/docs/install#linux)
3. Run `gcloud auth application-default login` command
4. Edit the config `nvim "${HOME}/.config/aichat/config.yaml"`

Example config:

```yaml
model: vertexai:gemini-2.5-flash-lite
stream: true
keybindings: vim
editor: nvim
wrap: auto
wrap_code: false
clients:
- type: openai-compatible
  name: xai
  base: https://api.x.ai/v1
- type: vertexai
  name: vertexai
  project_id: {{project-id}}
  location: us-central1
```
