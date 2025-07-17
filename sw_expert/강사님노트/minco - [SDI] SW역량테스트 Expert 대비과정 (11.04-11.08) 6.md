---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11507
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
  - 2차원배열전역
updated: 2024-11-08 01:01.01
---
- ![](https://pro.mincoding.co.kr/img/logo_01.580320d1.svg)
- Level별 문제
- 집합교육
- 공지사항
- 읽어보세요

![](https://pro.mincoding.co.kr/img/logo_01.580320d1.svg)

- Home
- Level별 문제
- 집합교육
- 공지사항
- 읽어보세요

- 강의 HOME
- 강사님 자료
- 문제 목록
- 채점 결과
- 질문게시판
- 랭킹

2차원 배열 - 전역배열 사용

```cpp
2차원 배열을 전역배열로 쓰는 방법

ex)

//배열포인터. 로 2차원 배열을 가리킬 수 있음.
int (*arr)[100];

void init(int arr[][100]) {
    ::arr = arr;
}

void go() {
    arr[0][0] = 100;
}
```

© 2021 MINCODING ALL RIGHTS RESERVED