---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11487
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:09.56
---
### 최적화 후 코드

### run 함수

- Step 1( ) : 최적화 전 코드
- Step 2( ) : 최적화 후 코드 (손님을 다른 택시로 배정시킨다.)

```cpp
#include <queue>
#include <iostream>
#include <cstring>
#include <algorithm>
#include <vector>
#define ABS(x) (((x) > 0) ? (x) : -(x))
using namespace std;
static const int DRIVER_CNT = 100;
static const int CUSTOMER_CNT = 10'000;
struct Coordinate
{
	int y, x;
};
struct Passenger
{
	Coordinate departure;
	Coordinate arrival;
};

Coordinate DriverPos[DRIVER_CNT];
Coordinate* mDriver;
Passenger* mPassenger;
int M; //택시기사
int K; //승객
int isFinished[CUSTOMER_CNT];
int workingTime[DRIVER_CNT];

int scoreBook[DRIVER_CNT];

class TaxiCompare {
public:
	bool operator()(const int v, const int t) {
		return workingTime[t] < workingTime[v];
	}
};

priority_queue<int, vector<int>, TaxiCompare> taxiTurn;
vector<int> history[DRIVER_CNT];
extern bool assign_driver(int driverID, int passengerSize, int passengerIDs[]);

//두 좌표간 이동시간을 알아낸다.
int getTime(Coordinate a, Coordinate b) {
	return ABS(a.x - b.x) + ABS(a.y - b.y);
}

//driver ID를 가진 택시로 부터 가장 가까운 손님을 찾아낸다.
int getClosePassenger(int dID) {
	Coordinate taxiCoord = DriverPos[dID];

	int minCustomerID = -1;
	int minCustomerTime = 21e8;
	for (int i = 0; i < K; i++) {
		if (isFinished[i] == 1) continue;
		int ret = getTime(taxiCoord, mPassenger[i].departure);
		//ret += getTime(mPassenger[i].departure, mPassenger[i].arrival);
		if (minCustomerTime > ret) {
			minCustomerTime = ret;
			minCustomerID = i;
		}
	}

	if (minCustomerID == -1) {
		cout << "ERROR: : 손님 못찾음~\n";
	}

	return minCustomerID;
}

//Working Time이 가장 짧은 택시를 찾는다.
//이 택시는 일을 해야한다.
int getDriverIDforWork() {
	int result = taxiTurn.top();
	taxiTurn.pop();
	return result;
}

//기본전략
//Loop{
// PQ(WorkingTime) - 가장 일을 안한 택시 하나 선택
// 그 택시에서 가장 가까운 손님 선택
//}
void step1() {
	//K명 다 태워야하니까 
	//한번반복할때마다 한명 승객태워서 가요.
	for (int i = 0; i < K; i++) {
		if (i % 1000 == 0) cout << i << " 로딩중 ... \n";

		//가장 일 안한 택시 ID - PQ 꺼내고
		int dID = getDriverIDforWork(); //driver ID

		//그 택시ID 가장가까운 손님
		int pID = getClosePassenger(dID); //passengerID

		workingTime[dID] += getTime(DriverPos[dID], mPassenger[pID].departure);
		workingTime[dID] += getTime(mPassenger[pID].departure, mPassenger[pID].arrival);

		//택시 태워 이동함.
		isFinished[pID] = 1;
		//이력 - 어떤택시가 어떤손님을 태웠다.
		history[dID].push_back(pID);

		//그 택시의 위치
		DriverPos[dID] = mPassenger[pID].arrival;

		//PQ하나 넣습니다.
		taxiTurn.push(dID);
	}
}

long long getScore(int dID, vector<int> schedule) {
	long long score = 0;
	Coordinate driverNow = mDriver[dID];
	for (int cutomerID : schedule) {
		score += getTime(driverNow, mPassenger[cutomerID].departure);
		score += getTime(mPassenger[cutomerID].departure, mPassenger[cutomerID].arrival);
		driverNow = mPassenger[cutomerID].arrival;
	}
	return score;
}

//history[dID]에 newPID가 추가되어 운행에 최적화된 vector를 리턴한다.
vector<int> reArrangeSchedule(int dID, int newPID) {
	vector<int> result = history[dID];
	result.push_back(newPID);

	Coordinate now = mDriver[dID];
	for (int a = 0; a < result.size(); a++) {
		int minGap = 21e8;
		int minPID = -1;
		int minIndex = -1;
		for (int b = a; b < result.size(); b++) {
			int pID = result[b];
			if (minGap > getTime(now, mPassenger[pID].departure)) {
				minGap = getTime(now, mPassenger[pID].departure);
				minPID = pID;
				minIndex = b;
			}
		}

		swap(result[a], result[minIndex]);
		now = mPassenger[minPID].arrival;
	}
	return result;
}

void makeSortScoreArray(long long driverScores[DRIVER_CNT], int driverNumber[DRIVER_CNT]) {
	for (int i = 0; i < M; i++) {
		driverScores[i] = getScore(i, history[i]);
		driverNumber[i] = i;
	}

	for (int a = 0; a < M; a++) {
		for (int b = a + 1; b < M; b++) {
			if (driverScores[a] > driverScores[b]) {
				swap(driverScores[a], driverScores[b]);
				swap(driverNumber[a], driverNumber[b]);
			}
		}
	}
}

void moveCustomer1() {

	long long driverScores[DRIVER_CNT] = { 0 };
	int driverNumber[DRIVER_CNT] = { 0 };

	while (1) {
		//모든 택시들 Score를 계산
		//Worst Taxi찾으려고
		makeSortScoreArray(driverScores, driverNumber);

		int worstDriverID = driverNumber[M - 1];
		long long worstDriverPoint = driverScores[M - 1];
		int lastPID = *history[worstDriverID].rbegin();

		bool flag = false;

		//모든 택시 한번씩 순회
		for (int x = 0; x < M - 1; x++) {
			int dID = driverNumber[x];

			vector<int> reSchedule = reArrangeSchedule(dID, lastPID);

			long long testScore = getScore(dID, reSchedule);

			if (testScore <= worstDriverPoint) {
				history[worstDriverID].pop_back();
				history[dID] = reSchedule;
				flag = true;
				break;
			}
		}

		if (flag == false) break;
	}
}

void moveCustomer2() {
	long long driverScores[DRIVER_CNT] = { 0 };
	int driverNumber[DRIVER_CNT] = { 0 };

	while (1) {
		makeSortScoreArray(driverScores, driverNumber);

		int worstDriverID = driverNumber[M - 1];
		long long worstDriverPoint = driverScores[M - 1];
		int lastPID = history[worstDriverID][0];

		bool flag = false;

		for (int x = 0; x < M - 1; x++) {
			int dID = driverNumber[x];
			vector<int> reSchedule = reArrangeSchedule(dID, lastPID);
			long long testScore = getScore(dID, reSchedule);
			if (testScore <= worstDriverPoint) {
				for (int i = 0; i < history[worstDriverID].size() - 1; i++) {
					history[worstDriverID][i] = history[worstDriverID][i + 1];
				}
				history[worstDriverID].pop_back();
				history[dID] = reSchedule;
				flag = true;
				break;
			}
		}

		if (flag == false) break;
	}
}

void moveCustomer3(int targetOrder) {
	long long driverScores[DRIVER_CNT] = { 0 };
	int driverNumber[DRIVER_CNT] = { 0 };

	while (1) {
		makeSortScoreArray(driverScores, driverNumber);

		int worstDriverID = driverNumber[M - 1];
		long long worstDriverPoint = driverScores[M - 1];

		if (targetOrder >= history[worstDriverID].size()) break;
		int targetPID = history[worstDriverID][targetOrder];

		bool flag = false;

		for (int x = 0; x < M - 1; x++) {
			int dID = driverNumber[x];
			vector<int> reSchedule = reArrangeSchedule(dID, targetPID);
			long long testScore = getScore(dID, reSchedule);
			if (testScore < worstDriverPoint) {
				for (int i = targetOrder; i < history[worstDriverID].size() - 1; i++) {
					history[worstDriverID][i] = history[worstDriverID][i + 1];
				}
				history[worstDriverID].pop_back();
				history[dID] = reSchedule;
				flag = true;
				break;
			}
		}

		if (flag == false) break;
	}
}
void step2() {
	moveCustomer1(); //Worst 마지막 손님 보내봤습니다.
	moveCustomer2(); //Worst 첫번쨰막 손님 보내봤습니다.

	//Worst 1, 2, 3, 4, 5, 6, 100번째손님 보내봤습니다.
	for (int i = 0; i < 100;i++) {
		moveCustomer3(i);
	}
}

void init() {
	for (int i = 0; i < M; i++) history[i].clear();
	memset(isFinished, 0, sizeof(isFinished));
	memset(scoreBook, 0, sizeof(scoreBook));
	taxiTurn = priority_queue<int, vector<int>, TaxiCompare>();
	for (int i = 0; i < M; i++) {
		taxiTurn.push(i);
	}
	for (int i = 0; i < M; i++) {
		DriverPos[i] = mDriver[i];
		workingTime[i] = 0;
	}
}

void run(int N, int M, Coordinate mDriver[], int K, Passenger mPassenger[])
{
	::M = M;
	::K = K;
	::mDriver = mDriver;
	::mPassenger = mPassenger;

	init();

	step1(); //구현

	step2(); //최적화

	//결과전송
	for (int i = 0; i < DRIVER_CNT; i++) {
		assign_driver(i, history[i].size(), history[i].data());
	}
	return;
}
```