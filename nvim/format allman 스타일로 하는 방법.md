---
created: 2025-03-15 23:44
updated: 2025-03-15 23:44
tags: []
alias: []
---

created: 2025-03-15 23:44
updated: 2025-03-15 23:44

우선  clang-format을 설치 해야 한다.

```bash
brew install clang-format
```

그리고 
```lua
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.clang_format.with({
          extra_args = {
            "--style={BasedOnStyle: llvm, IndentWidth: 4, BreakBeforeBraces: Allman, UseTab: Never, ColumnLimit: 0, DerivePointerAlignment: false, PointerAlignment: Left, CommentPragmas: '^//'}"
          },
        }),
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.completion.spell,
        -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}


ㅐ
```