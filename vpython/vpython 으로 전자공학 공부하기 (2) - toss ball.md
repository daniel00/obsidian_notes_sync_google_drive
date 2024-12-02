---
tags: -gravity -ball -vpython
created: 2024-10-29 23:24.12
updated: 2024-11-03 21:37.27
---

#### 공을 수직으로 살짝 토스 했을때의 운동을 살펴 본다.

가속 운동하는 물체의,
- dt 시간 후의 속도는
	vt = v0 + a x dt

- dt 시간 후의 이동거리는
	s = s0 + v x dt


![[images/toss_ball.mp4]]


```python
from vpython import *
from time import *

ball = sphere(pos=vector(0,0.1,0), radius=0.05, color=color.yellow, make_trail=True)
ground = box(pos=vector(0,0,0), size=vector(0.5, 0.02, 0.25))

#for graph
g1 = graph(xtitle="t[sec]", ytitle="y[meter]")
f1 = gcurve(color=color.blue)

g = vector(0,-9.8,0)    #중력가속도
ball.m = 0.05           #질량
v0 = 3.5                #초기 속도
ball.v = vector(0, v0, 0)

t = 0
dt = 0.01

# ground의 표면 y 좌표
pos_contact_y = ground.pos.y+ground.size.y/2+ball.radius

while ball.pos.y > ground.pos.y + ground.size.y/2 + ball.radius:
    rate(10)
    F = ball.m*g
    a = F/ball.m
    ball.v = ball.v + a*dt
    ball.pos = ball.pos + ball.v*dt

    #ground를 파고들지 않고, 표면에서 딱 멈추도록 처리
    if ball.pos.y <= pos_contact_y:
        ball.pos.y = pos_contact_y

    t = t + dt
    f1.plot(t, ball.pos.y)

```

![[images/toss_ball.mp4]]