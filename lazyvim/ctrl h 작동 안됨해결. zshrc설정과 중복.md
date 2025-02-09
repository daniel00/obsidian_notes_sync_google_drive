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
