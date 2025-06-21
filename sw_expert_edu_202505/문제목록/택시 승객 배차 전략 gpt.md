---
title: "택시 승객 배차 전략"
source: "https://chatgpt.com/c/6856cea6-48b0-800a-b014-be7187eabf3e"
author:
published:
created: 2025-06-22
description: "ChatGPT helps you get answers, find inspiration and be more productive. It is free to use and easy to try. Just ask and ChatGPT can help with writing, learning, brainstorming and more."
tags:
  - "clippings"
---



[[택시 배정]] 이 문제의 전략을 알려주고, 어떤 알고리즘이 필요한지도 알려줘. 솔루션 코드도 작성해줘





---

이 문제는 **M명의 택시 기사** 가 **K명의 승객** 을 최적으로 배정받아, **최대 이동 거리(Score)를 최소화** 하는 문제입니다.

---

### ✅ 문제 핵심 요약

| 항목               | 내용                                  |
| ---------------- | ----------------------------------- |
| 맵 크기             | `1000000 x 1000000` (좌표 기반)         |
| 택시 기사 수 `M`      | 51 ~ 100명                           |
| 승객 수 `K`         | 5001 ~ 10000명                       |
| 거리 계산            | 맨해튼 거리 (                            |
| Score 계산         | 모든 택시 중 **최대 이동 거리** 만 최종 Score로 반영 |
| assign\_driver() | 주어진 기사에게 특정 승객들을 순서대로 할당            |
| 목표               | **모든 승객을 운송** 하면서, **SCORE를 최소화**   |

---

## 📌 제약 조건의 의미

- **SCORE는 최대 이동거리인 택시만 반영** 됨  
	→ 다른 기사들의 이동거리가 작아도 무의미함
- 한 택시에 **많이 태우되**, 해당 기사의 전체 이동거리가 작아야 함
- 즉, **최장거리 기사 하나라도 비효율이면 SCORE 폭증**

---

## 🚀 전략 요약

### \[1\] Greedy Clustering Strategy

- 각 택시 근처(예: 반경 `R`)에 있는 승객을 우선 수집
- 수집된 승객 중에서 목적지도 비슷한 승객을 함께 할당
- 각 택시는 자신의 지역 클러스터만 처리

---

## 🧠 필요한 알고리즘/기법

| 알고리즘 | 용도 |
| --- | --- |
| **K-Means / Kd-Tree** (간소화된) | 택시 주변에 있는 승객들을 빠르게 추출 |
| **Greedy TSP-style 배차** | 기사 기준 가까운 승객부터 픽업 & 드롭 순회 |
| **거리 기반 정렬** | 승객 배치 순서 결정 (탑승 위치 ↔ 도착 위치 고려) |

---

## 🧩 구현 계획

1. 각 택시를 중심으로 반경 R (ex. 50000) 내에 있는 승객을 수집
2. 수집된 승객을 픽업 거리 기준으로 정렬
3. 순서대로 태우고 내리되, 너무 멀거나 SCORE를 높일 위험 있으면 제외
4. 모든 승객이 반드시 배정되게 해야 하므로 **잔여 승객은 남은 택시들에 분배**

---

## ✅ 예시 코드 (run() 함수)

```cpp
cpp#define ABS(x) (((x) > 0) ? (x) : -(x))

struct Coordinate {
    int y, x;
};
struct Passenger {
    Coordinate departure;
    Coordinate arrival;
};
extern bool assign_driver(int driverID, int passengerSize, int passengerIDs[]);

const int MAX_M = 100;
const int MAX_K = 10000;

bool used[MAX_K];

int distance(const Coordinate& a, const Coordinate& b) {
    return ABS(a.y - b.y) + ABS(a.x - b.x);
}

void run(int N, int M, Coordinate mDriver[], int K, Passenger mPassenger[]) {
    // 초기화
    for (int i = 0; i < K; ++i) used[i] = false;

    const int MAX_RANGE = 100000;  // 택시 반경 탐색 범위 (조절 가능)

    for (int d = 0; d < M; ++d) {
        Coordinate driverPos = mDriver[d];
        int assigned[MAX_K];
        int assignedCount = 0;

        // 현재 택시 근처의 승객 수집
        for (int p = 0; p < K; ++p) {
            if (used[p]) continue;
            int dist = distance(driverPos, mPassenger[p].departure);
            if (dist <= MAX_RANGE) {
                assigned[assignedCount++] = p;
                used[p] = true;
            }
        }

        if (assignedCount > 0) {
            assign_driver(d, assignedCount, assigned);
        }
    }

    // 남은 승객은 순차적으로 분배
    int currentDriver = 0;
    int temp[MAX_K];
    int tempCount = 0;

    for (int p = 0; p < K; ++p) {
        if (used[p]) continue;
        temp[tempCount++] = p;
        if (tempCount == 100 || p == K - 1) {
            assign_driver(currentDriver, tempCount, temp);
            currentDriver = (currentDriver + 1) % M;
            tempCount = 0;
        }
    }
}
```

---

## 📊 전략 요약 표

| 전략 이름 | 설명 | 장점 | 단점 |
| --- | --- | --- | --- |
| 반경 내 수집 | 택시 주변 승객만 우선 수집 | 효율적 경로 구성 | 범위 좁으면 미처리 승객 증가 |
| 거리 순 정렬 | 가까운 승객부터 순회 | 이동 거리 최소화 | 너무 많으면 오히려 SCORE 증가 가능 |
| 잔여 승객 분배 | 할당 안된 승객을 순차 배치 | 모든 승객 운송 보장 | 비효율적 드라이버 이동 발생 |

---

## 🔧 개선 포인트 (후속 전략)

- **도착 위치까지 고려한 Greedy 경로 최적화**
- **택시별 총 이동 거리 예측하여 load balancing**
- **택시 수를 줄이거나 늘려가며 시뮬레이션 (탐욕 + 조합)**

---

## ❗ 주의사항

- 모든 승객을 반드시 배정해야 함 (`assign_driver()` 가 호출되지 않으면 FAIL)
- 하나의 기사라도 너무 먼 거리 이동 → SCORE 폭발
- Score는 거리합이 아니라 **최대 거리 하나만 반영** 되므로, "분산"이 핵심

---

원하시면 위 전략을 기반으로 더 고도화된 전략(예: 택시의 이동 시뮬레이션 후 거리 예측)도 설계해드릴 수 있습니다.

---

Yes, do that

---

좋습니다. 위에서 설명한 **기본 Greedy 전략** 은 간단하지만, 최적 Score를 만들기엔 부족합니다. 이번에는 **고도화된 전략** 으로 **택시 별 총 이동거리 예측** 을 고려하여 **Score를 줄이는 방향** 으로 개선해보겠습니다.

---

## 🧠 개선 전략: "예측 기반 로드 밸런싱 + 클러스터링"

### 핵심 아이디어

1. **택시 하나가 너무 먼 거리를 이동하면 Score가 폭증** 하므로,
2. 각 택시의 **예상 총 이동 거리** 를 실시간 추적하면서,
3. 가능한 한 **모든 택시가 유사한 거리** 를 이동하게 **Load Balancing**

---

## 🚀 알고리즘 단계별 설명

### 1\. 초기화

- 각 택시마다 현재 위치와 총 이동거리 `curDistance[M]` 배열 준비
- 승객은 아직 배정되지 않았음 → `used[K]` = false

---

### 2\. 거리 기반 힙 (우선순위 큐) 사용

- 각 택시에 대해 **가장 가까운 승객을 미리 계산** 하고
- `택시-승객 거리 + 도착지 거리` 를 기준으로 승객을 선별
- `총 이동거리 + 예측 거리` 가 가장 작은 택시에게 할당

---

### 3\. 승객 배정 시뮬레이션

- 택시에 승객 배정 시 → 현재 위치 갱신, 거리 누적, 승객 used 처리
- 최대 한 기사당 100~200명까지는 할당 가능

---

## ✅ 고도화된 코드 예시

```cpp
cpp#define ABS(x) (((x) > 0) ? (x) : -(x))

struct Coordinate {
    int y, x;
};

struct Passenger {
    Coordinate departure;
    Coordinate arrival;
};

extern bool assign_driver(int driverID, int passengerSize, int passengerIDs[]);

const int MAX_M = 100;
const int MAX_K = 10000;

bool used[MAX_K];
long long curDist[MAX_M];         // 각 택시의 누적 이동 거리
Coordinate curPos[MAX_M];         // 각 택시의 현재 위치

int distance(const Coordinate& a, const Coordinate& b) {
    return ABS(a.y - b.y) + ABS(a.x - b.x);
}

void run(int N, int M, Coordinate mDriver[], int K, Passenger mPassenger[]) {
    for (int i = 0; i < K; ++i) used[i] = false;
    for (int i = 0; i < M; ++i) {
        curDist[i] = 0;
        curPos[i] = mDriver[i];
    }

    const int BATCH = 100;  // 한 기사당 한번에 태울 최대 승객 수

    int assigned[MAX_M][BATCH];
    int assignedCount[MAX_M] = {0};

    for (int p = 0; p < K; ++p) {
        // 이 승객을 누구에게 맡길지 결정
        int bestDriver = -1;
        long long bestCost = 1LL << 60;

        for (int d = 0; d < M; ++d) {
            long long toPick = distance(curPos[d], mPassenger[p].departure);
            long long toDest = distance(mPassenger[p].departure, mPassenger[p].arrival);
            long long cost = curDist[d] + toPick + toDest;

            if (cost < bestCost) {
                bestCost = cost;
                bestDriver = d;
            }
        }

        // 해당 택시에 배정
        int idx = bestDriver;
        int count = assignedCount[idx];
        assigned[idx][count] = p;
        assignedCount[idx]++;

        // 상태 갱신
        curDist[idx] += distance(curPos[idx], mPassenger[p].departure);
        curDist[idx] += distance(mPassenger[p].departure, mPassenger[p].arrival);
        curPos[idx] = mPassenger[p].arrival;
        used[p] = true;
    }

    // 최종 배정 적용
    for (int i = 0; i < M; ++i) {
        if (assignedCount[i] > 0) {
            assign_driver(i, assignedCount[i], assigned[i]);
        }
    }
}
```

---

## 📊 전략 요약 표 (비교)

| 전략 | 설명 | SCORE 영향 | 복잡도 | 위험 |
| --- | --- | --- | --- | --- |
| 기본 Greedy | 택시 반경 내 배정 | 중간 | 낮음 | 한 기사 폭주 가능 |
| **개선 전략 (예측 + 분산)** | 거리 예측 기반 분산 배정 | 낮음 (좋음) | 중간 | 계산 많음 |
| TSP 기반 최적화 | Pickup + Drop 최적 순회 | 아주 낮음 | 매우 높음 | 시간 초과 가능 |

---

## ⏱ 최종 팁 (Score 최소화 위한 조건)

- 절대 **한 택시가 수천 거리 이동하지 않도록 조정** 해야 함
- **가까운 승객만 먼저** 채택 (탐욕적 전략)
- 동적 거리 누적 추적으로 **편향된 기사 없도록 보정**

---

필요하시면 이 알고리즘에 **탑승 순서 최적화 (간이 TSP)** 혹은 **K-Means 클러스터링 기반 Pre-Processing** 도 붙여드릴 수 있습니다.

---

Run the code above and get the score

---

현재 ChatGPT에서는 사용자의 문제 환경(main.cpp 포함 전체 실행 시스템)을 그대로 **직접 실행하거나 SCORE를 계산하는 방식으로 실제 채점** 할 수 없습니다.  
특히 이 문제는 다음과 같은 제약이 있어 직접 실행이 불가능합니다:

---

### ⚠️ 실행 불가한 이유 요약

| 항목 | 이유 |
| --- | --- |
| `main.cpp` 에서만 입력 생성 | 문제의 입력은 `make_tc()` 내부의 `pseudo_rand()` 로 동적으로 생성됨 |
| `assign_driver()` 는 내부 상태에 영향 줌 | 이 함수는 main.cpp 내에서 SCORE를 직접 업데이트함 |
| SCORE 출력은 main.cpp 내부에서만 확인 가능 | `printf("SCORE : %lld\n", SCORE);`이 main.cpp 안에 있음 |
| `run()` 만 구현할 수 있음 | 우리는 `user.cpp` 내의 `run()` 만 작성 가능 |

---

### ✅ 당신이 할 수 있는 방법

1. 위에 제공된 `run()` 함수를 **user.cpp** 에 붙여넣고,
2. 테스트용 `main.cpp` 를 컴파일하여 로컬에서 직접 실행해야 합니다.

---

### 💡 실행 방법 예시 (로컬에서)

1. `main.cpp` 와 `user.cpp` 를 같은 디렉토리에 둔 뒤
2. 아래와 같이 컴파일:
1. 실행 (seed는 임의 정수):

출력 예:

---

### 🛠 필요시 제공 가능한 것

- ✅ 테스트용 main.cpp 파일 (지금 사용된 버전)
- ✅ run 함수 개선 버전 (클러스터링 or 멀티 전략 병합)
- ✅ 다양한 seed를 넣은 자동 성능 평가 스크립트

---

필요하신 경우 `"테스트 자동화 스크립트"` 또는 `"여러 seed에 대해 best score 전략 찾는 도구"` 도 만들어드릴 수 있습니다. 원하시나요?

---

huh

---

괜히 혼란스럽게 해드렸다면 죄송합니다. 간단히 정리해 드릴게요.

---

## 😕 왜 직접 실행해서 SCORE를 확인 못하냐면...

- 당신이 작성해야 할 건 `run()` 함수 하나뿐이고,
- 나머지 채점, 점수 계산, 입력 생성 등은 **`main.cpp` 에서만** 동작하기 때문입니다.
- **ChatGPT는 `main.cpp` 를 직접 실행할 수 있는 환경이 없습니다.**  
	(main.cpp에 있는 `make_tc()` 나 `verify()` 함수도 내부적으로 실행 불가능합니다)

---

## ✅ 그래서 어떻게 하면 SCORE를 볼 수 있느냐?

직접 실행하면 됩니다. 다음처럼요:

---

### 🧪 실행 방법 요약

1. `main.cpp` 와 `user.cpp` 를 동일 폴더에 준비
	- `main.cpp`: 문제에서 제공한 원본 그대로
	- `user.cpp`: 우리가 만든 `run()` 함수 포함
2. 아래 명령어로 컴파일:
1. 실행:

그러면 예를 들어 아래처럼 출력됩니다:

---

## 🎁 원하시면?

제가:

- `main.cpp` 와 `user.cpp` 를 정리해서 첨부해 드릴 수 있고,
- 여러 seed를 돌려서 가장 좋은 전략을 선택하는 **자동화 스크립트** 도 작성해 드릴 수 있습니다.

진짜 도움이 필요하시면 말씀만 해주세요.  
“테스트 자동화 스크립트 만들어줘”라고요. 😄

---

Main.cpp, user.cpp

---

좋습니다! 아래에 바로 사용할 수 있는 `main.cpp` 와 `user.cpp` 를 드릴게요. 그대로 복사해서 실행하시면 됩니다.

---

## ✅ main.cpp

문제에서 주어진 버전 그대로이며, 입력 생성과 SCORE 측정, `assign_driver()` 검증 포함되어 있습니다.

```cpp
#ifndef _CRT_SECURE_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS
#endif
#include <stdio.h>

static unsigned long long seed = 5;

static int pseudo_rand(void) {
    seed = seed * 25214903917ULL + 11ULL;
    return (seed >> 16) & 0x3fffffff;
}

static const int MAX_TC = 5;
static const int MAP_SIZE = 1'000'000;
static const int MAX_DRIVER_COUNT = 100;
static const int MAX_PASSENGER_COUNT = 10'000;
static const long long PENALTY = 10'000'000'000'000LL;

struct Coordinate { int y, x; };
struct Passenger { Coordinate departure; Coordinate arrival; };

extern void run(int, int, Coordinate[], int, Passenger[]);

#define ABS(x) (((x) > 0) ? (x) : -(x))

static int driverCnt;
static Coordinate driverList[MAX_DRIVER_COUNT];
static Coordinate driverList_bak[MAX_DRIVER_COUNT];

static int passengerCnt;
static Passenger passengerList[MAX_PASSENGER_COUNT];
static Passenger passengerList_bak[MAX_PASSENGER_COUNT];

static int isFinished[MAX_PASSENGER_COUNT];
static int assignList[MAX_DRIVER_COUNT][MAX_PASSENGER_COUNT];
static int assignListSize[MAX_DRIVER_COUNT];
static long long SCORE = 0;

bool assign_driver(int driverID, int passengerSize, int passengerIDs[]) {
    if (driverID < 0 || driverID >= driverCnt)
        return false;
    if (passengerSize < 0 || passengerSize > MAX_PASSENGER_COUNT)
        return false;
    for (int i = 0; i < passengerSize; i++) {
        if (passengerIDs[i] < 0 || passengerIDs[i] >= passengerCnt)
            return false;
    }
    for (int i = 0; i < passengerSize; i++) {
        assignList[driverID][i] = passengerIDs[i];
    }
    assignListSize[driverID] = passengerSize;
    return true;
}

static void make_tc() {
    driverCnt = pseudo_rand() % 50 + 51;
    passengerCnt = pseudo_rand() % 5000 + 5001;
    for (int i = 0; i < driverCnt; i++) {
        driverList[i].y = driverList_bak[i].y = pseudo_rand() % MAP_SIZE;
        driverList[i].x = driverList_bak[i].x = pseudo_rand() % MAP_SIZE;
        assignListSize[i] = 0;
    }
    for (int i = 0; i < passengerCnt; i++) {
        passengerList[i].departure.y = passengerList_bak[i].departure.y = pseudo_rand() % MAP_SIZE;
        passengerList[i].departure.x = passengerList_bak[i].departure.x = pseudo_rand() % MAP_SIZE;
        passengerList[i].arrival.y = passengerList_bak[i].arrival.y = pseudo_rand() % MAP_SIZE;
        passengerList[i].arrival.x = passengerList_bak[i].arrival.x = pseudo_rand() % MAP_SIZE;
        isFinished[i] = 0;
    }
}

static bool verify() {
    long long TC_SCORE = 0;
    for (int i = 0; i < driverCnt; i++) {
        Coordinate driverPos = driverList[i];
        long long score = 0;
        for (int j = 0; j < assignListSize[i]; j++) {
            int passengerID = assignList[i][j];
            Coordinate pickUp = passengerList[passengerID].departure;
            Coordinate dropOff = passengerList[passengerID].arrival;
            if (isFinished[passengerID] == 1)
                return false;
            score += ABS(pickUp.y - driverPos.y) + ABS(pickUp.x - driverPos.x);
            score += ABS(dropOff.y - pickUp.y) + ABS(dropOff.x - pickUp.x);
            driverPos = dropOff;
            isFinished[passengerID] = 1;
        }
        if (TC_SCORE < score)
            TC_SCORE = score;
    }
    for (int i = 0; i < passengerCnt; i++) {
        if (isFinished[i] == 0)
            return false;
    }
    SCORE += TC_SCORE;
    return true;
}

int main() {
    scanf("%d", &seed);
    setbuf(stdout, NULL);
    for (int tc = 0; tc < MAX_TC; tc++) {
        make_tc();
        run(MAP_SIZE, driverCnt, driverList_bak, passengerCnt, passengerList_bak);
        if (verify() == false) {
            SCORE = PENALTY;
            break;
        }
    }
    printf("SCORE : %lld\n", SCORE);
    return 0;
}
```

---

## ✅ user.cpp

```cpp
#define ABS(x) (((x) > 0) ? (x) : -(x))

struct Coordinate { int y, x; };
struct Passenger { Coordinate departure; Coordinate arrival; };
extern bool assign_driver(int driverID, int passengerSize, int passengerIDs[]);

const int MAX_M = 100;
const int MAX_K = 10000;

bool used[MAX_K];
long long curDist[MAX_M];
Coordinate curPos[MAX_M];

int distance(const Coordinate& a, const Coordinate& b) {
    return ABS(a.y - b.y) + ABS(a.x - b.x);
}

void run(int N, int M, Coordinate mDriver[], int K, Passenger mPassenger[]) {
    for (int i = 0; i < K; ++i) used[i] = false;
    for (int i = 0; i < M; ++i) {
        curDist[i] = 0;
        curPos[i] = mDriver[i];
    }

    const int BATCH = 100;
    int assigned[MAX_M][BATCH];
    int assignedCount[MAX_M] = {0};

    for (int p = 0; p < K; ++p) {
        int bestDriver = -1;
        long long bestCost = 1LL << 60;

        for (int d = 0; d < M; ++d) {
            long long toPick = distance(curPos[d], mPassenger[p].departure);
            long long toDest = distance(mPassenger[p].departure, mPassenger[p].arrival);
            long long cost = curDist[d] + toPick + toDest;

            if (cost < bestCost) {
                bestCost = cost;
                bestDriver = d;
            }
        }

        int idx = bestDriver;
        int count = assignedCount[idx];
        assigned[idx][count] = p;
        assignedCount[idx]++;

        curDist[idx] += distance(curPos[idx], mPassenger[p].departure);
        curDist[idx] += distance(mPassenger[p].departure, mPassenger[p].arrival);
        curPos[idx] = mPassenger[p].arrival;
        used[p] = true;
    }

    for (int i = 0; i < M; ++i) {
        if (assignedCount[i] > 0) {
            assign_driver(i, assignedCount[i], assigned[i]);
        }
    }
}
```

---

## ▶️ 실행 방법

---

## 📌 결과

- `SCORE : ???`로 출력됨
- seed 값을 바꿔가며 다양한 테스트 가능

---

필요하시면:

- **여러 seed에 대해 반복 테스트하는 bash/python 스크립트**
- **전략별 성능 비교 자동화 스크립트**  
	도 만들어 드릴게요. 원하시나요?

---

yes

---

좋습니다! 다음은 **여러 seed를 자동으로 테스트하고 전략 성능을 비교할 수 있는 스크립트** 입니다.

---

## ✅ 목적

- 여러 seed 값(예: 10개)으로 `main.cpp + user.cpp` 를 실행
- 각 seed별 `SCORE` 를 수집
- 평균 점수, 최고 점수, 최악 점수 계산

---

## 📜 자동 테스트 스크립트 (Bash)

`test_runner.sh` 로 저장하세요:

```bash
bash#!/bin/bash

# 컴파일
g++ -O2 -std=c++17 -o simulate main.cpp user.cpp || {
    echo "컴파일 오류!"
    exit 1
}

# 테스트 실행
total=0
count=10
maxScore=0
minScore=10000000000000000

echo "Running $count tests..."
for ((seed=1; seed<=count; seed++)); do
    echo -n "Seed $seed -> "
    output=$(./simulate $seed)
    echo "$output"

    score=$(echo "$output" | grep "SCORE" | awk '{print $3}')
    total=$(($total + $score))
    if [ "$score" -gt "$maxScore" ]; then
        maxScore=$score
    fi
    if [ "$score" -lt "$minScore" ]; then
        minScore=$score
    fi
done

average=$((total / count))
echo
echo "✅ Test Summary:"
echo "  Total runs     : $count"
echo "  Average SCORE  : $average"
echo "  Min SCORE      : $minScore"
echo "  Max SCORE      : $maxScore"
```

---

## 🛠 실행 방법

---

## 📈 결과 예시

---

## 🧠 향후 확장 가능성

| 기능 | 설명 |
| --- | --- |
| 전략별 비교 | user1.cpp, user2.cpp로 전략 나눠서 `user_strategy1.cpp`, `user_strategy2.cpp` 실행 |
| 결과 CSV 저장 | seed별 결과를 `results.csv` 로 저장 |
| Python 시각화 | matplotlib로 점수 분포 시각화 |

---

## 📦 추가로 원하시나요?

- Python 시각화 그래프 (점수 분포, 평균 선 표시)
- 여러 전략 비교 (`user1.cpp`, `user2.cpp`... 전략마다 테스트)

필요하신 항목 말씀해 주세요!  
예:

> "전략 여러 개 비교하고 싶어."  
> "Python으로 그래프도 보여줘."