---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11484
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:10.34
---
```cpp
1,000,000 x 1,000,000 맵에
M명의 driver (51 ~ 100명) 그리고
K명의 passenger (5,001 ~ 10,000명)이 있다.

각 passenger는 
탑승위치 Coordinates가 주어지고, 
도착위치 Coordinates가 주어진다.

각 driver와 passenger 위치는
분포가 고른 전체 랜덤으로 주어진다.

각 택시들은 passenger를 태우고, 도착위치에 내려주고,
다음 passenger를 태우고, 도착위치를 내려주곤한다.

assign_driver는 특정 택시 dID (driverID)가
어떤 pID(passengerID)들을 태울지
순서대로 배열에 기록하는 정답 API이다.

최대 이동거리를 가진 기사들의
이동거리의 합이 최소가 되도록
택시를 손님에게 배정해야하는 문제이다.

[평가방법]
각 택시별 운행 거리를 구한다.
가장 길게 운행한 택시가 한 TC의 대표 점수가 된다. (TC_SCORE)
각 TC별 대표 점수(TC_SCORE)들의 합이 가장 낮게 나오도록 해야한다.
```

### 예측 점수

```cpp
한 Taxi가 몇명의 승객을 태울까?

승객수가 10,000명
driver : 100명

한 driver가 100명 운전한다.
운행 태우러갈떄 300만 거리 (매번)
승객은 300만 매번
====================

한 driver가 50명 x (50만 + 50만)

600만 x 100 x 5 = 
100만 x 50 = 5000만 x 5 TC = 2.5억점

====================

결론
2.5억점 ~ 30억점

====================
```