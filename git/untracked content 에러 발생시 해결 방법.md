---
tags:
  - git
  - untracked
  - commit
created: 2024-11-04 01:00.52
updated: 2024-11-30 19:04.49
---

creation date: 2024-11-30 18:53
modification date: Saturday 30th November 2024 18:53:22

#### git commit 시 untracked content 라고 계속 커밋하라고 뜰때

아무리 커밋을 계속 하고, git add .을 해도 계속해서 
modified: ............... (modified content, untracted content)
라는 메시지가 계속 나왔다.
아래는 참고용으로 비슷한 에러를 웹에서 발췌한거다.

![[Pasted image 20241130190358.png | 700]]

확인해 보니, 이미 git으로 관리되는 폴더였는데 실수로 하위 폴더에 또 git init을 수행해서 .git 폴더가 더 생겨있었다.

##### 해결 방법
- .git 폴더를 지웠다. 
	 rm -rf .git
- cache를 지웠다.
		git rm -rf --cached
- 중복 폴더를 다시 add 해주었다.
		git add .

이제 에러가 발생하지 않는다.
![[Pasted image 20241130190444.png | 700]]
