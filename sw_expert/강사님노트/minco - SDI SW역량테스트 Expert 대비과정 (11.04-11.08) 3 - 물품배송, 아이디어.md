---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11510
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 00:59.20
---
### 아이디어

- 각 Delivery 마다 담당할 Center를 결정을 미리 해둔다.

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
const int deliveryCnt = 1000000;
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

//배송완료 여부 체크
int isFinish[deliveryCnt];

//센터별 할당된 남아있는 고객수
int leftCustomerByCenter[centerCnt];

//센터별 남아있는 Product별 수량
int productCntByCenterID[centerCnt][productTypeCnt];

//최적화 : 센터가 담당하는 배송지 리스트를 만들어야한다.
vector<int> deliIDByCenter[centerCnt]; //센터 담당 배송지 리스트
int centerID_DATByPID[productTypeCnt][centerCnt]; //센터가 담당하는 배송지 리스트를 만들기 위한 재료1
vector<int> centerIDByPID[productTypeCnt]; //센터가 담당하는 배송지 리스트를 만들기 위한 재료2

//센터가 관리하는 정보들 만들기
void init() {
	//1. 센터당 취급한 토탈 상품 개수 세기
	for (int i = 0; i < centerCnt; i++) {
		for (int x = 0; x < centerProductSize[i]; x++) {
			int pID = centerProductList[i][x].id;
			int pCount = centerProductList[i][x].count;

			//센터랑 계약 
			productCntByCenterID[i][pID] += pCount;
		}
	}

	//2-1. pID가 존재하는 센터들이 누군지 알 수 있는 체크배열 만들기 (DAT)
	for (int i = 0; i < centerCnt; i++) {
		for (int x = 0; x < centerProductSize[i]; x++) {
			int pID = centerProductList[i][x].id;
			centerID_DATByPID[pID][i] = 1;
		}
	}

	//2-2. 방금만든 체크배열을 이용하여
	//     pID가 존재하는 센터들 리스트 만들기
	for (int i = 0; i < productTypeCnt; i++) {
		for (int x = 0; x < centerCnt; x++) {
			if (centerID_DATByPID[i][x] == 0) continue;
			centerIDByPID[i].push_back(x);
		}
	}

	//3. 각 센터는 어떤 배송지를 담당할지를 결정한다.
	//   방법 : 각 배송지마다 가까운 센터를 선택한다.
	//   조건 : 배송지와 센터가 가깝더라도, 수량이 모자릴수도있다.
	for (int i = 0; i < deliveryCnt; i++) {
		int pid = deliveryProductList[i];

		int minGap = 21e8;
		int minCID = -1;
		for (int x = 0; x < centerIDByPID[pid].size(); x++) {
			int cID = centerIDByPID[pid][x];
			if (productCntByCenterID[cID][pid] == 0) continue;
			if (minGap > deliveryCoordinatesList[i] - centerCoordinatesList[cID]) {
				minGap = deliveryCoordinatesList[i] - centerCoordinatesList[cID];
				minCID = cID;
			}
		}

		//가장 거리가 가까운 센터에 해당 배송지를 할당한다.
		deliIDByCenter[minCID].push_back(i);
		productCntByCenterID[minCID][pid] -= 1;
	}

	//4. 각 센터별로 정확히 할당된 배송지 갯수를 저장해둔다.
	for (int i = 0; i < centerCnt; i++) {
		leftCustomerByCenter[i] = deliIDByCenter[i].size();
	}
}

//현재 트럭위치에서 가까운 물류센터를 알아낸다.
int getCloseCenter() {
	int minGap = 21e8;
	int minCenterID = -1;

	for (int i = 0; i < centerCnt; i++) {
		if (leftCustomerByCenter[i] == 0) continue;
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
		int minGap = 21e8;
		int minDeliID = -1;
		int minPID = -1;

		//센터에 할당된 배송지들 중 가까운 곳 하나 선택
		//특정 센터가 담당할 배송지
		for (int i = 0; i < deliIDByCenter[centerID].size(); i++) {
			int deliID = deliIDByCenter[centerID][i];
			int pID = deliveryProductList[deliID];

			//이미 배송완료되었거나, 남아있는 수량이 없으면 후보에서 제외.
			if (isFinish[deliID] == 1) continue;

			if (minGap > now - deliveryCoordinatesList[deliID]) {
				minGap = now - deliveryCoordinatesList[deliID];
				minDeliID = deliID;
				minPID = pID;
			}
		}

		//센터에서 담당하고 있는 배송지 중, 가장 가까운 배송지 선택
		result.push_back(minDeliID);
		leftCustomerByCenter[centerID] -= 1;
		isFinish[minDeliID] = 1;

		//센터에 더이상 고객이 없다면 종료
		if (leftCustomerByCenter[centerID] == 0) break;

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

	//각 DeliveryID 별로 Center랑 계약맺기
	init();

	int leftDeliveryCnt = deliveryCnt;

	while (leftDeliveryCnt != 0) {
		if (leftDeliveryCnt % 100 == 0) {
			cout << "남은 Delivery 수 : " << leftDeliveryCnt << " ... \n";
		}

		//가까운 센터 찾기
		int cID = getCloseCenter();

		//플랜 세우기
		vector<int> plan = getRountingPlan(cID);
		if (plan.size() == 0) continue;

		//[deliID1, deliID2, deliID3]
		//[pID1, pID2, pID2]로만들기
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