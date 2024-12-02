---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11491
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:08.06
---
1. Class로 묶음
2. Public
3. #define 을 static const int 로 변환
4. 필드 모두 0 으로 초기화

```cpp
#include <iostream>
#include <vector>
using namespace std;

class Queue {
public:
    static const int MAX_N = 100;
    //#define MAX_N 100

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

    q.queueEnqueue(2);
    q.queueEnqueue(5);

    int ret = 0;
    q.queueDequeue(&ret);
    cout << ret;
}
```