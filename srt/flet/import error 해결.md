---
created: 2024-12-23 23:41
updated: 2024-12-23 23:41
tags: [flet, import error, ]
alias: []
---

created: 2024-12-23 23:41
updated: 2024-12-23 23:41

방법1.
- flet folder로 이동
- source .venv/bin/activate
- nvim 실행

![[Pasted image 20250119171421.png]]

이렇게 하면, flet lsp를 잘 불러온다. 빨간색 밑줄 사라짐.
![[Pasted image 20250119171524.png]]

방법2.

```python
pip install -U flet
```

이렇게 했더니,  import fret as ft 에  있던 에러(fret 에 빨간색 밑줄)가 사라졌다.

