---
tags:
  - clojure
  - lsp
---

## Error on go to definition for external, .jar dependencies

When the cursor is over a require or a reference:

```clojure
(ns integration.public-api
  (:require [integration.aux.init :as init :refer [defflow]]
            [clojure.test :refer [deftest is testing]]
            [state-flow.api :as f :refer [run flow match?]]))
;;                      ---
;;                       |
;;                       |
;;                       v
;;            Cursor somewhere here!
;;;;
```

We get an error like this one:

```text
Error executing vim.schedule lua callback: .../neovim/0.11.4/share/nvim/runtime/lua/vim/lsp/client.lua:545: RPC[Error] code_name = InternalError, message = "Internal error" data = {
  id = 1,
  method = "initialize"
}
stack traceback:
  [C]: in function 'assert'
  .../neovim/0.11.4/share/nvim/runtime/lua/vim/lsp/client.lua:545: in function ''
  vim/_editor.lua: in function <vim/_editor.lua:0>
```

Or when the cursor is over a symbol which was imported from an external dependency (not our own, internal namespaces):

```clojure
(run
 (flow "increment count"
   (f/swap-state update :count inc)
   (match? 1 (f/get-state :count))
   (f/get-state) ;;-----
   {:count 0}))  ;;  \
;;                    \
;;                     \
;;                      |
;;                      |
;;                      v
;;          Cursor somewhere here!
;;;;
```

Then we get an error like this other one, especially, “Cursor position outside buffer”:

```text
Error executing vim.schedule lua callback: ...lar/neovim/0.11.4/share/nvim/runtime/lua/vim/lsp/buf.lua:226: Cursor position outside buffer
stack traceback:
  [C]: in function 'nvim_win_set_cursor'
  ...lar/neovim/0.11.4/share/nvim/runtime/lua/vim/lsp/buf.lua:226: in function 'on_response'
  ...lar/neovim/0.11.4/share/nvim/runtime/lua/vim/lsp/buf.lua:245: in function 'handler'
  .../neovim/0.11.4/share/nvim/runtime/lua/vim/lsp/client.lua:682: in function ''
  vim/_editor.lua: in function <vim/_editor.lua:0>
```

Regardless, in both cases the file to the external library is open, but the file is empty. No contents!

### The problem

The problem was that I had disabled some zip and tar related plugins in `lazy.vim` configs:

```lua
require("lazy").setup({ import = "plugins" }, {
  --
  -- Other lazy configs.
  --
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "zipPlugin",
        "tohtml",
        "tutor",
      },
    },
  },
})
```

### The solution

Commenting out or removing `zipPlugin` solved the problem and I could navigate definitions inside `.jar` external dependencies.

### Resources

- https://www.reddit.com/r/neovim/comments/1iwxejo/resolved_cursor_position_outside_buffer_when/