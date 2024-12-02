---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11493
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:07.28
---
```cpp
#include <iostream>
#include <queue>
using namespace std;

class Queue {
public:
    static const int MAX_N = 10005;

    int front = 0;
    int rear = 0;
    int queue[MAX_N] = { 0 };

    void queueInit(void)
    {
        front = 0;
        rear = 0;
    }

    int queueIsEmpty(void)
    {
        return (front == rear);
    }

    int queueIsFull(void)
    {
        if ((rear + 1) % MAX_N == front)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }

    int queueEnqueue(int value)
    {
        if (queueIsFull())
        {
            printf("queue is full!");
            return 0;
        }
        queue[rear] = value;
        rear++;
        if (rear == MAX_N)
        {
            rear = 0;
        }

        return 1;
    }

    int queueDequeue(int* value)
    {
        if (queueIsEmpty())
        {
            printf("queue is empty!");
            return 0;
        }
        *value = queue[front];
        front++;
        if (front == MAX_N)
        {
            front = 0;
        }
        return 1;
    }
};

int main() {
    Queue q;

	int N = 5;
	int K = 3;
	cin >> N >> K;

	for (int i = 0; i < N; i++) {
        q.queueEnqueue(i + 1);
	}

	while (!q.queueIsEmpty()) {
		//K - 1번 뻇다 넣다.
		for (int i = 0; i < K - 1; i++) {
            int t = 0;
            q.queueDequeue(&t);
            q.queueEnqueue(t);
		}

		//K번째는 빼고 출력
        int ret;        
        q.queueDequeue(&ret);

		cout << ret << " ";
	}
}
```