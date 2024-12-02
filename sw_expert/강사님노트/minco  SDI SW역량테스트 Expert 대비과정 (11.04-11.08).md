---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11516
author: 
published: 
created: 2024-11-16
description: 
tags:
  - clippings
updated: 2024-11-16 00:24.19
---
```cpp
#include <iostream>
#include <unordered_map>
#include <queue>
#include <algorithm>
using namespace std;

static const int MAX_DEVICE = 256;
static const int MAX_POWER = 1000;

struct DetectedDevice
{
    int id;
    int power;
    int tx;
    int ty;
};

/////////////////////////////////////////////////////////////////////
//제공되는 코드

extern int scan_device(int mDeviceId, int mScanPower, DetectedDevice mDetected[]);
#define ABS(x) (((x) > 0) ? (x) : -(x))

int mDeviceID;
int mTotalDevice;

void scan(int mDeviceId, int mTotalDevice) {
    ::mDeviceID = mDeviceId;
    ::mTotalDevice = mTotalDevice;
}

////////////////////////////////////////////////////////////////////

int deviceIDBySeqNumber[MAX_DEVICE + 5];
int groups[MAX_DEVICE + 5];
int sn;
unordered_map<int, int> snTable;

int getSeqNumber(int deviceID) {
    if (snTable[deviceID] == 0) {
        snTable[deviceID] = ++sn;
        deviceIDBySeqNumber[sn] = deviceID;
    }
    return snTable[deviceID];
}

int getDeviceID(int seqNumber) {
    if (deviceIDBySeqNumber[seqNumber] == 0) {
        printf("ERROR ID 값\n");
    }
    return deviceIDBySeqNumber[seqNumber];
}

int findBoss(int tar) {
    if (groups[tar] == -1) return tar;
    int ret = findBoss(groups[tar]);
    groups[tar] = ret;
    return ret;
}

void setUnion(int a, int b) {
    int t1 = findBoss(a);
    int t2 = findBoss(b);
    if (t1 == t2) return;

    if (getDeviceID(t1) < getDeviceID(t2)) groups[t2] = t1;
    else groups[t1] = t2;
}

void init() {
    for (int i = 0; i < MAX_DEVICE + 5; i++) {
        groups[i] = -1;
    }

    for (int i = 0; i < MAX_DEVICE + 5; i++) {
        deviceIDBySeqNumber[i] = 0;
    }

    sn = 0;
    snTable.clear();
}

//같은방 : 1
//같은방인지 모름 : 0
int isSameRoom(int sendPower, DetectedDevice target) {
    int result = sendPower - abs(target.ty) - abs(target.tx);
    int gap = abs(result - target.power);
    if (gap == 0) return 1;
    return 0;
}

int compare(int t, int v) {
    return getDeviceID(t) < getDeviceID(v);
}

//결과 생성 방법
//1. 그룹 보스들만 리스트를 만들어 정렬한다.
//2. 각 그룹보스 별 구성원들 리스트 만들어 정렬한다.
void makeResult(int mDeviceIds[][MAX_DEVICE]) {
    //보스와 맴버 명단
    vector<int> bossList;
    vector<int> memberList[MAX_DEVICE];

    for (int i = 1; i <= mTotalDevice; i++) {
        if (groups[i] != -1) continue;
        bossList.push_back(i);

        for (int x = 1; x <= mTotalDevice; x++) {
            if (groups[x] == -1) continue;
            if (findBoss(x) == i) {
                memberList[i].push_back(x);
            }
        }

        sort(memberList[i].begin(), memberList[i].end(), compare);
    }
    sort(bossList.begin(), bossList.end(), compare);

    for (int i = 0; i < bossList.size(); i++) {
        int boss = bossList[i];

        mDeviceIds[i][0] = getDeviceID(boss);
        //printf("%10d", getDeviceID(boss));

        for (int x = 0; x < memberList[boss].size(); x++) {
            mDeviceIds[i][x + 1] = getDeviceID(memberList[boss][x]);
            //printf(" - %10d", getDeviceID(memberList[boss][x]));
        }
        //cout << "\n";
    }

    int a = 10;
}

//휴리스틱 접근
//과정
//1. Queue에서 Device 하나를 꺼낸다. (BFS) 
//2. Scan 결과를 모두 Queue에 등록한다. (이미 Scan한 Device는 제외한다.)
//3. 같은 방인 사람은 모두 Union 한다.

void result(int mDeviceIds[][MAX_DEVICE]) {
    //Scan API 실험
    //scanTest(mDeviceID, MAX_POWER);
    //scanTest(28596616, MAX_POWER);

    init();

    int sendPower = 1000;

    queue<int> q;
    int isScan[MAX_DEVICE] = { 0 };
    DetectedDevice detected[MAX_DEVICE] = { 0 };

    int snID = getSeqNumber(mDeviceID);
    q.push(snID);

    while (!q.empty()) {
        int now = q.front();
        q.pop();
        if (isScan[now]) continue;
        isScan[now] = 1;

        memset(detected, 0, sizeof(detected));
        scan_device(getDeviceID(now), sendPower, detected);

        for (int i = 0; i < mTotalDevice; i++) {
            if (detected[i].id == 0) break;
            int tarID = detected[i].id;
            int power = detected[i].power;
            int ty = detected[i].ty;
            int tx = detected[i].tx;

            int tarNum = getSeqNumber(tarID);

            if (isSameRoom(sendPower, detected[i])) {
                setUnion(now, tarNum);
            }

            if (isScan[tarNum] == 0) {
                q.push(tarNum);
            }
        }
    }

    makeResult(mDeviceIds);
}
```