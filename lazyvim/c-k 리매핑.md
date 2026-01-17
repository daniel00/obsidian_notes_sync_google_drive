---
created: 2025-03-25 00:02
updated: 2025-03-25 00:02
tags: [c-k, inlay, hint, 힌트, 키맵, key map]
alias: []
---

created: 2025-03-25 00:02
updated: 2025-03-25 00:02

#### c-k를 =로 설정하고 싶어서 한참 찾았다.
아래처럼 설정하면 된다.
더불어 inlay hint도 disable 시켰다.

```lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.inlay_hints = { enabled = false }
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<C-k>", false, mode = { "i" } }
      return opts
    end,
  },
}
```