---
layout: wiki
title: tmux 사용법
summary: 
date: 2023-11-05 16:42:53 +0900
updated: 2024-01-02 02:15.11
tag: 
toc: true
public: true
parent: 
latex: false
resource: 58BB0BD8-2321-4689-A538-40D408A995C1
created: 2024-01-02 02:15.11
---
* TOC
{:toc}

## tmux의 기본 명령에 대해 정리합니다. 

### tmux 시작 
>tmux

### tmux 시작. 세션 이름 지정해서 시작
>tmux new -s mysession

### 기존 세션 attatch 하여 시작
>tmux attach-session -t 0  
>tmux attach-session -t session_name  

### tmux 종료
>exit

### pane 수직으로 나누기
>ctrl b + %

### pane 수평으로 나누기
>ctrl b + "

### session name 변경
>ctrl b + $

### window name 변경
>ctrl b + ,

### session 지우기
>tmux kill-session -t 세션이름

### new window
>ctrl b + c          <--create

### delete window
>ctrl b + x

### window 변경
>ctrl b + n     <-- next window
>ctrl b + p     <-- prev window

### window 변경. 윈도우 번호
>ctrl b + 윈도우 번호

### window 변경. 윈도우 이름으로
>ctrl b f   :윈도우 이름

### 현재 window 닫기
>ctrl b :kill-window
>ctrl b &

### 다른 window 닫기
>ctrl b :kill-window -a

### window 번호 변경
현재 윈도우 번호를 변경한다.
>ctrl b :swap-window -t 0

### .tmux.conf
```
# set-option -g prefix C-w

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind = select-layout even-horizontal

# tmux에서 vim사용시 esc딜레이 문제해결을 위해서
set -sg escape-time 0
# set -g status-interval 0    

set -g status-left-length 40 # could be any number

# 현재 윈도우 표시를 라이트블루로
set-window-option -g window-status-current-style bg=lightblue

# ctrl b + ' 를 누르면 바로이전 윈도우를 보여준다
bind-key \' last-window


```

### tmux를 깨끗하게 재시작 하는 방법
.tmux.conf등을 변경하여 tmux를 처음부터 다시 시작해야 하는 경우가 있다.
session마저 모두 지워짐에 유의!!!!

```
tmux kill-server
```

### nothing in register,레지스터에 아무것도 없습니다.  에러 해결 방법
tmux상에서 vim 사용시 yank 후 paste 할 때 위와 같은 에러 메세지가 나오면 다음처럼 해결하면 된다.

다음을 설치
```
brew install reattach-to-user-namespace
```
.tmux.conf 에 다음의 설정 추가
```
set -g default-command "reattach-to-user-namespace -l zsh"
```


### tmux에서 마우스 사용
```
set -g mouse on
```  

