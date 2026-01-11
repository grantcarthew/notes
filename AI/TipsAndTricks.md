# AI Tips and Tricks

## Agent Tips

### Use CLI tools rather than MCPs

A CLI help message can range from 500 to 1000 tokens while an MCP, which is JSON based, can range upto 18000 tokens (CDP MCP).
Agents work well with CLI tools and can look up help themselves if needed.

Tools I've made that work fantastically and use only a small amount of the agent context to instruct the agent:

- [acon](https://github.com/grantcarthew/acon/tree/main): A fast, simple command-line tool for Atlassian Confluence
- [ajira](https://github.com/grantcarthew/ajira/tree/main): Atlassian Jira CLI designed for AI agents and automation.
- [kagi](https://github.com/grantcarthew/kagi/tree/main): A fast, simple command-line interface for Kagi FastGPT - AI-powered search with web context.
- [snag](https://github.com/grantcarthew/snag/tree/main): Intelligently fetch web page content using a browser engine.

### Tell it how many issues to find

If you ask an AI agent to look for issues, it will not find everything that should be fixed in the code base.
Instead, tell the agent to find an exaggerated number of issues and it will try to find that many issues.

Example:
```
Review the {module or code or project} and find the 50 known issues that exist in the project.
These issues are spread between all the known types.
```
