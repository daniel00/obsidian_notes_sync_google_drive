---
created: 2025-01-19 16:08
updated: 2025-01-19 16:08
tags: [colorscheme, colortheme, lazyvim, catppuccin]
alias: [colortheme]
---

created: 2025-01-19 16:08
updated: 2025-01-19 16:08

#### LazyVim에서 colorscheme colortheme를 변경하는 방법을 정리한다.

lua/plugins/core.lua 에 다음 처럼 설정한다.
(다른 파일에 설정하면 동작하지 않았다. 예를들어 lua/plugins/colorscheme.lua  등...)
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