---
title: "민코딩 - 프로그래밍 훈련사이트"
source: "https://pro.mincoding.co.kr/enterprise/contest/sdi/593/problem/14486"
author:
published:
created: 2025-05-14
description:
tags:
  - "clippings"
---
C++ 시간 제한

1,000 ms

메모리 제한

256 MB

정답률

11 / 24 (45.83%)

입력된 값들을 Sort Library 를 사용하여 정렬 해 주세요.

총 세 가지 타입으로 정렬 후 출력하면 됩니다.  

만약 다음과 같이 입력을 받았다면,

![dd1.png](https://pro.mincoding.co.kr/public/upload/3494508d9f.png)  

**\[Type 1\]**  

수를 오름차순으로 정렬하여 출력합니다.

![dd2.png](https://pro.mincoding.co.kr/public/upload/4f5b0a86e2.png)  

**\[Type 2\]**

수를 내림차순으로 정렬하여 출력합니다.

![dd3.png](https://pro.mincoding.co.kr/public/upload/2ed5d8694b.png)  

**\[Type 3\]**

수와 문자를 다음과 같은 우선순위 조건으로 정렬 후 출력합니다.

1. 짝수 우선
2. 작은 수 우선
3. 사전 순으로 앞쪽 문자 우선 (문자 코드 작은 값 우선)

![dd4.png](https://pro.mincoding.co.kr/public/upload/e48247bb01.png)  

Type 1, 2, 3 의 정렬된 결과를 각 줄 마다 출력 해주시면 됩니다.

입력

정렬 할 값의 개수 N 을 입력 받습니다. (1 <= N <= 100,000)

두 번째 줄에 숫자로 구성된 N개의 값을 입력 받습니다.

세 번째 줄에 문자로 구성된 N개의 값을 입력 받습니다.

출력

첫 번째 줄에는 \[Type 1\] 의 결과를 출력 하세요.

두 번째 줄에는 \[Type 2\] 의 결과를 출력하세요.

세 번째와 네 번째는 \[Type 3\] 의 결과를 출력하세요.

입력 예시 1

```java
7
1 3 5 2 4 5 5
A B C D E G F
```

출력 예시 1

```java
1 2 3 4 5 5 5 
5 5 5 4 3 2 1 
2 4 1 3 5 5 5 
D E A B C F G
```

힌트

비교 가능한 타입 생성 예시 (Node Class, 수 내림차순)

```java
class Node implements Comparable<Node> {
    int n;
    char ch;

    @Override
    public int compareTo(Node a) {
        return Integer.compare(a.n, n);    
    }
};
```

Main 함수 내 Sort 사용방법

```java
Arrays.sort(arr);
Arrays.sort(arr, Comparator.reverseOrder());
```

```java
xxxxxxxxxx
```

1

```java
​
```