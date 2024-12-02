---
tags: -vpython -vector
created: 2024-11-03 21:21.13
updated: 2024-11-04 00:40.04
---

### 위치벡터(Position Vector)
3차원상의 위치를 나타내는 벡터로, 시작점은 원점이다.
$$
\vec{r}=(3,4,5)m
$$

### vpython으로 벡터 표현


```python
from vpython import *
from time import *

# 위치벡터 r
r = vector(3,4,5)

# x,y,z 좌표축 표시
x= arrow(axis = vec(10,0,0),color=color.red, shaftwidth=0.1)
y= arrow(axis = vec(0,10,0),color=color.green, shaftwidth=0.1)
z= arrow(axis = vec(0,0,10),color=color.blue, shaftwidth=0.1)

# 축 라벨 표시
text(text='x', axis=x.axis, pos=x.axis)
text(text='y', axis=y.axis, pos=y.axis)
text(text='z', axis=z.axis, pos=z.axis)

# 위치벡터를 화살표로 표시
r_arrow = arrow(pos=vec(0,0,0), axis=r, shaftwidth=0.1)
```


![[Pasted image 20241103230447.png | 500]]


### 단위 벡터
크기가 1인 벡터. 벡터의 방향을 나타낸다.