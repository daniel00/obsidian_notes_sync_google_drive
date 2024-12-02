---
tags: 
created: 2024-11-04 01:00.52
updated: 2024-11-10 01:28.30
---

creation date: 2024-11-10 01:17
modification date: Sunday 10th November 2024 01:17:47

#### nvchad를 이용해서 nvim을 ide로 만드는 방법을 설명합니다.

- nvchad 메인 페이지에서 시키는대로 다운로드 & 설치한다.
- 기존에 사용하고 있던 ~/.config/nvim 폴더를 백업해 놓자.
```console
mv ~/.config/nvim ~/.config/nvim.backup
```
- nerd font를 설치해야 tree view에서 아이콘이 제대로 보인다.
- 폰트 설치 할 때에는 mono로 끝나는 이름의 폰트는 설치하면 안된다.
ex) JetbrainsMono Nerd Font(O)  JetbrainsMono Nerd Font Mono(X)
- iTerm에서 폰트를 바꿔준다. settings - Profiles - Text - Font
 이러면 tree를 열었을때 예쁜 아이콘들이 표시된다. Ctrl + n키로 트리를 연다.

다 설치하고 나면 아래처럼 보인다. 우선 그림을 먼저 소개했다.
설치는 아래에 이어서.
 
![[Pasted image 20241110012715.png | 500]]


