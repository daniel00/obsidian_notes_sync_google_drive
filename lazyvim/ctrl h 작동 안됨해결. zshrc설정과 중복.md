---
created: 2025-02-09 20:31
updated: 2025-02-09 20:31
tags: []
alias: []
---

created: 2025-02-09 20:31
updated: 2025-02-09 20:31

#### lazyvim에서 ctrl + h를 버터(또는 탭) 전환으로 사용하는 방법 설명


아래의 .zshrc 파일에 ctrl h 매핑이 되어 있어서, lazyvim의 매핑이 적용되지 않았다.
아래처럼 주석 처리 후 정상 동작한다.
근데 아래 주석으로 인해서 터미널에서 백스페이스가 동작하지 않는 문제가 있는지 확인 해 봐야겠다.

```vim
# ctrl h backspace
# stty erase ^H
``` 


lazyvim의 keymap.lua 파일에는 다음처럼 설정하면 된다.
```vim
vim.keymap.set("n", "<C-h>", ":bp<cr>",{silent=true})
vim.keymap.set("n", "<C-l>", ":bn<cr>",{silent=true})
```




역시나 위의 zshrc 설정을 주석처리하니 터미널에서 ctrl h가 백스페이스로 동작하지 않는다.
github copilot에게 물어보니 아래처럼 처리 해보라고 한다. 한번 해보자.


lazyvim에서 터미널을 열면 ctrl + h가 백스페이스로 동작하지 않아. lazyvim과의 키맵의 중복을 피하면서 터미널 동작중에만 ctrl + h 를 백스페이스로 동작시키는 방법이 있을까

  Copilot ───

네, 터미널 모드에서만 `Ctrl + h`를 백스페이스로 동작하게 설정할 수 있습니다. 다음과 같이 설정 파일에 추가해 보세요:

```lua
-- 터미널 모드에서만 Ctrl + h를 백스페이스로 설정
vim.cmd [[
  autocmd TermOpen * tnoremap <buffer> <C-h> <BS>
]]
```

이 코드는 터미널이 열릴 때마다 `Ctrl + h`를 백스페이스로 매핑합니다. 다른 모드에서는 기존의 키맵과 충돌하지 않습니다.

  Yoo ───


