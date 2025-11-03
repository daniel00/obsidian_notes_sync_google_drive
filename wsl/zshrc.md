---
created: 2025-10-25 01:16:04 Sat
updated: 2025-10-25 01:16:04 Sat
tags: []
alias: []
---

created: 2025-10-25 01:16:04 Sat
updated: 2025-10-25 01:16:04 Sat

####  WSL에 설치한 zsh의  .zshrc의 내용을 저장 합니다.



```sh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

bindkey -v

bindkey '^ ' autosuggest-accept
bindkey '^j' autosuggest-accept
bindkey '^ ' autosuggest-accept
bindkey '^w' complete-word

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#vim mode 는 가장 마지막에
set -o vi
```