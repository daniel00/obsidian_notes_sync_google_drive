---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11492
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:07.48
---
reference 코드 없이 Queue 변환

```cpp
#include <iostream>
#include <vector>
#include <queue>
using namespace std;

int dirY[4] = { -1, 1, 0, 0 };
int dirX[4] = { 0, 0, 1, -1 };
struct Node {
	int y, x;
};

//queue<Node> q;
Node q[1000000];
int head = 0;
int tail = 0;
////

int map[3][3];
int main() {

	//q.push({ 1, 2 });
	q[tail++] = { 1, 2 };
	/////

	map[1][2] = 1;

	//while (!q.empty()) {
	while (head != tail) {

		//Node now = q.front();
		//q.pop();
		Node now = q[head++];

		for (int t = 0; t < 4; t++) {
			int ny = now.y + dirY[t];
			int nx = now.x + dirX[t];
			if (ny < 0 || nx < 0 || ny >= 3 || nx >= 3)continue;
			if (map[ny][nx] != 0) continue;
			map[ny][nx] = map[now.y][now.x] + 1;
			
			//q.push({ ny, nx });
			q[tail++] = { ny, nx };
		}
	}

	int a = 10;
}
```