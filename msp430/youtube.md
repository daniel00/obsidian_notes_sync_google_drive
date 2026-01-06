---
created: 2026-01-06 22:37:17 Tue
updated: 2026-01-06 22:37:17 Tue
tags: [compiler, makefile, terminal, gcc]
alias: []
---

created: 2026-01-06 22:37:17 Tue
updated: 2026-01-06 22:37:17 Tue

#### IDE 가 아닌 터미널에서 컴파일 하는 법을 연습 해 봅니다.

#### 실습 할 것들

- 컴파일러 설치
- header 파일 설치
- Blink LED 코드 작성
- Makefile 작성
- 


###### 컴파일러 설치
https://www.ti.com/tool/MSP430-GCC-OPENSOURCE?keyMatch=msp430%20gcc%20open%20source&tisearch=universal_search#downloads

아래 파일 다운로드 (맥북에 다운로드 된다)
	Mitto Systems GCC 64-bit Linux - toolchain only  — 62584 K


맥북 -> 리눅스로 옮긴다.
```term
scp msp430-gcc-9.3.1.11_linux64.tar.bz2  daniel@100.93.43.23:/home/daniel/
```

tar로 아카이브를 푼다.
```term
tar xvf msp430-gcc-9.3.1.11_linux64.tar.bz2
```


bin 폴더로 이동해서 테스트를 해본다.

![[Pasted image 20260106235443.png]]

이 경로를 환경변수에 넣는다.
pwd로 경로 복사하고, ~/.bashrc ~/.zshrc에 넣는다.
```vim
export PATH="$PATH:/home/daniel/msp430-gcc-9.3.1.11_linux64/bin"
```

####### 리눅스의 텍스트 복사방법(vim 에서도 이렇게 해야 한다.)
tmux 가 실행되어있다면, 복사하는 방법은
마우스로 드래그 후 cmd + v 로 붙여 넣기

또는

tmux 키를 이용해서, ctrl b + [
shift v 로 선택 후 y, cmd + v로 붙여넣기


##### 헤더파일 설치
컴파일러 다운로드 페이지에서 아래의 링크를 찾아서 설치한다.
Header and Support Files  — 21736 K



