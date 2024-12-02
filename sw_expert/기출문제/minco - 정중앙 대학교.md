---
title: minco | 정중앙 대학교
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/problem/SM02_04
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 00:54.17
---
정중앙 대학교는 성적이 정확히 중앙에 있는 사람만 입학할 수 있습니다.

정중앙 대학교에 입학하고 싶은 준하는 기준 점수를 실시간으로 파악하고 싶어합니다.

![142743ce2d27e4dd447306fc1b692ddc.png](https://pro.mincoding.co.kr/public/upload/e1e385f057.png)  
 

정중앙 대학교는 500점 기준으로 시작됩니다.

이제 두 사람씩 수능 점수를 입력 받습니다.

700점, 600점을 받은 사람이 등장한다면, 수능 기준 점수는 600점이 됩니다. (500, 600, 700)

400점, 300점을 받은 사람이 등장한다면, 수능 기준 점수는 500점이 됩니다. (300, 400, 500, 600, 700)

100점, 200점을 받은 사람이 등장한다면, 수능 기준 점수는 400점이 됩니다. (100, 200, 300, 400, 500, 600, 700)

370점, 430점을 받은 사람이 등장한다면, 수능 기준 점수는 400점이 됩니다. (100, 200, 300, 370, 400, 430, 500, 600, 700)

중앙에 있는 점수를 찾아 출력해 주세요.

**\[유의사항\]**

50 500 1500 인 경우, 정중앙에 해당되는 값은 500점 입니다.

(50 + 1500) / 2 가 중앙값이 아닙니다.

입력

첫 줄에는 입력 받을 줄 수 N이 입력 됩니다. ( 1 <=  N <= 1,000,000)

두 사람 씩, N 회 점수를 입력받으세요. ( 0 <= 각 점수 <= 1,000,000,000)

입력을 받을 때마다, 정중앙 대학교에 입학하기 위한 기준 점수를 출력해 주세요.

출력

두 점수가 입력 될 때 마다,

중앙에 있는 점수를 한 줄씩 출력합니다.

입력 예시 1

```
4
700 600
400 300
100 200
370 430
```

힌트

1,000,000줄의 입력과 출력이 들어옵니다.

최대한 빠른 입출력을 진행해야 합니다.

**C++**

```cpp
int main() {
   ios_base::sync_with_stdio(false);
   cout.tie(0);
   cin.tie(0); 
   
   // ... code here
}
```

**Java**

```cpp
BufferedReader br = new BufferedReader(new InputStreamReader(System.in))); // 빠른 입력을 위한 buffered reader
BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out))); // 빠른 출력을 위한 buffered writer 
```