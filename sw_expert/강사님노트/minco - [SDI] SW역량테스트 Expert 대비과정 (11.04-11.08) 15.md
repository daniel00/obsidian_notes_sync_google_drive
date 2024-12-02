---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11495
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:06.46
---
```cpp
#include <iostream>
using namespace std;

class PQ {
public:
    static const int MAX_SIZE = 100;

    int heap[MAX_SIZE] = { 0 };
    int heapSize = 0;

    void heapInit(void)
    {
        heapSize = 0;
    }

    int heapPush(int value)
    {
        //유효성검사
        if (heapSize + 1 > MAX_SIZE)
        {
            printf("queue is full!");
            return 0;
        }

        //맨뒤에 하나 넣는다. 
        heap[heapSize] = value;

        //맨마지막부터시작해서
        // 이 위치가 나의 위치인가???
        //만약 내위치예요. 끝
        //내위치가 아니예요. 부모랑 바꿈.
        int current = heapSize;

        //[변경 포인트 1]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //heap[current] < heap[(current - 1) / 2]
        //이 부분의 부등호를 바꾸면 Max Heap이 된다.
        while (current > 0 && heap[current] < heap[(current - 1) / 2])
        {
            //부모랑 바꿔야지
            int temp = heap[(current - 1) / 2];
            heap[(current - 1) / 2] = heap[current];
            heap[current] = temp;

            //현재 내위치는 부모 위치가 됨.
            current = (current - 1) / 2;
        }

        heapSize = heapSize + 1;

        return 1;
    }

    int heapPop(int* value)
    {
        if (heapSize <= 0)
        {
            return -1;
        }

        *value = heap[0]; //목
        heapSize = heapSize - 1;

        heap[0] = heap[heapSize]; //맨 밑에 있는애로 덮어쓰기

        //반복 반위에있는 애 기준에서 내 위치인가?
        int current = 0;

        //while 반복   
        while (current * 2 + 1 < heapSize)
        {
            int child;
            if (current * 2 + 2 == heapSize)
            {
                child = current * 2 + 1;
            }
            else
            {
                //[변경 포인트 2]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                //heap[current * 2 + 1] < heap[current * 2 + 2]
                //이 부분의 부등호를 바꾸면 Max Heap이 된다.
                //둘중 작은 자식 선택
                child = heap[current * 2 + 1] > heap[current * 2 + 2] ? current * 2 + 1 : current * 2 + 2;
            }

            //[변경 포인트 3]!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            //이 부분의 부등호를 바꾸면 Max Heap이 된다.
            //나랑 둘중 작은 자식이랑 비교
            if (heap[current] > heap[child])
            {
                break;
            }

            int temp = heap[current];
            heap[current] = heap[child];
            heap[child] = temp;

            current = child;
        }
        return 1;
    }
};

int main() {
    PQ q;

    q.heapPush(3);
    q.heapPush(5);
    q.heapPush(1);

    int a, b, c;

    q.heapPop(&a);
    q.heapPop(&b);
    q.heapPop(&c);

    cout << a << b << c;
}
```