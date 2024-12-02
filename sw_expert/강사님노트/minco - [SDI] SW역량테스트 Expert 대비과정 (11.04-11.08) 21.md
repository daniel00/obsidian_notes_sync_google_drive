---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11489
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:09.39
---
### 1

```cpp
#include <iostream>
#include <vector>
using namespace std;

int arr[10000] = { 4, 2, 4, 1, 5, 6 };
int arr_cnt;

void go(int arr[]) {

}

int main() {
	
	//동적배열
	//vector<int> arr = { 4, 2, 4, 1, 5, 6 };

	arr[arr_cnt++] = 3;
	arr[arr_cnt++] = 2;
	arr[--arr_cnt] = 0;

	go(arr);
}
```

### 2

```cpp
#include <iostream>
#include <vector>
using namespace std;

void print(int arr[], int arr_n) {
	for (int i = 0; i < arr_n; i++) {
		int num = arr[i];
		cout << num << " ";
	}
	cout << "\n";
}

//vector<int> getPlusOne(vector<int> arr) {
void getPlusOne(int brr[], int arr[], int arr_n) {

	for (int i = 0; i < arr_n; i++) {
		int num = arr[i];
		brr[i] = num + 1;
		//result.push_back(num + 1);
	}
}

//void setPlus(vector<int>& arr, int num) {
void setPlus(int arr[], int arr_n, int num) {
	for (int i = 0; i < arr_n; i++) {
		arr[i] += num;
	}
}

int main() {
	int arr[] = { 1, 4, 2, 3 };
	int arr_n = 4;
	//vector<int> arr = { 1, 4, 2, 3 };
	print(arr, arr_n);

	//vector<int> brr = getPlusOne(arr);
	//print(brr);
	int brr[4];
	getPlusOne(brr, arr, arr_n);

	setPlus(arr, arr_n, 2);
	print(arr, arr_n);
}
```