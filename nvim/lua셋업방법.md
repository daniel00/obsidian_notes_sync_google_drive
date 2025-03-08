---
created: 2025-03-09 01:14
updated: 2025-03-09 01:14
tags: []
alias: []
---

created: 2025-03-09 01:14
updated: 2025-03-09 01:14

1. plugins.lua 파일에 모든 플러그인들을 다 넣는 방법

~/.config/nvim/lua/plugins.lua 에 아래처럼 플러그인을 return하는 코드를 넣고,

```lua
{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  }
}
```


init.lua 에는 아래 문구를 넣는다.
```lua
-- plugins.lua를 불러온다
require("lazy").setup("plugins") 

-- 플러그인 config
local config = require("nvim-treesitter.configs")
config.setup( {
	ensure_installed = {"lua", "c", "cpp", "c_sharp", "vim", "vimdoc"},
})
```

아직, 플러그인별 config 는 init.lua 파일에 있다.
