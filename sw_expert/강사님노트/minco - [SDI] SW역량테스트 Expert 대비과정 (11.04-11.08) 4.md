---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11509
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 00:59.54
---
143억  
미리pID별로 dID 배열을 만들어둔다.  
(특정 상품을 원하는 배송지 리스트)

Loop {  
  - 가까운 센터 찾기( )  
  - 라우팅 플랜 세우기  
     - 센터가 취급하는 물건들 중에  
       가까운 delivery 찾기  
     - 전체 30개만 계획 세우기  
  - 라우팅 플랜대로 차에 싣기  
  - 차량 플랜대로 이동시키기  
}

```cpp
// *** user.cpp ***
#include <iostream>
#include <vector>
#define ABS(x)    ((x) > 0 ? (x) : -(x))
using namespace std;

struct Coordinates
{
	int y;
	int x;
	Coordinates() {
		y = x = 0;
	}
	Coordinates(int _y, int _x) {
		y = _y;
		x = _x;
	}
	int operator-(Coordinates& param) {
		return ABS(y - param.y) + ABS(x - param.x);
	}
};

struct Product
{
	int id;
	int count;
	Product() {
		id = count = 0;
	}
	Product(int _id, int _count) {
		id = _id;
		count = _count;
	}
};

extern int truckMove(int deliveryID);
extern int truckLoading(int centerID, int packageList[], int listSize);

//=================================문제 초기화
const int centerCnt = 1000;
const int productTypeCnt = 10000;
const int deleveryCnt = 1000000;
Coordinates* centerCoordinatesList;
Product(*centerProductList)[100];
int* centerProductSize;
Coordinates* deliveryCoordinatesList;
int* deliveryProductList;
Coordinates truckCoordinates;

void sendCenterList(int N, int M, Coordinates centerCoordinatesList[],
	Product centerProductList[][100], int centerProductSize[]) {
	::centerCoordinatesList = centerCoordinatesList;
	::centerProductList = centerProductList;
	::centerProductSize = centerProductSize;
}

void sendDeliveryList(int K, Coordinates deliveryCoordinatesList[],
	int deliveryProductList[]) {
	::deliveryCoordinatesList = deliveryCoordinatesList;
	::deliveryProductList = deliveryProductList;
}

//================================= 구현시작
//deliveryByPID 배열은 배송지 목록이 된다.
//이 배열에 있는 값이 모두 없어지면 배송이 완료된 것이다.
vector<int> deliveryByPID[productTypeCnt];

//센터별 남아있는 물건 개수
int leftProductBycenter[centerCnt];

void makeDeliveryByPID() {
	for (int i = 0; i < productTypeCnt; i++) {
		deliveryByPID[i].clear();
	}

	for (int i = 0; i < deleveryCnt; i++) {
		int pID = deliveryProductList[i];
		deliveryByPID[pID].push_back(i);
	}
}

//deliveryByPID 에서 deliID 값을 삭제한다.
void removeDeliID(int deliID) {
	int pID = deliveryProductList[deliID];

	auto which = find(deliveryByPID[pID].begin(), deliveryByPID[pID].end(), deliID);
	deliveryByPID[pID].erase(which);
}

void init() {
	makeDeliveryByPID();

	for (int i = 0; i < centerCnt; i++) {
		for (int x = 0; x < centerProductSize[i]; x++) {
			leftProductBycenter[i] += centerProductList[i][x].count;
		}
	}
}

//현재 트럭위치에서 가까운 물류센터를 알아낸다.
int getCloseCenter() {
	int minGap = 21e8;
	int minCenterID = -1;

	for (int i = 0; i < centerCnt; i++) {
		if (leftProductBycenter[i] == 0) continue;
		if (minGap > truckCoordinates - centerCoordinatesList[i]) {
			minGap = truckCoordinates - centerCoordinatesList[i];
			minCenterID = i;
		}
	}
	return minCenterID;
}

//라우팅 플랜을 세워, 배송지 리스트를 준다.
//라우팅 플랜에 따라 차에 상품을 미리 실어놓는다.
//배송은 아직 안했지만, 센터별 남아있는 상품 리스트에는 개수가 차감되어있다.
vector<int> getRountingPlan(int centerID) {
	vector<int> result;
	Coordinates now = centerCoordinatesList[centerID];

	for (int turn = 0; turn < 30; turn++) {
		//한번 반복할떄마다 하나씩 라우팅 계획 결정!
		//총 30개 짐을 싣겠다.

		int minGap = 21e8;
		int minDeliID = -1;
		int minCenterIndex = -1;

		//센터에 있는 상품들 중 하나 선택
		for (int i = 0; i < centerProductSize[centerID]; i++) {
			int& pID = centerProductList[centerID][i].id;
			int& count = centerProductList[centerID][i].count;

			if (count == 0) continue;

			//그 상품들 중 가장 가까운 곳 찾기
			for (int deliID : deliveryByPID[pID]) {
				if (minGap > now - deliveryCoordinatesList[deliID]) {
					minGap = now - deliveryCoordinatesList[deliID];
					minDeliID = deliID;
					minCenterIndex = i;
				}
			}
		}

		//센터 상품들에 대한 배송지가 더이상 없는 경우
		if (minCenterIndex == -1) {
			leftProductBycenter[centerID] = 0;
			break;
		}

		//센터에서 취급하는 모든 상품 중 가장 가까운 곳 배송지 선택
		result.push_back(minDeliID);
		centerProductList[centerID][minCenterIndex].count -= 1;
		leftProductBycenter[centerID] -= 1;
		removeDeliID(minDeliID);

		//센터에 더이상 상품이 안남았다면 종료
		if (leftProductBycenter[centerID] == 0) break;

		//현재 위치 옮기기
		now = deliveryCoordinatesList[minDeliID];
	}
	return result;
}

//배송지역별 원하는 상품 리스트를 리턴한다.
vector<int> getPackageList(vector<int> plan) {
	vector<int> result;
	for (int deliID : plan) {
		int pID = deliveryProductList[deliID];
		result.push_back(pID);
	}
	return result;
}

void solve(Coordinates truckCoordinates) {
	::truckCoordinates = truckCoordinates;

	//pID 별로 deliveryID가 어디에있는지 배열
	init();

	int leftDeliveryCnt = deleveryCnt;

	while (leftDeliveryCnt != 0) {
		cout << leftDeliveryCnt << " ... \n";

		//1. 가까운 센터찾기
		int cID = getCloseCenter();

		//2. 라우팅 계획 세우기
		vector<int> plan = getRountingPlan(cID);
		if (plan.size() == 0) continue;

		//3. [dID, dID, dID, dID]
		   //[pID, pID, pID, pID]
		vector<int> packages = getPackageList(plan);

		//센터 이동 후, 트럭에 적재를 알림
		truckLoading(cID, packages.data(), packages.size());

		//라우팅 플랜에 따라 모두 이동하기
		for (int deliID : plan) {
			truckMove(deliID);
		}

		//남은 개수 계산
		leftDeliveryCnt -= plan.size();

		//트럭 위치 이동
		int lastDeliID = *plan.rbegin();
		truckCoordinates = deliveryCoordinatesList[lastDeliID];
	}
}
```