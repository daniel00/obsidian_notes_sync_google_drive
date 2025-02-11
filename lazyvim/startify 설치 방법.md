---
created: 2025-02-11 22:26
updated: 2025-02-11 22:26
tags: []
alias: []
---

created: 2025-02-11 22:26
updated: 2025-02-11 22:26

#### 제목을 입력 하세요

내용을 입력 하세요
ㅐㅓㅏㅔ

1. `lazyvim` 설정 파일을 엽니다. 일반적으로 `~/.config/nvim/lua/plugins.lua` 파일입니다.
2. 다음 코드를 추가하여 Startify 플러그인을 설치합니다.

```lua
-- ~/.config/nvim/lua/plugins.lua
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  -- 다른 플러그인들...

  -- Startify 플러그인 추가
  use 'mhinz/vim-startify'
end)
```

1. `:PackerInstall` 명령어를 실행하여 플러그인을 설치합니다.

이제 Startify 플러그인이 설치되고 사용할 준비가 되었습니다. 추가 설정이 필요하다면 `~/.config/nvim/init.lua` 파일에 설정을 추가할 수 있습니다. 예를 들어:

```lua
-- ~/.config/nvim/init.lua
vim.g.startify_session_dir = '~/.config/nvim/session'
vim.g.startify_lists = {
  { type = 'sessions',  header = {'   Sessions'}       },
  { type = 'files',     header = {'   MRU'}            },
  { type = 'dir',       header = {'   MRU in current directory'} },
  { type = 'bookmarks', header = {'   Bookmarks'}      },
  { type = 'commands',  header = {'   Commands'}       },
}
```

이제 Neovim을 다시 시작하면 Startify가 작동할 것입니다.
