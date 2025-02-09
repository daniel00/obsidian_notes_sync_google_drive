---
title: "내가 리눅스를 써야만 하는 이유 3 - Tmux | MadForFamily"
source: "https://madforfamily.com/post/%EB%82%B4%EA%B0%80-%EB%A6%AC%EB%88%85%EC%8A%A4%EB%A5%BC-%EC%8D%A8%EC%95%BC%EB%A7%8C-%ED%95%98%EB%8A%94-%EC%9D%B4%EC%9C%A0-3-tmux.html"
author:
  - "[[MadForFamily]]"
published: 2019-06-23
created: 2025-02-10
description: "세번째 이유 회사 업무의 많은 부분이 터미널 작업이다보니, 터미널을 편하게 사용할 수 있는 어플리케이션을 찾게 되었다. 처음에 대충 찾은 게 terminator였"
tags:
  - "clippings"
---
## 세번째 이유

회사 업무의 많은 부분이 터미널 작업이다보니, 터미널을 편하게 사용할 수 있는 어플리케이션을 찾게 되었다. 처음에 대충 찾은 게 [terminator](https://code.launchpad.net/terminator/)였다. 일단 급한대로 여러 개의 터미널들을 하나의 terminator에 tab으로 여러 개 띄워 놓고, 또 다른 terminator를 가로 분할해서 하나 더 띄워서 또한 tab으로 터미널을 띄우는 식이었다. 2개의 모니터를 썼던 터라, 총 4개의 세로 분할로 터미널을 띄워 놓고 terminator안에서 tab을 전환해 가면서 꽤나 편하게 작업을 할 수 있었다.

하지만, 시간이 지나면서 4개의 터미널을 2개의 모니터에 걸쳐 보면서 작업을 하는 게, 다른 윈도우와 함께 사용해야 할 때는 조금 불편하게 느껴졌다. 그러다 어느 날 동료의 화면을 보고는 tmux를 사용하기 시작했다. [i3wm](https://madforfamily.com/post/%EB%82%B4%EA%B0%80-%EB%A6%AC%EB%88%85%EC%8A%A4%EB%A5%BC-%EC%8D%A8%EC%95%BC%EB%A7%8C-%ED%95%98%EB%8A%94-%EC%9D%B4%EC%9C%A0-1-i3wm-tiling-windows-manager.html)는 전체 어플리케이션의 배치를 원하는 대로 할 수 있었지만, 터미널 1개 화면을 그 안에서 또 마음대로 배치하기 위해서는 tmux를 같이 사용하는 게 좋다는 생각이 들었다. 모든 것을 내 손 안에서 단축키로 제어하고 싶다는 단순한 욕심이었다.

tmux를 사용한다면, 1개의 터미널 화면안에서 다시 tab으로 여러 터미널을 띄우고, 1개 tab안에서도 화면을 가로/세로로 마음대로 계속 분할할 수 있다. 특정 세션을 zoom했다가 다시 돌아가기도 쉽고, 1개 tab안에 있는 모든 세션에 같은 명령어를 동시에 실행할 수도 있다. i3wm과 함께 사용한다면, 한 쪽에는 크롬을 띄워놓고, 세로 분할한 상태에서 tmux를 띄운 후, tmux안에서는 내 마음껏 터미널들을 배치한 후 작업이 가능하다. 필요하다면, 한 개의 pane의 화면의 변화를 계속 파일로 저장해 뒀다가 나중에 사용할 수도 있다. 보통의 터미널들이 scroll buffer의 크기를 따로 지정할 수 있도록 해주긴 하지만, scroll buffer에 기록된 내용에 대해 검색하고 복사하고 등이 가능한 점은, 터미널 작업이 많은 사람에게는 축복같은 기능이라고 생각된다.

내가 지금껏 사용해온 tmux의 일부 기능들만 해도 터미널 작업이 많은 사람들에게는, 한번 익숙해지면 빠져 나갈 수 없는, 그런 기능들이 아닐까 싶다. 요즘 더 선호되는 terminal multiplexer가 있을지도 모르겠지만, 몇 년전 세팅한 후 아직까지 별 문제없이 사용하고 있는 설정(아래에 공유되어 있으며, 기본 설정과 다른 부분이 꽤나 포함됨)을 기반으로 tmux를 어떻게 사용하고 있는 지 살펴보려고 한다.

## tmux 설치

사용하고 있는 리눅스 종류에 따라, 설치하려는 tmux 버전에 따라, 어렵게 혹은 손쉽게 설치가 가능하다. 별 다른 문제가 없다면, os가 제공하는 repostory에서 제공되는 기본버전으로도 충분할 것이다. Lbuntu 18.04(Ubuntu 18.04기반)에선 `sudo apt-get install xsel tmux` 처럼 손쉽게 2.6버전 설치가 가능하다. `xsel`은 clipboard 사용을 위해서 같이 설치한다.

## 유용한 플러그인들

tmux는 플러그인을 제공하는데 개인적으로 `yank`, `resurrect`, `continuum`, `sessionist`와 `logging` 플러그인을 사용중이다. 설치는 간단하다. `~/.tmux/plugins`에 plugin의 git repository를 `git clone`해주면 된다.

위에서 나열한 플러그인을 설치하려면 다음과 같이 하면 된다.

```
mkdir -p ~/.tmux/plugins/
cd ~/.tmux/plugins/
git clone https://github.com/tmux-plugins/tmux-yank
git clone https://github.com/tmux-plugins/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-continuum
git clone https://github.com/tmux-plugins/tmux-sessionist
git clone https://github.com/tmux-plugins/tmux-logging
```

좀 더 많은 플러그인은 [여기](https://github.com/tmux-plugins)를 보면 된다.

## Prefix 설정

기본적으로 tmux는 단축키의 prefix로 `ctrl + b`를 누른 후 추가 키들을 눌러서 명령을 실행하는 식으로 제어할 수 있다. 처음에는 그냥 사용해봤는데, 손이 작아서인지 `ctrl + b` 누르는 게 조금 불편해서 `ctrl + a`로 바꿔서 사용중이다. 아마도 GNU screen이 사용하는 `ctrl + a`와 일부러 다르게 할려고 한 거 같은 느낌이다.

## Session/Window/Pane

Session은 하나의 tmux 작업공간(chrome의 경우 하나의 브라우저 개체)이라고 생각하면 될 듯 하다. 하나의 session안에는 여러개의 window(chrome의 경우 tab)들을 가질 수 있고, 각각의 window는 별도의 레이아웃으로 배치된 여러개의 Pane(1개의 화면안에서 분할된 구역)을 가질 수 있다.

### Session

만약 여러개의 session을 사용한다면, `tmux ls`해서 목록을 보고, `tmux attach -t 0`식으로 해당 session에 접속해서 사용할 수도 있다.

### Window

웹브라우저에서 사용할 수 있는 tab이라고 생각하면 된다. `ctrl + a, c`누르면 새로운 window를 만들고, `ctrl + a, &`를 누르면 해당 window를 삭제할 수 있다. `ctrl + 좌우 화살표키`를 눌러서 좌우로 이동하거나, `ctrl + 0~9 숫자키`를 눌러서 바로 이동할 수도 있고, 혹은 마우스로 window 타이틀을 클릭할 수도 있다.

### Pane

아마 Pane을 제어하는 기능이 tmux를 사용하는 이유 중 하나일 것이다. 가로 분할은 `ctrl + a, minus(-)`, 세로 분할은 `ctrl + a, backslash(\)` 누르면 되도록 설정해서 사용중이다. `%`나 `"`보다 직관적으로 기억하기 좋다고 생각된다. `ctrl + a, z`를 누르면 현재 작업중인 pane이 최대화되었다가 다시 원래 크기로 돌아간다. Pane의 크기 조절은 `ctrl + a + 화살표`(`ctrl + a` 누른 상태에서 손을 떼지 말고 화살표를 눌러야 함)를 눌러서 조절하거나, 마우스로 경계선을 움직여서 조절이 가능하다. Pane간 이동에는 `ctrl + a, 화살표 혹은 h/j/k/l`)(`ctrl + a` 눌러다가 손을 떼고, `화살표` 혹은 `h/j/k/l/`를 누름)로 하거나, 원하는 Pane을 마우스로 클릭하면 된다. Pane을 삭제하려면 `ctrl + a, x`를 누르면 된다.

### Tmux Resurrect

tmux를 사용하다가, pc를 리부팅했을 때, 그 모든 레이아웃들이 모두 사라진다는 걸 깨닫고 찾아본 플러그인이다. 이 플러그인을 사용하면, 해당 session의 레이아웃(window/pane)을 저장해두고, 다시 복구할 수 있다. 즉, `tmux attach -t 0`를 실행해서 tmux session에 접속한 후, window를 생성하고, 그 window안에서 pane을 나눈 후, `ctrl + a, ctrl + s`를 눌러서 session 레이아웃을 파일로 저장해둘 수 있다. 이후 다시 0번 session에 접속한 후 `ctrl + a, ctrl + r`을 누르면, 저장된 레이아웃을 복구할 수 있는 것이다.

## Logging

이 플러그인 덕분에 터미널 작업이 많이 쉬워졌다. 필요에 따라, 앞으로 터미널에서 지나가는 화면 전부를 파일로 저장할 수도 있고, 현재 화면을 바로 파일로 저장할 수도 있고, 현재 pane에 전체 history를 파일로 덤프할 수도 있다.

## Synchronise pane

`ctrl + a, e`를 누르고 나면, 이후의 키보드 입력이 현재 window의 모든 pane에 전달된다. 조금 위험하지만, 잘 사용하면 정말 유용하다. 어떤 다른 어플리케이션의 도움없이 여러 터미널에 동시에 같은 명령을 실행할 수 있다. 종료하려면 `ctrl + a, shift + e`를 누르면 된다.

## Copy & Paste

Tmux를 사용하면서 적응에 시간이 걸렸지만, 익숙해진 지금은 너무나 편리한 것이 copy & paste에 관련된 기능이다. 아마 사용하는 버전에 따라, 상황에 따라, 개인적인 필요에 따라 가장 싫어할 수도, 가장 좋아할 수도 있으리라 생각된다.

한 가지 알아야 할 점은, tmux 내부의 clipboard가 system clipboard와 기본적으로 동기화되지 않아 보인다는 점이다. 내가 방법을 못 찾은 것인지, 아니면 안되는 것인지 모르겠지만, tmux안에서 copy한 후 다른 어플리케이션에 paste하기 위해서는 tmux yank plugin을 사용해서 system clipboard로 copy해 넣어야 한다. Copy 모드에 익숙해지고 나니 그다지 어렵지 않았지만, 처음에는 적응이 되지 않았던 점이다.

### Copy mode

Copy 모드는 scroll buffer에 있는 내용 안에서 검색하거나, 내용을 복사할 수 있는 모드이다. 아래에 나올 설정을 기반으로, `ctrl + a, [`를 누르면 copy 모드로 진입된다. 일단 진입 후에는 vi처럼 `ctrl + f/b` 혹은 `ctrl + u/d`을 눌러서 페이지 업/다운이 가능하고, vi처럼 `/`이나 `?`을 눌러서 forward/backward 검색이 가능하다. 빠져나오려면, enter를 치면 된다.

### 마우스로 copy & paste

tmux yank 플러그인을 사용하면 tmux와 시스템 clipboard로 동시에 복사해넣을 수 있다. 일반모드나 copy모드에서 마우스로 원하는 부분을 drag한 후 `y`를 누르면 복사되고, `ctrl + a, ]`를 눌러서 tmux안에다가 혹은 다른 어플리케이션의 복사해넣기 단축키를 가지고 붙여 넣을 수 있다.

### 키보드로 copy & paste

vi 스타일로 copy모드안에서 copy할 수 있다. `ctrl + a, [` 눌러서 copy 모드로 진입하 후, 방향키로 원하는 부분으로 이동 후 `space`를 눌러서 영역 지정을 시작한 후 원하는 부분을 모두 선택한 후 `y`를 누르면 tmux와 시스템 clipboard로 복사되고 copy 모드가 종료된다. 이후 `ctrl + a, ]`나 어플리케이션별 paste를 수행해서 사용할 수 있다.

## 문제점들

### `TERM`

tmux를 사용하려면 `TERM=scree-256color`라고 설정해야 한다. 그런데 tmux안에서 ssh 연결을 해서 다른 서버로 접속 후 다른 어플리케이션을 실행시, 그 어플리케이션이 `screen-256color`라는 터미널 타입을 거부하는 경우가 있다. 이 경우, 그냥 해당 ssh 연결안에서 `export TERM=xterm` 등으로 설정하고 해야 하는 경우가 있었다.

### tmux 처음 실행시 너무 시간이 걸릴 때

Tmux Resurrect 플러그인의 저장 파일이 너무 많지 않은지 `~/.tmux/resurrect` 디렉토리를 살펴본 후 필요없다면 모두 삭제해준다.

### `DISPLAY`

이상하게도 가끔씩 `DISPLAY` 환경변수(X 윈도우에서 출력대상을 지정하는 변수)의 값이 사라지는 경우가 생겼다. 그래서 일단 SSH 설정에서 X11 forwarding을 기본적으로 disable해서 필요한 경우 `-X`옵션을 사용해야 X11 forwarding이 되도록 했다.

`vi ~/.ssh/config`한 후 다음처럼 해주면 된다.

```
Host *
     ForwardX11 no
     ForwardAgent no
```

## Tmux config file

아래의 설정 파일을 사용하면, 위에 기재된 단축키들과 여러 기능들을 바로 사용할 수 있다.

```
#-----------------------------------------
# Prerequisites
#-----------------------------------------
# xsel and xclip for system clipboard interaction
# - sudo apt-get install xsel xclip
#
# Install useful tmux plugins
# - mkdir -p ~/.tmux/plugins/
# - cd ~/.tmux/plugins/
# - git clone https://github.com/tmux-plugins/tmux-yank
# - git clone https://github.com/tmux-plugins/tmux-resurrect
# - git clone https://github.com/tmux-plugins/tmux-continuum
# - git clone https://github.com/tmux-plugins/tmux-sessionist
# - git clone https://github.com/tmux-plugins/tmux-logging

#-----------------------------------------
# Important common settings
#-----------------------------------------
# change prefix from ctrl + b to ctrl + a
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

## enable new mouse mode(since tmux 2.1)
set -g mouse on
set -g set-clipboard off
set -g mouse-utf8 off

# enable 256 color
set -g default-terminal "screen-256color"

# large history limit
set -g history-limit 50000

# no delay for escape key press
set -sg escape-time 1

# set base index to 1, not 0
set -g base-index 1
setw -g pane-base-index 1

# reload config easily
# - ctrl + a, r to reload configuration
bind r source-file ~/.tmux.conf \; display ".tmux.conf reloaded"

# focus events enabled for terminals that support them
#set -g focus-events on

# enable vi style copy & paste
set-window-option -g mode-keys vi

# disable window title automatic renaming
set-window-option -g automatic-rename off

#-----------------------------------------
# copy and paste
#-----------------------------------------
# copy & paste within tmux
# 1.mouse 
# - dragging text will copy it to tmux buffer
# - ctrl + a, ] will past the selection
#
# 2.vi style
# - ctrl + a [ to enter into copy mode
# - nativate to the beginning of text using arrow keys
# - space to mark the beginning point
# - nativate to the end of text using arrow keys
# - enter to copy the selected text to tmux internal buffer
# - ctrl + a, ] will paste the selection
#
# 3.default
# - ctrl + a [ to enter into copy mode
# - nativate to the beginning of text using arrow keys
# - ctrl + space to mark the beginning point
# - nativate to the end of text using arrow keys
# - alt + w to copy the selected text to tmux internal buffer
# - ctrl + a, ] will paste the selection

# copy to tmux and system clipboard too
# 1.mouse
# - while dragging text, press y while pressing mouse left button
#
# 2.vi style copy & paste
# - ctrl + a [ to enter into copy mode
# - nativate to the beginning of text using arrow keys
# - space to mark the beginning point
# - nativate to the end of text using arrow keys
# - y to copy the selected text to system clipboard
#
# 3.default
# - ctrl + a [ to enter into copy mode
# - nativate to the beginning of text using arrow keys
# - ctrl + space to mark the beginning point
# - nativate to the end of text using arrow keys
# - y to copy the selected text to system clipboard

# copy only to system clipboard
# 1.mouse
# - while pressing shift, dragging text will copy it

# enter into copy mode
# 1.mouse
# - move mouse scroll wheel
#
# 2.keyboard
# - ctrl + a, [

#-----------------------------------------
# Panes
#-----------------------------------------
# split panes
# 1.keyboard
# - ctrl + a, - for horizontal split
# - ctrl + a, \ for vertical split
bind - split-window -v
bind \ split-window -h
unbind '"'
unbind %

# resize panes
# 1.mouse
# - resize pane by dragging panel border
#
# 2.ctrl + a + up/down/left/right arrow key
#
# 3.ctrl + a, shift + h/j/k/l key
bind H resize-pane -L 5
bind J resize-pane -D 5
bind K resize-pane -U 5
bind L resize-pane -R 5

# zoom in/out(maximize/minimize) pane
# - ctrl + a, z

# switch panes
# 1.mouse
# - switch pane by clicking panel area
#
# 2. ctrl + a, up/down/left/right arrow key
#
# 3. ctrl + a, h/j/k/l key
bind-key Up    select-pane -U
bind-key Down  select-pane -D
bind-key Left  select-pane -L
bind-key Right select-pane -R
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# synchronize panes
# - send a command across all panes in current window
# - ctrl + a, e : sync on
# - ctrl + a, shift + e : sync off
bind e setw synchronize-panes on
bind E setw synchronize-panes off

# terminate panes
# - ctrl + a, x
# - ctrl + d

#-----------------------------------------
# Windows
#-----------------------------------------
# create window
# - ctrl + a, c

# switch windows
# 1.mouse
# - click window name at bottom status line
#
# 2.ctrl + left/right arrow key
#
# 3.ctrl + h/l key
#
# 4.ctrl + a, 1~9
#
bind -n C-h  previous-window
bind -n C-l next-window

bind -n C-Left  previous-window
bind -n C-Right next-window

# rename window title
# - ctrl + a, ,

# terminate windows
# - ctrl + a, &

# move windows left/right
bind -n S-Left swap-window -t -1
bind -n S-Right swap-window -t +1

#-----------------------------------------
# Sessions
#-----------------------------------------
# tmux ls
# tmux attach -t session_index
# tmux -s session_name
# tmux rename-session -t 0 session_name

# detach session
# - ctrl + a, d

# rename session
# - ctrl + a, $

# switch session
# - ctrl + a, g

# create a new session
# - ctrl + a, shift + c

# kill session
# - ctrl + a, shift + x

# switch to the last session
# - ctrl + a, shift + s

# move the current pane into a new session
# - ctrl + a, @

#-----------------------------------------
# Utils
#-----------------------------------------
# Pane logging
# - start/stop a logging for the current pane
# - ctrl + a, shift + p
# - file path: $HOME
# - file name format: tmux-#{session_name}-#{window_index}-#{pane_index}-%Y%m%dT%H%M%S.log

# Pane screen capture
# - visible texts in the current pane is saved to a file
# - ctrl + a, alt + p
# - file path: $HOME
# - file name format: tmux-screen-capture-#{session_name}-#{window_index}-#{pane_index}-%Y%m%dT%H%M%S.log

# Save pane history
# - saves complete history of the current pane to a file
# - affected by history-limit
# - ctrl + a, alt + shift + p
# - file path: $HOME
# - file name format: tmux-history-#{session_name}-#{window_index}-#{pane_index}-%Y%m%dT%H%M%S.log

# Clear pane history
# - ctrl + a, alt + c

# directory tree
# - ctrl + a + tab: toggle directory tree
# - ctrl + a + backspace: toggle directory tree and move cursor to it

#-----------------------------------------
# Commands
#-----------------------------------------
# all commands
# - ctrl + a, :
# - tab key works for auto completion

#-----------------------------------------
# Display
#-----------------------------------------
# disable activity display on status bar
set -g visual-activity off
setw -g monitor-activity off

# window title on
set-option -g set-titles on

# status bar
set-option -g status on
set -g status-interval 2
set -g status-justify centre
set-option -g status-bg colour235 #base02
set-option -g status-fg yellow #yellow
set-option -g status-attr dim 
set-window-option -g window-status-fg brightblue #base0
set-window-option -g window-status-bg colour236 
set-window-option -g window-status-attr dim
set-window-option -g window-status-current-fg brightred #orange
set-window-option -g window-status-current-bg colour236 
set-window-option -g window-status-current-attr bright

# show user name
set -g status-left-length 70
set -g status-left '#[fg=green](#S) #(whoami) '

# show session name, window & pane number, date and time on right side of status bar
set -g status-right-length 60
set -g status-right "#[fg=blue]#S:#I.#P #[fg=yellow] %d %b %Y #[fg=green] #(date | awk '{print $4}') "

#-----------------------------------------
# Plugins
#-----------------------------------------
# tmux-yank
# - already explained above
run-shell ~/.tmux/plugins/tmux-yank/yank.tmux

# tmux-resurrect
# - useful when pc restarts
# - save session: ctrl + a, ctrl + s
# - restore session: ctrl + a, ctrl + r
run-shell ~/.tmux/plugins/tmux-resurrect/resurrect.tmux

# tmux-continuum
# - continuous session backup(every 15 mins)
# - automatic restore
set -g @continuum-restore 'on'
run-shell ~/.tmux/plugins/tmux-continuum/continuum.tmux

# tmux-sessionist
run-shell ~/.tmux/plugins/tmux-sessionist/sessionist.tmux

# tmux-logging
run-shell ~/.tmux/plugins/tmux-logging/logging.tmux
```