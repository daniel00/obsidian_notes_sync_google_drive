---
title: "vector 코드"
source: "https://pro.mincoding.co.kr/enterprise/contest/sdi/593/announcements/12664"
author:
published:
created: 2025-06-22
description:
tags:
  - "clippings"
---
```cpp
#include <iostream>
using namespace std;

struct Vector {
    int* arr;
    int lastIndex;
    int capacity;

    Vector(int capacity) {
        this->capacity = capacity;
        arr = (int*)malloc(sizeof(int) * capacity);
        lastIndex = 0;
    }

    void push_back(int val) {
        if (lastIndex == capacity) {
            grow(); //capacity 부족하면 x 2배 재할당
        }
        arr[lastIndex++] = val;
    }

    void pop_back() {
        --lastIndex;
    }

    int get(int index) {
        return arr[index];
    }

    int size() {
        return lastIndex;
    }

    void grow() {
        capacity *= 2;
        int* newArray = (int*)malloc(sizeof(int) * capacity);
        for (int i = 0; i < lastIndex; i++) {
            newArray[i] = arr[i];
        }
        free(arr);
        arr = newArray;
    }
};
```