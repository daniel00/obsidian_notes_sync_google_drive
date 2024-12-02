---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11497
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:06.01
---
```cpp
#include <iostream>
#include <queue>
using namespace std;

struct Node {
	int id;
	int y, x;
};

//id가 작은 값 먼저 나오게
struct Compare {
	bool operator()(const Node& v, const Node& t) {
		return t.id < v.id;
	}
};

//STL (Container Library)
//PQ 사용법
//비교 Functor C++ (함수인척하는 클래스)
priority_queue<Node, vector<Node>, Compare> pq;

int main() {

	pq.push({ 10, 0, 0 });
	pq.push({ 15, 0, 0 });
	pq.push({ 12, 0, 0 });

	cout << pq.top().id << "\n";
	pq.pop();
	
	cout << pq.top().id << "\n";
	pq.pop();
	
	cout << pq.top().id << "\n";
	pq.pop();

}
```