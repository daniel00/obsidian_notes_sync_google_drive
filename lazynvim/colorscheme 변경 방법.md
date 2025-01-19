---
created: 2025-01-19 16:08
updated: 2025-01-19 16:08
tags: []
alias: []
---

created: 2025-01-19 16:08
updated: 2025-01-19 16:08

#### LazyVim에서 colorscheme colortheme를 변경하는 방법을 정리한다.

lua/plugins/core.lua 에 다음 처럼 설정한다.
()
```lua
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    }
  }
}
```