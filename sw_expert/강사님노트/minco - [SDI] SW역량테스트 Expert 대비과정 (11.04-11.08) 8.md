---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11502
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:02.55
---
```cpp
#include <iostream>
using namespace std;

struct Node {
    int start, end;

    bool operator>(const Node& other) {
        if (end != other.end) return other.end < end;
        return other.start < start;
    }
};

void quickSort(Node input[], int first, int last)
{
    int pivot;
    int i;
    int j;
    Node temp;

    if (first < last)
    {
        pivot = first; //기준! 쨸 왼쪽!!
        i = first; //포인터1 //큰애 감지
        j = last; //포인터 2 //작은애 감지

        while (i < j) //엇갈릴떄 까지 반복
        {
            //작은애들이 발견될떄마다 i++한다.
            //[변경 포인트 1] <= 이것 변경
            while (!(input[i] > input[pivot]) && i < last)
            {
                i++;
            }

            //[변경 포인트 2] <= 이것 변경
            //오른쪽에서 큰애가 발견될때마다 j--
            while (input[j] > input[pivot])
            {
                j--;
            }

            if (i < j)
            {
                //바꿈
                temp = input[i];
                input[i] = input[j];
                input[j] = temp;
            }
        }

        //기준!~~ 오른쪽에서 오던 포인터 j SWAP
        temp = input[pivot];
        input[pivot] = input[j];
        input[j] = temp;
        /////////////// 기준  왼쪽 작은애 / 큰애는 오른쪽 배치

        quickSort(input, first, j - 1);
        quickSort(input, j + 1, last);
    }
}

Node arr[100001];

int main() {

    int n;
    cin >> n;

    for (int i = 0; i < n; i++) {
        int a, b;
        cin >> a >> b;
        arr[i] = { a, b };
    }
    
    quickSort(arr, 0, n - 1);

    int cnt = 0;
    int time = -1;
    for (int i = 0; i < n; i++) {
        Node tar = arr[i];

        if (tar.start >= time) {
            cnt++;
            time = tar.end;
        }
    }

    cout << cnt;
}
```