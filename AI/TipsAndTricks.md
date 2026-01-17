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

### Project Workflow

My workflow when working with agents is:

design -> project -> project review x 3 -> implementation -> review x n

Design

An interactive session to nail down the design of the project. Some people use specifications here. I don't like specs. I tried them a number of times and it makes the agent work authoritatively without regard to decision making. I create design records instead. The distintion between spec and dr is probably tiny, but there it is.

Project

After the design is written down as a design record, I work with the agent to create a project document. This document does not hold implementation details. It is instructions on what the project is and references the design record.

Project Review

A project review involves an automated or interactive agent session to research the resources needed to implement the project and update the project with a goal of making the project implementation successful. This phase is typically repeated about three times, depending on the prompt.

Implementation

By this time, the design and project documents are fully formed and the agent can build the solution including testing without much in the way of human involvement

Review

After the implementation, a number of review sessions can be carried out, with related changes and fixes. These can range from a basic code review, to architecture, security, standards, etc. The depth of work done in this phase really depends on the quality of the output required. A small project for a simple limited use may not even need a review, while a internet facing project will require many.

Reference

I created a [Documentation Driven Development template](https://github.com/grantcarthew/ddd-template) I use for new projects.






