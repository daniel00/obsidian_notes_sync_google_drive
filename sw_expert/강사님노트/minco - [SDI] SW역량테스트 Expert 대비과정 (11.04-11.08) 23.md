---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11486
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:10.13
---
점수 평가방법  
 

**"가장 오랫동안 운행한 택시 기준으로 점수 측정"**  
 

따라서 다음과 같은 전략을 생각할 수 있다.

### \[전략 1\]

```cpp
택시 운전자가 일을 한 순서대로
랭킹을 세운다.

승객이 택시를 고른다.
일을 안한 1위 ~ 20위 사이 중,
가장 가까운 택시를 고른다.

(20위가 아닌 다른 순위로 실험을 통해 결정한다.)
```

### \[전략 2\] << 실험결과 가장 점수가 잘나옴.

```cpp
일을 가장 안한 택시를 먼저 선택한다.

Loop {
1. Working time 적게한 택시 선택
2. 가장 가까운 승객 - 운행 - 종료.
}
```

### 전략 2에 대한 더 구체적인 설계

```cpp
workTime[driver Cnt]

PQ - min heap
  dID 들을 넣어둡니다.
  working time 작은 순서대로 나옴

1. PQ에 하나 빼요.
   driver 결정

2. for - 모든 K 승객들 확인
      가장 가까운 pID를 골라요.

3. 운행합니다.

4. 운행끝나면 PQ, 운행한 Driver 정보를 갱신
   다시 PQ에 dID를 넣습니다.
```