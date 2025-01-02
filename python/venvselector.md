---
created: 2025-01-03 03:56
updated: 2025-01-03 03:56
tags: []
alias: []
---

created: 2025-01-03 03:56
updated: 2025-01-03 03:56

#### LazyVim에서 flet 패키지 못 읽어 올때 해결 방법

LazyVim에서  flet 패키지를 읽어 오지 못하는 문제가 있었다.
읽어는 오는데, LSP에서 불러오지 못하는 듯 하였다.

```python
import flet
```



venvselector를 설치해서 venv의 Python 경로를 선택해 주니 해결 되었다.
https://github.com/linux-cultist/venv-selector.nvim


![[Pasted image 20250103040040.png]]
![[Pasted image 20250103040007.png]]


venv-selector설정은 아래와 같이 하면된다.

![[Pasted image 20250103040222.png]]