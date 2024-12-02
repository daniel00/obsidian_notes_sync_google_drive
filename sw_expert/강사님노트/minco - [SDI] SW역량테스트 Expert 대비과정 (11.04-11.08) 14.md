---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11496
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:06.26
---
```cpp
#include <iostream>
#include <queue>
using namespace std;

//민힙
//1. y작은거 먼저
//2. x큰것 먼저 (만약 y 가 같다면)
struct Node {
    int y, x;

    //비교가능한 구조체 (Comparable struct)
    bool operator<(const Node &other) {
        //y   other.y
        //x   other.x
        //첫 번째 비교
        if (y != other.y) return y < other.y;

        //두 번째 비교
        return x > other.x;
    }
};

class PQ {
public:
    static const int MAX_SIZE = 100;

    Node heap[MAX_SIZE] = { 0 }; //변경 1
    int heapSize = 0;

    void heapInit(void)
    {
        heapSize = 0;
    }

    int heapPush(Node value) //변경 2
    {
        if (heapSize + 1 > MAX_SIZE)
        {
            printf("queue is full!");
            return 0;
        }

        heap[heapSize] = value;

        int current = heapSize;
        while (current > 0 && heap[current] < heap[(current - 1) / 2])
        {
            Node temp = heap[(current - 1) / 2]; //변경 4, temp x 2개 변경
            heap[(current - 1) / 2] = heap[current];
            heap[current] = temp;
            current = (current - 1) / 2;
        }

        heapSize = heapSize + 1;

        return 1;
    }

    int heapPop(Node* value) //변경 3
    {
        if (heapSize <= 0)
        {
            return -1;
        }

        *value = heap[0];
        heapSize = heapSize - 1;

        heap[0] = heap[heapSize];

        int current = 0;
        while (current * 2 + 1 < heapSize)
        {
            int child;
            if (current * 2 + 2 == heapSize)
            {
                child = current * 2 + 1;
            }
            else
            {
                child = heap[current * 2 + 1] < heap[current * 2 + 2] ? current * 2 + 1 : current * 2 + 2;
            }

            if (heap[current] < heap[child])
            {
                break;
            }

            Node temp = heap[current]; //변경 4, temp x 2개 변경
            heap[current] = heap[child];
            heap[child] = temp;

            current = child;
        }
        return 1;
    }
};

int main() {

    PQ q;

    q.heapPush({ 5, 3 });
    q.heapPush({2, 7});
    q.heapPush({6, 9});

    Node a, b, c;

    q.heapPop(&a);
    q.heapPop(&b);
    q.heapPop(&c);

    cout << a.y << "," << a.x << "\n";
    cout << b.y << "," << b.x << "\n";
    cout << c.y << "," << c.x << "\n";
}
```