---
title: minco | 산타의 선물
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/problem/SM02_06
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 00:55.19
---
큰 인플레이션이 발생하여 선물의 가격이 올랐습니다.

수백 년 동안 아이들의 꿈이 되어준 산타 할아버지는 큰 결심을 했습니다.

아이들을 지역별, 나이별로 분류하여, 선행 점수가 가장 높은 그룹의 아이들에게만 선물을 주기로 했습니다.

![](https://pro.mincoding.co.kr/public/upload/7f7ff14625.png)

만약 산타가 다음과 같은 선행 점수 리스트를 가지고 있다고 가정하겠습니다.

- 대한민국, 강릉, 15세, 50점
- 미국, 뉴욕, 16세, 70점
- 대한민국, 강릉, 15세, 40점
- 미국, 뉴욕, 10세, 60점

위 경우 대한민국 강릉 사는 15세 아이들이 총 90점으로 (50점 + 40점)

가장 높은 선행 점수를 얻었기에 산타에게 선물을 받을 수 있습니다.

아이들의 나라, 지역구, 나이, 선행 점수 정보가 주어질 때,

산타가 선물을 주어야 하는 아이들의 정보를 출력하는 프로그램을 작성해 주세요.

입력

첫 번째 줄에 아이들의 수 N이 주어집니다. 

- 1 ≤ N ≤ 300,000

이어지는 N개의 줄에 걸쳐

아이들의 정보가 나라 이름, 지역구 이름, 나이, 선행 점수의 순서대로 주어집니다.

- 나라 이름, 지역구 이름은 모두 25이하 길이의 문자열로 주어집니다.
- 1 ≤ 나이 ≤ 10
- 1 ≤ 선행 점수 ≤ 1,000

선행 점수의 합계가 동일한 경우는 입력으로 주어지지 않습니다.

출력

가장 좋은 선물을 받는 아이들의 

나라 이름, 지역구 이름, 나이를 찾아 출력해주세요.

입력 예시 1

```
10
SouthKorea Daejeon 1 35
SouthKorea Daegu 1 308
Albania Ballsh 1 778
SouthKorea Seoul 3 590
SouthKorea Daegu 4 900
SouthKorea Seoul 1 776
Albania Ballsh 1 290
SouthKorea Busan 3 98
SouthKorea Busan 3 561
Albania Ballsh 1 146
```