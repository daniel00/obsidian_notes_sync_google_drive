---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11498
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:05.44
---
### STL 사용

```cpp
#include <iostream>
#include <queue>
using namespace std;

/*
struct custom {
	bool operator()(const int& v, const int& t) {
		//return 조건..
	}
};
*/

priority_queue<int> leftPQ; //max 우선
priority_queue<int, vector<int>, greater<>> rightPQ; //min 우선
//priority_queue<int, vector<int>, custom> cc;
int mid = 500;

int main() {
	ios_base::sync_with_stdio(false);
	cout.tie(0);
	cin.tie(0);

	int tcCnt;
	cin >> tcCnt;

	for (int i = 0; i < tcCnt; i++) {
		int a, b;
		cin >> a >> b;

		if (a > mid) {
			rightPQ.push(a);
		}
		else {
			leftPQ.push(a);
		}

		if (b > mid) {
			rightPQ.push(b);
		}
		else {
			leftPQ.push(b);
		}

		//균형 잡기
		if (rightPQ.size() > leftPQ.size()) {
			leftPQ.push(mid);
			mid = rightPQ.top();
			rightPQ.pop();
		}
		else if (rightPQ.size() < leftPQ.size()) {
			rightPQ.push(mid);
			mid = leftPQ.top();
			leftPQ.pop();
		}

		cout << mid << "\n";
	}
	

}
```

### reference Code 사용

```cpp
 #include <iostream>
#include <queue>
using namespace std;

class RightPQ {
public:
    static const int MAX_SIZE = 1000001;
    int heap[MAX_SIZE] = { 0 };
    int heapSize = 0;

    void heapInit(void)
    {
        heapSize = 0;
    }

    int heapPush(int value)
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
            int temp = heap[(current - 1) / 2];
            heap[(current - 1) / 2] = heap[current];
            heap[current] = temp;
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

            int temp = heap[current];
            heap[current] = heap[child];
            heap[child] = temp;

            current = child;
        }
        return 1;
    }
};
class LeftPQ {
public:
    static const int MAX_SIZE = 1000001;
    int heap[MAX_SIZE] = { 0 };
    int heapSize = 0;

    void heapInit(void)
    {
        heapSize = 0;
    }

    int heapPush(int value)
    {
        if (heapSize + 1 > MAX_SIZE)
        {
            printf("queue is full!");
            return 0;
        }

        heap[heapSize] = value;

        int current = heapSize;
        while (current > 0 && heap[current] > heap[(current - 1) / 2])
        {
            int temp = heap[(current - 1) / 2];
            heap[(current - 1) / 2] = heap[current];
            heap[current] = temp;
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
                child = heap[current * 2 + 1] > heap[current * 2 + 2] ? current * 2 + 1 : current * 2 + 2;
            }

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

int mid = 500;

RightPQ rightPQ;
LeftPQ leftPQ;

int main() {
	ios_base::sync_with_stdio(false);
	cout.tie(0);
	cin.tie(0);

	int tcCnt;
	cin >> tcCnt;

	for (int i = 0; i < tcCnt; i++) {
		int a, b;
		cin >> a >> b;

		if (a > mid) {
			//rightPQ.push(a);
            rightPQ.heapPush(a);
		}
		else {
			//leftPQ.push(a);
            leftPQ.heapPush(a);
		}

		if (b > mid) {
			//rightPQ.push(b);
            rightPQ.heapPush(b);
		}
		else {
			//leftPQ.push(b);
            leftPQ.heapPush(b);
		}

		//균형 잡기
		if (rightPQ.heapSize > leftPQ.heapSize) {
			leftPQ.heapPush(mid);
            rightPQ.heapPop(&mid);
		}
		else if (rightPQ.heapSize < leftPQ.heapSize) {
			rightPQ.heapPush(mid);
            leftPQ.heapPop(&mid);
		}

		cout << mid << "\n";
	}
	

}
```