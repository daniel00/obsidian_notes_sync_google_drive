---
created: 2025-03-08 22:21
updated: 2025-03-08 22:21
tags: [nvim, keymap, init.lua]
alias: []
---

created: 2025-03-08 22:21
updated: 2025-03-08 22:21

nvim을 처음 세팅 할 때 적용할 기본 키맵


```lua
-- Leader 키를 공백으로 설정 (기본은 \)
vim.g.mapleader = ","

-- =양 옆에스페이스 있으면 안된다
-- 옵션
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")


-- key maps
vim.keymap.set("n", "<leader>o", ":edit ~/.config/nvim/init.lua<cr>", { silent = true })
vim.keymap.set("n", "<leader>v", ":so ~/.config/nvim/init.lua<cr>", { silent = true })
vim.keymap.set("n", "<leader>k", ":edit ~/.hammerspoon/init.lua<cr>", { silent = true })

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "<C-l>", "<right>")
vim.keymap.set("i", "<C-o>", "<Backspace>")
vim.keymap.set("i", "<C-k>", "=")
vim.keymap.set("i", "<C-;>", "<Esc>")

-- normal mode key maps
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "gl", "<c-w>l")
vim.keymap.set("n", "gh", "<c-w>h")
vim.keymap.set("n", "go", "0")
vim.keymap.set("n", "gk", "$")

vim.keymap.set("n", "<leader><leader>", "=iB")

-- 새로운 라인에서 주석을 자동으로 넣지 않도록 설정
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

```