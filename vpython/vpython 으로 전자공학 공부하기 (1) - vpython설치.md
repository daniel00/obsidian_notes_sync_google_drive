---
tags: -vpython -electonics
created: 2024-10-28 23:20.05
updated: 2024-10-29 22:07.20
---

### vpython이란?
visual python의 약자로서 3차원 오브젝트를 쉽게 활용 할 수 있는 툴이다.
주로 물리학 에서 사용하는 듯 하다.

### vpython 설치
vscode 터미널에서, pip3 install vpython 이라고 입력하면 설치된다.
설치된 파이썬 버전에 맞게 pip 또는  pip3를 입력한다.


### first vpython code

```python
from vpython import *
from time import *
 
ball = sphere() 
```

실행 결과

![[Pasted image 20241029220705.png]]