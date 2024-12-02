---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11517
author: 
published: 
created: 2024-11-16
description: 
tags:
  - clippings
updated: 2024-11-16 00:26.08
---
```cpp
/// user.cpp ///
constexpr int MD = 256;
constexpr int MR = 52;

struct DetectedDevice
{
    int id;
    int power;
    int tx;
    int ty;
};

extern int scan_device(int mDeviceId, int mScanPower, DetectedDevice mDetected[]);
#define ABS(x) (((x) > 0) ? (x) : -(x))

int Ids[MD + 1];
int SortedIds[MD + 1];
int IdxCnt;
int Parent[MD + 1];

// id to index : 마치 hash
// 처음부터 완벽하게(최적화) 작성 X
// 일단 기능적으로 완성해놓고 최적화
// hash를 하냐 지금처럼 하나하나 확인? => 시간적 차이(gTotalCost에는 영향 X)
// 어쨌든 프로그램이 최대 시간안에만 돌아가면 되는거지, 최소한의 시간으로 돌아가야 한다 X

int getIdx(int id) {
    for (int i = 1; i <= IdxCnt; i++)
        if (Ids[i] == id)
            return i;
    IdxCnt++;
    Ids[IdxCnt] = id;
    Parent[IdxCnt] = IdxCnt;
    return IdxCnt;
}

bool isGroup(DetectedDevice src, DetectedDevice dest) {
    // src.power  : 초기 power
    // dest.power : 이동 후 남은 power
    if (dest.power == 1) return false;
    // src.power - dest.power : 이동하는데 필요했던 power
    // 이동하는데 필요했던 power == abs(dest.tx) + abs(dest.ty)  => 같은 방이다!
    // dest.ty, dest.tx : src로부터의 상대좌표
    return src.power - dest.power == ABS(src.tx - dest.tx) + ABS(src.ty - dest.ty);
}

int Find(int x) {
    if (x == Parent[x]) return x;
    return Parent[x] = Find(Parent[x]);
}

void Union(int x, int y) {
    int px = Find(x), py = Find(y);
    if (Ids[px] < Ids[py]) { int temp = px; px = py; py = temp; }
    Parent[px] = py; // 항상 Group의 root에 해당하는 device id는 해당 Group의 제일 작은 id값을 갖는 device <- result에서 정리할 때, 가장 먼저 배치
}

void scan(int mDeviceId, int mTotalDevice)
{
    // 모든 장치을 찾기
    // => scan하면서 같은 방인 device가 검색 되는지 확인!(Union)
    //    --> 작은 그룹 만들기

    /*
    scanpower를 적절한 크기로 사용!!!!
     -> 적절한???? 음???? 그럼 적절하다는 기준이 무엇이냐?
     -> 모든 장치를 찾게 되는 적절한 크기의 scanpower
        => 작은 크기의 scanpower부터 점차 키워가며
    */
    
    //200> 400> 800> 1000 하면서
    //모든 Device 다 구룹핑 시도

    //버그 안되는 케이스

    //대표 그룹 200  한 방에있는 모두가 그룹핑

    int scanPower = 200;
    IdxCnt = 0;
    int idx = getIdx(mDeviceId);
    DetectedDevice detected[MD];
    for (; IdxCnt < mTotalDevice; scanPower *= 2) { // <-  scanpower부터 점차 키워가며 => 2배씩 증가(magic number)
        if (scanPower > 1000) scanPower = 1000;
        // device 검색! (scan_device)
        // 내가 찾았던 모든 device를 중심으로 scan_device
        for (int index = 1; index <= IdxCnt && IdxCnt < mTotalDevice; index++) {
            DetectedDevice srcDevice = { Ids[index], scanPower, 0, 0 }; // 검색의 중심이 되는 device를 세팅
            int scannedDeviceCnt = scan_device(Ids[index], scanPower, detected);
            for (int i = 0; i < scannedDeviceCnt; i++) {
                int scannedDeviceIdx = getIdx(detected[i].id); // getIdx : 새로운 id면 등록, 기존 id면 기존의 등록된 index반환
                if (isGroup(srcDevice, detected[i])) {
                    Union(index, scannedDeviceIdx);
                }
            }
        }
    }

    // 모든 device를 전부 적절한 scanPower를 통해서 찾았다!!!!!

    //추가 그룹핑 200 으로 
    // 작은 그룹들을 실제 같은 방끼리 그룹핑(방끼린 전부 연결)
    for (int index = 1; index <= IdxCnt; index++) {
        if (Parent[index] != index) continue; // 그룹의 대표만!

        DetectedDevice srcDevice = { Ids[index], 200, 0, 0 };
        int scannedDeviceCnt = scan_device(Ids[index], 200, detected);
        // scanpower로 200? => 같은 방이라면 아무리 많이 필요해도 200의 파워면 충분
        for (int i = 0; i < scannedDeviceCnt; i++) { // 같은 방일 가능성이 있는 모든 device
            int scannedDeviceIdx = getIdx(detected[i].id);
            if (isGroup(srcDevice, detected[i])) {
                Union(index, scannedDeviceIdx);
            }
        }
    }

    //점수를 내면 결과

    return;
}

int buffer[MD + 1];
void mergeSort(int st, int en) {
    if (st == en) return;
    int mid = (st + en) / 2;
    mergeSort(st, mid);
    mergeSort(mid + 1, en);
    int l = st;
    int r = mid + 1;
    int index = 0;
    while (l <= mid && r <= en) {
        if (SortedIds[l] < SortedIds[r]) { buffer[index] = SortedIds[l]; l++; }
        else { buffer[index] = SortedIds[r]; r++; }
        index++;
    }
    while (l <= mid) { buffer[index] = SortedIds[l]; l++; index++; }
    while (r <= en) { buffer[index] = SortedIds[r]; r++; index++; }
    for (int i = 0; i < index; i++)
        SortedIds[st + i] = buffer[i];
}

void result(int mDeviceIds[][MD])
{
    // 모든 device를 id순서대로 정렬!
    for (int i = 1; i <= IdxCnt; i++)
        SortedIds[i] = Ids[i];
    mergeSort(1, IdxCnt); // <- 삽입정렬도 정답 나옴(시간이 중요 X)

    // id가 작은 그룹부터 하나씩 순서대로 배치
    int roomIds[MD + 1][2] = { 0, };
    // [deviceIdx][0] = 해당 deviceIdx인 device가 어느 room에 배치됐는가?
    // [deviceIdx][1] = 해당 deviceIdx가 root인 room은 몇개의 device가 저장됐는가?

    int roomIndex = 0;
    for (int i = 1; i <= IdxCnt; i++) {
        int idx = getIdx(SortedIds[i]);
        buffer[idx] = i;
        if (Parent[idx] != idx) continue; // 각 그룹의 root
        mDeviceIds[roomIndex][0] = SortedIds[i];
        roomIds[idx][0] = roomIndex;
        roomIds[idx][1]++;
        roomIndex++;
    }

    // root가 아닌 모든 device를 순서대로 배치
    for (int i = 1; i <= IdxCnt; i++) {
        int idx = getIdx(SortedIds[i]);
        if (Parent[idx] == idx) continue; // root가 아니라고 검증
        int p = Find(idx); // 해당 그룹의 root 찾기
        int roomId = roomIds[p][0];
        mDeviceIds[roomId][roomIds[p][1]] = SortedIds[i];
        roomIds[p][1]++;
    }
    return;
}
```