---
created: 2024-11-30 20:36
updated: 2024-11-30 20:36
tags: [obsidian, keymap]
alias: [obsidian_keymap]
---

created: 2024-11-30 20:36
updated: 2024-11-30 20:36

#### 옵시디언에서 키맵을 설정하는 방법에 대해 설명 합니다.

ctrl -h 를 옵시디언에서 탭변경하는데 사용하도록 hammerspoon 에서 디스에이블/인에이블 처리하였습니다. 
그랬더니, ctrl -h를 누르면 backspace가 동작하네요. 차라리 더 좋습니다.

나는 obsidian-vim을 사용하므로 , /obsidian-vault/obsidian-vimrc 에 키맵을 설정 하면 됩니다.

옵시디언에서 사용되는 커맨드들은 다음의 리스트를 참고 하면 됩니다.
[[command list]]

커맨드 설정 후 , 캐리지 리턴을 꼭 입력 해주어야 즉각 적으로 동작하는 점 잊지 마세요.

.obsidian.vimrc

![[Pasted image 20241130204114.png]]
