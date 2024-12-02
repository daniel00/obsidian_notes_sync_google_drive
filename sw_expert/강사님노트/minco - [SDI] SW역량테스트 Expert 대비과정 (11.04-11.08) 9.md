---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11501
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:03.41
---
### 내림차순

```cpp
#include <iostream>
using namespace std;

void quickSort(int input[], int first, int last)
{
    int pivot;
    int i;
    int j;
    int temp;

    if (first < last)
    {
        pivot = first; //기준! 쨸 왼쪽!!
        i = first; //포인터1 //큰애 감지
        j = last; //포인터 2 //작은애 감지

        while (i < j) //엇갈릴떄 까지 반복
        {
            //작은애들이 발견될떄마다 i++한다.
            //[변경 포인트 1] <= 이것 변경
            while (input[i] >= input[pivot] && i < last)
            {
                i++;
            }

            //[변경 포인트 2] <= 이것 변경
            //오른쪽에서 큰애가 발견될때마다 j--
            while (input[j] < input[pivot])
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

int main() {
    int arr[5] = { 4, 1, 6, 2, 3 };

    quickSort(arr, 0, 4);

    for (int i = 0; i < 5; i++) {
        cout << arr[i] << " ";
    }
}
```

### Custom Sort

```cpp
#include <iostream>
using namespace std;

//문제
//{1, 5}, {6, 3}, {4, 2}, {4, 1}  {y, x} 기준으로, 
//Sort 했을 때 ----> 
// 1. y가 더 큰값이 왼쪽에 배치
// 2. x가 작은값이 더 왼쪽에 배치

//Sort결과
//{6, 3} --> {4, 1} --> {4, 2} --> {1, 5}

struct Node {
    int y, x;

    bool operator>(const Node& other) {
        if (y != other.y) return y < other.y;
        return x > other.x;
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

int main() {
    
    Node arr[4] = { {1, 5}, {6, 3}, {4, 2}, {4, 1} };

    quickSort(arr, 0, 3);

    for (int i = 0; i < 4; i++) {
        cout << arr[i].y << "," << arr[i].x << "\n";
    }
}
```