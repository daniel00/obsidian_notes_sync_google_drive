---
title: "Deque 사용"
source: "https://pro.mincoding.co.kr/enterprise/contest/sdi/593/announcements/12652"
author:
published:
created: 2025-06-22
description:
tags:
  - "clippings"
---
```cpp
#include <iostream>

class Deque { //덱 (양방향큐)
public:
    static const int MAX = 100;

    int arr[MAX];
    int front;
    int rear;
    int size;

    void dequeInit(int n) {
        front = -1;
        rear = 0;
        size = n;
    }

    bool isFull() {
        return ((front == 0 && rear == size - 1) || front == rear + 1);
    }

    bool isEmpty() {
        return (front == -1);
    }

    void insertFront(int value) {
        if (isFull()) {
            printf("Overflow\n");
        }

        if (front == -1) {
            front = rear = 0;
        }
        else if (front == 0) {
            front = size - 1;
        }
        else {
            front = front - 1;
        }

        arr[front] = value;
    }

    void push_back(int value) {
        if (isFull()) {
            printf("Overflow\n");
        }

        if (front == -1) {
            front = rear = 0;
        }
        else if (rear == size - 1) {
            rear = 0;
        }
        else {
            rear = rear + 1;
        }

        arr[rear] = value;
    }

    int getFront() {
        if (isEmpty()) {
            printf("Underflow\n");
            return -1;
        }
        return arr[front];
    }

    int getRear() {
        if (isEmpty() || rear < 0) {
            printf("Underflow\n");
            return -1;
        }
        return arr[rear];
    }

    void deleteFront() {
        if (isEmpty()) {
            printf("Underflow\n");
            return;
        }

        if (front == rear) {
            front = -1;
            rear = -1;
        }
        else if (front == size - 1) {
            front = 0;
        }
        else {
            front = front + 1;
        }
    }

    void pop_back() {
        if (isEmpty()) {
            printf("Underflow\n");
            return;
        }

        if (front == rear) {
            front = -1;
            rear = -1;
        }
        else if (rear == 0) {
            rear = size - 1;
        }
        else {
            rear = rear - 1;
        }
    }
};

//vector<int> arr[5];
Deque alist[3];

int main() {
    alist[0].push_back(3);
    alist[0].push_back(4);
    alist[1].push_back(6);

    std::cout << alist[1].getRear();
}
```