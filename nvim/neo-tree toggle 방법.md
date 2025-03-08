---
created: 2025-03-09 02:37
updated: 2025-03-09 02:37
tags: []
alias: []
---

created: 2025-03-09 02:37
updated: 2025-03-09 02:37

### toggle 옵션을 준다

:Neotree toggle 

```lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    vim.keymap.set('n', '<C-N>', ':Neotree toggle filesystem reveal left<CR>');
  end
}

```