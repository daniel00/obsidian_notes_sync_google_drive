---
created: 2025-07-05 00:40
updated: 2025-07-05 00:40
tags: [iterm, zsh, theme, color, scheme]
alias: []
---

created: 2025-07-05 00:40
updated: 2025-07-05 00:40

#### zsh + powerlevel4k + color scheme theme 으로 아래 처럼 색상 적용 할 수 있다.


![[Pasted image 20250705004041.png | 1000]]


###### 적용 순서
- powerlevel10k 설치  https://github.com/romkatv/powerlevel10k
	- 설치 도중에 옵션을 적당히 잘 선택 하면 된다. 
	- 옵션은 나중에 다시 설정 할 수 있다. 
	
		```bash
		>p10k configure
		```


- iterm2 color scheme 설치  https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master
	- zip 파일 다운로드 받아서 적당한 곳에 압축 해제 한다.
	- iterm2 의 setting창을 연다. (cmd + i )
	- profiles - colors - color preset - import, 위에서 압축 푼 경로를 찾는다.
	- scheme 디렉토리에서 .itermcolos 파일을 선택한다. 아래 이미지는 "Dracular" 테마이다.
	/Users/yoo/iterm2_colorscheme/mbadolato-iTerm2-Color-Schemes-6fa671f/schemes/Dracula.itermcolors
	- import된 테마를 선택한다. 
	

   ![[Pasted image 20250705005023.png]]
