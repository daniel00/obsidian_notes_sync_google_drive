---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11494
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:07.07
---
```cpp
#include <iostream>
//#include <string.h>
#include <cstring>
#include <queue>
using namespace std;

int map[3][5] = {
	0,0,0,0,1,
	1,0,1,0,0,
	0,0,0,0,1,
};

struct Coordinate {
	int x, y;
	int lev;
};

int dirY[] = { -1, 1, 0, 0 };
int dirX[] = { 0, 0, 1, -1 };

Coordinate q[100000]; //12Byte * 1,200,000 = 1.2MB
int head = 0;
int tail = 0;
//queue<Coordinate> q;

int bfs(Coordinate start, Coordinate end) {
	int used[3][5] = { 0 };
	head = tail = 0;
	memset(q, 0, sizeof(q)); //string.h include 후 사용.
	//q = queue<Coordinate>(); //큐 초기화

	q[tail++] = start;
	//q.push(start);
	used[start.y][start.x] = 1;

	//while (!q.empty()) {
	while (head != tail) {
		//Coordinate now = q.front();
		Coordinate now = q[head++];
		//q.pop();

		for (int t = 0; t < 4; t++) {
			int ny = now.y + dirY[t];
			int nx = now.x + dirX[t];
			if (ny < 0 || nx < 0 || ny >= 3 || nx >= 5) continue;
			if (map[ny][nx] == 1) continue;
			if (used[ny][nx] == 1) continue;
			used[ny][nx] = 1;
			//q.push({ nx, ny, now.lev + 1 });
			q[tail++] = { nx, ny, now.lev + 1 };

			if (ny == end.y && nx == end.x) return now.lev + 1;
		}
	}

	cout << "ERROR : : 안돼\n";
	return -1;
}

int main() {
	int a, b, c, d;
	cin >> a >> b >> c >> d;

	int ret = bfs({ 0, 0 }, { b, a });
	ret += bfs({ b, a }, { d, c });
	cout << ret;
   
}
```