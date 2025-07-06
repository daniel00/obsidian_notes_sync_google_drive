---
created: 2025-07-06 19:55:06 Sun
updated: 2025-07-06 19:55:06 Sun
tags: []
alias: []
---

created: 2025-07-06 19:55:06 Sun
updated: 2025-07-06 19:55:06 Sun

#### Lazyvim Telescope에서 ctrl u 로 검색창 지우는 방법


(1) Telescope를 사용하고 있다면, 디폴트로 매핑된 c-u/ c-d 가 화면 스크롤로 사용되고 있다.
이걸 없애야 한다.

(2) 최신 Lazyvim에서는 Telescope 대신에 fzf-lua를 사용하는데, 이 fzf-lua가 c-u / c-d 키를 제어하고 있는거 같은데,
제어를 못하게 하는 방법을 모르겠다. 그래서 그냥 Telescope를 사용하도록 했다.



(1) Telescope의 c-u, c-d 디스에이블

```lua
return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    opts.defaults = opts.defaults or {}
    opts.defaults.mappings = opts.defaults.mappings or {}
    opts.defaults.mappings.i = opts.defaults.mappings.i or {}

    -- <C-u>, <C-d> 매핑 해제 (insert 모드 기본동작 복원)
    opts.defaults.mappings.i["<C-u>"] = false
    opts.defaults.mappings.i["<C-d>"] = false

    return opts
  end,
}
```




(2) Telescope 사용하도록 설정

~/.config/nvim/lazyvim.json 파일에 아래처럼 넣으면 된다.

```lua
{
    "extras": [
        "lazyvim.plugins.extras.ai.copilot",
        "lazyvim.plugins.extras.ai.copilot-chat",
        "lazyvim.plugins.extras.coding.mini-surround",
        "lazyvim.plugins.extras.coding.nvim-cmp",
        "lazyvim.plugins.extras.coding.yanky",
        "lazyvim.plugins.extras.dap.core",
        "lazyvim.plugins.extras.dap.nlua",
        "lazyvim.plugins.extras.editor.dial",
        "lazyvim.plugins.extras.editor.inc-rename",
        "lazyvim.plugins.extras.lang.clangd",
        "lazyvim.plugins.extras.lang.json",
        "lazyvim.plugins.extras.lang.omnisharp",
        "lazyvim.plugins.extras.lsp.neoconf",
        "lazyvim.plugins.extras.lsp.none-ls",
        "lazyvim.plugins.extras.test.core",

	
        "lazyvim.plugins.extras.editor.telescope"        -- 여기다

    ],
    "install_version": 8,
    "news": {
        "NEWS.md": "10960"
    },
    "version": 8
}
```



*fzf-lua* 에서 c-u / c-d를 사용하지 않게 하는 방법이 제일 좋을 것 같다.  찾아보자.