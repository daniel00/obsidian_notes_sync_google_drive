---
created: 2025-02-10 00:16
updated: 2025-02-10 00:16
tags: [terminal, autochdir]
alias: []
---

created: 2025-02-10 00:16
updated: 2025-02-10 00:16

#### 현재 파일경로에서 터미널을 여는 방법을 검토하다가 정리한다.

아래의 vim.opt.autochdir = true 를 설정해야 현재 디렉토리를 제대로 읽어온다.

```lua
vim.g.mapleader = ","

-- O키로 새 라인 열때, 주석 적용 안되도록 함
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove("c")
    vim.opt.formatoptions:remove("r")
    vim.opt.formatoptions:remove("o")
  end,
})

-- 파일을 다시 열 때 undo를 수행하지 않도록 합니다.
vim.opt.undofile = false

-- 현재 파일의 디렉토리로 자동으로 변경
vim.opt.autochdir = true

```