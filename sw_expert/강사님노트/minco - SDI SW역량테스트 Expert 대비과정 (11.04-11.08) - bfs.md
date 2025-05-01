---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11513
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 00:57.47
---
```cpp
#include <iostream>
//#include <queue>
using namespace std;

int map[5][6] = {
	0,0,1,0,0,0,
	1,0,1,0,1,0,
	0,0,0,0,1,0,
	0,1,0,1,1,0,
	0,1,0,0,0,0,
};
//0,0 에서 출발해서 4, 5까지

struct Node {
	int y, x, lev;
	int parent;
};
//queue<Node> q;
Node q[10000];
int head;
int tail;

int used[5][6];
int dirY[] = { -1, 1, 0, 0 };
int dirX[] = { 0, 0, 1, -1 };

int main() {
	head = 0;
	tail = 0;
	q[tail++] = { 0, 0, 0, -1 };
	used[0][0] = 1;

	int exitFlag = 0;
	while (head != tail) {
		//Node now = q.front();
		//q.pop();
		Node now = q[head];

		for (int t = 0; t < 4; t++) {
			int ny = now.y + dirY[t];
			int nx = now.x + dirX[t];
			if (ny < 0 || nx < 0 || ny >= 5 || nx >= 6) continue;
			if (used[ny][nx] == 1) continue;
			if (map[ny][nx] == 1) continue;

			used[ny][nx] = 1;

			//q.push({ ny, nx, now.lev + 1,  });
			q[tail++] = { ny, nx, now.lev + 1, head };

			if (ny == 4 && nx == 5) {
				cout << "도착 " << now.lev + 1 << "\n";
				exitFlag = 1;
				break;
			}
		}
		if (exitFlag == 1) break;

		head++;
	}

	int now = tail - 1;

	while(1) {
		cout << q[now].y << "," << q[now].x << "\n";
		now = q[now].parent;	
		if (now == -1) break;
	}

}
```