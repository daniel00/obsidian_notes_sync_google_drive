---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11505
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:01.40
---
### 솔루션

\[-2 4 -99 -1 98\] ---> -99 98

1\. 정렬한다.

2\. 맨 앞, 맨 뒷값 각각 a, b 라고 설정

3\. a + b = gap

gap의 Min 값을 찾아낸다. 정답은 min\_a, min\_b

### 정답코드

```cpp
#include <iostream>
#include <algorithm>
using namespace std;

int input[100005];
int mini = 21e8;
int minA, minB;

void refreshMin(int a, int b) {
	int gap = abs(a + b);
	if (mini > gap) {
		mini = gap;

		if (a < b) {
			minA = a;
			minB = b;
		}
		else {
			minA = b;
			minB = a;
		}
	}
}

int main() {
	int n;
	cin >> n;
	for (int i = 0; i < n; i++) {
		cin >> input[i];
	}
	
	//오름차순 정렬
	sort(input, input + n);

	//a, b는 왼쪽과 오른쪽 양 끝을 나타낸다.
	int a = 0;
	int b = n - 1;
	while (a != b) {
		int left = input[a];
		int right = input[b];

		//왼쪽 끝 값과, 오른쪽 끝 값만 합성을 해보면 된다.
		refreshMin(left, right);

		//0 에서 더 멀리 있는 값은 버린다.
		if (abs(left) <= abs(right)) b--;
		else a++;
	}

	cout << minA << " " << minB;
}
```