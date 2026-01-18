---
created: 2026-01-18 22:34:53 Sun
updated: 2026-01-18 22:34:53 Sun
tags: [xremap, keyboard, key, remap]
alias: []
---

created: 2026-01-18 22:34:53 Sun
updated: 2026-01-18 22:34:53 Sun

####  리눅스에서 키매핑을 하는 방법입니다.

윈도우는 autohotkey, 맥에서는 hammerspoon 을 사용해서 키 리매핑을 적용중이다.
리눅스에서는 xremap로 적용 할 수 있다.

#### 순서요약
- xremap 설치
- config.yml 작성
- 자동실행 적용. 


######  설치는 알아서

##### config.yml
```yml
keymap:
  - name: Global Keys
    remap:
      # S-space: [S-space]
      C-Semicolon: [Esc]
      C-Shift-Semicolon: [Alt-F4]
      C-Apostrophe: [Alt-Tab]

  - name: Except Terminal, Vim
    application:
      not: Gnome-terminal
    remap:
      C-u: [C-Shift-Backspace]
      C-o: [Backspace]
      C-i: [Tab]
      C-y: [C-Backspace]
      C-Leftbrace: [Home]
      C-Rightbrace: [End]
      C-h: [left]
      C-j: [down]
      C-k: [up]
      C-l: [right]

  - name: Launch Apps
    remap:
      C-KEY_5:
        launch: ["sh", "-c", "wmctrl -x -a Gnome-terminal || gnome-terminal"]
      C-KEY_7:
        launch: ["yoo_run_app", "naver-whale"]
      C-KEY_8: 
        launch: ["yoo_run_app", "obsidian"]
      C-KEY_4: 
        launch: ["yoo_run_app", "gnome-text-editor"]

  - name: Window Manage
    remap:
      C-Shift-h: [Super-left] #maxmize
      C-Shift-j: [Super-down] #maxmize
      C-Shift-k: [Super-up] #maxmize
      C-Shift-l: [Super-right] #maxmize

# modmap:
#   - name: Ctrl alone to Esc
#     remap:
#       KEY_LEFTCTRL:
#         held: KEY_LEFTCTRL
#         alone: Esc
#         free_hold: true

```


##### 자동실행 적용
- 부팅시 자동실행 - 아래 두개의 파일 작성
	/home/daniel/.config/systemd/user/xremap.service
	/home/daniel/.config/autostart/xremap.desktop
```bash

```
- 키맵 변경후 재실행