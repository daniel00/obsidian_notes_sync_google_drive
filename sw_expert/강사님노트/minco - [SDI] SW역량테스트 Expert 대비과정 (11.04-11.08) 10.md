---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11500
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:04.59
---
```cpp
#include <iostream>
#include <queue>
using namespace std;

//Node axis[10000];
//queue<int> q;

struct Node {
	int id;
	int y, x;
};

struct Compare {
	bool operator()(const Node& v, const Node& t) {
		return t.id < v.id;
	}
};

//STL (Container Library)
//PQ 사용법
//비교 Functor C++ (함수인척하는 클래스)
priority_queue<Node, vector<Node>, Compare> pq;
int map[1001][1001];

int dirY[] = { -1, 1, 0, 0 };
int dirX[] = { 0, 0, 1, -1 };

//폭탄 설치
void setBoom(int id, int y, int x) {
	pq.push({ id, y, x });
}

//탕
void doBoom(int y, int x) {
	for (int t = 0; t < 4; t++) {
		int ny = y + dirY[t];
		int nx = x + dirX[t];
		if (ny < 0 || nx < 0 || ny >= 1000 || nx >= 1000) continue;
		map[ny][nx] = 1;
	}
	map[y][x] = 1;
}

int main() {

	int N, M;
	cin >> N >> M;

	for (int i = 0; i < N + M; i++) {
		int a;
		cin >> a;

		//탕
		if (a == 0) {
			while (1) {
				//터질 폭탄 없으면
				if (pq.empty()) {
					cout << -1 << "\n";
					break;
				}

				Node now = pq.top();
				pq.pop();
				if (map[now.y][now.x] == 1) continue;

				cout << now.id << "\n";
				doBoom(now.y, now.x);
				break;
			}
		}
		else { //설치
			int x, y;
			cin >> y >> x;
			
			setBoom(a, y, x);
		}
	}

}
```