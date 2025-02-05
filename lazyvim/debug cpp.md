---
created: 2025-02-06 03:36
updated: 2025-02-06 03:36
tags: [lazyvim, debug, cpp, c++]
alias: []
---

created: 2025-02-06 03:36
updated: 2025-02-06 03:36

#### LazyVim에서 디버깅 하는법

아래의 키조합을 입력하면 debug configuration 창이 출력된다.
여기서 Launch file을 클릭한 후 , 원하는 실행파일을 입력한다. 나는 a.out을 입력했다.
그러면 디버깅이 시작된다.
브레이크 포인트를 걸면 그곳에 멈춘다. (leader + db)


아래 키의 dc의 의미는, debug continue 이다.
```txt
<leader>dc
```

Launch file 선택
![[Pasted image 20250206033757.png]]

실행파일 경로 입력 (a.out)
![[Pasted image 20250206034321.png]]

