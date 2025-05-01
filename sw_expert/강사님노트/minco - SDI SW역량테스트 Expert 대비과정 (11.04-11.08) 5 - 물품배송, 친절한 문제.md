---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11508
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:00.18
---
```cpp
물품배송 - 친절한 문제 만들기
1,000 x 1,000 맵에는
1개의 트럭(truck), 정확히 1,000개의 물류센터(center)
그리고 정확히 1,000,000개의 배송지(delivery)가 존재한다.

[delivery]
각각의 delivery는, 하나의 물품에 대한 배송지역이다.
배송지역은 겹칠 수 도 있다.

[center]
center에는 다양한 물품(product)가 존재한다.
각 물품은 pID값을 가지며, pID 당 수량이 있다.
(ex. 특정 center는 pID 3번 50개, pID 2번 25개 존재..)

[truck]
배송 트럭(truck)은 center에서 물건을 실어,
각 배송지(delivery)에 배송을 해주어야 한다.
이 truck은 center에 들렸을 때, product를 최대 50개까지 실을 수 있다.
(ex. [3, 3, 5, 5, 5, 2] = 총 6개의 물품을 실은 배열 형태)

[목적]
택배차량의 초기 위치가 주어질 때,
center에서 물건을 실으며, delivery를 모두 배송할 때 드는 비용의 합을
최소가 되도록 truck을 움직이는 문제이다.

[호출해야하는 함수]
1. truckMove(deliveryID) : 트럭을 특정 배송지로 이동시킨다.
2. truckLoading(centerID, packageList, ...) : 트럭을 특정 center로 이동후 packageList 물건을 싣다.

[세부사항]
- center에는 최대 10,000개의 물품 수량이 존재한다.
- center에는 최대 100개의 pID가 존재한다.
- center에 물건이 없어, delivery 를 배송 못하는 경우는 없다.
- 각 delivery는 pID 물품 1개만 배송하면 된다.

[채점방식]
SCORE += dist * (100 + truck_package_count * 10);
(트럭이 실은 짐의 수 x 10 + 100) x 50
트럭에 짐을 조금 실고 이동하면 점수가 더 최적화 될 수 도 있다.
 

추정
delivery는 100만, center는 1000개 있으니까, center당 1000개 배송지 처리할 수 있겠다.
한번에 50개 꽉꽉 채운다면, 한 center 당에 20회는 들려야 20 x 5 = 1000개 물품을 실을 수 있겠다.
center 방문횟수는 배송지 100만 / 1회 배송수 50개 = 2만번 center에 들려야하네.
특정 ID를 가진 물품의 배송지 = 약 100만 / pID는 10000개 = pID당 100개 수준 배송지 있음.
 

 
```