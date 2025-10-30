---
tags:
  - vscode
  - extension
  - disable
  - enable
  - workspace
description: Notes and tips on VS Code extensions. How enable and disable by workspace.
---
## Disable VS Code extensions by workspace

> [!NOTE] Why disable extensions?
>
> When I am studying and practicing certain types of code challenges or DSA,  I prefer to use only basic features of the editor (indentation, syntax highlighting) and disable all other forms of help like intellisense, auto-imports, auto-completion, type checking, etc. In these situation, the goal is to get good at some particular thing and the more I have to do things myself, the better.

For builtin extensions, go to Extensions (`Ctrl+Shift+X` on Linux), and type `@builtin` in the input box. Further filter with the part of the name of the extension to be disabled, for example “TypeScript”, and then click on the cogwheel and “Disable (workspace)”.

![VS Code disable builtin extension for workspace](vscode-disable-built-in-extension-workspace.png)

It is probably useful to disable other forms of completion in `.vscode/settings.json` for the current project/workspace:

```json
{
  "editor.parameterHints.enabled": false,
  "editor.quickSuggestions": {
    "other": false,
    "comments": false,
    "strings": false
  }
}
```
