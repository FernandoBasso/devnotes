---
tags:
  - vscode
  - text-editor
  - clojure
  - calva
  - repl
---
## Keybindings

“Calva: Load/Evaluate Current File and its Requires/Dependencies”: `Ctrl+Alt+c Enter` or `Ctrl+Option+c Enter` to eval the whole current file.

“Calva: Evaluate Top Level Form (defun)”: `Alt+Enter` or `Opt+Enter`.

“Calva: Evaluate Current Form  (or selection, if any)”: `Ctrl+Enter` or `Opt+Enter`.

### Paredit

- https://calva.io/paredit/#editing

“Calva Paredit: Slurp Sexp Forward”: `Ctrl+Alt+.` or `Ctrl+Opt+.` Moves the _closing_ bracket _forward_, _away_ from the cursor, past the following form, if any. In other words, bring the next form into the current one.