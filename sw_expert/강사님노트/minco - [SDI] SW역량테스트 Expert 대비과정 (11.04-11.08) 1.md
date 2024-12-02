---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11512
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 00:58.29
---
```cpp
#include <iostream>
#include <cstring>
#include <queue>
#include <Windows.h>
#include <string>
using namespace std;

/////////////////////////////////////////////
//디버깅용
const bool isDraw = false; //화면 그리기
const int drawSpeed = 1; //화면 그리기 delay (낮을수록 빠름)
const int startTickCount = 0; //출력 시작할 Tick
////////////////////////////////////////////

void scanning();
extern int move(void);
extern void turn(int mCommand);

char vMap[130][130];
int used[130][130] = { 0 };

static int robotY;
static int robotX;
static int robotDir;

int dirY[4] = { -1, 0, 1, 0 };
int dirX[4] = { 0, -1, 0, 1 };

int scanCnt;
int moveCnt;
int turnCnt;
int tickCnt;

int screenBuf[100][100] = { 0 };

struct Coordinate {
    int y, x;
};

struct Node {
    int y, x;
    int dir;
    int parent;
};

Node q[500000];

enum {
    UP, LEFT, DOWN, RIGHT
};

void init(void) {
    robotY = 65;
    robotX = 65;
    robotDir = UP; //(65, 65), UP 라고 간주하고 가상 맵을 그린다.

    for (int y = 0; y < 130; y++) {
        for (int x = 0; x < 130; x++) {
            vMap[y][x] = '#';
        }
    }
    vMap[robotY][robotX] = ' ';
    tickCnt = 0;

    scanCnt = 0;
    moveCnt = 0;
    turnCnt = 0;

    memset(screenBuf, 0, sizeof(screenBuf));

    //커서 숨기기
    CONSOLE_CURSOR_INFO cursorInfo;
    cursorInfo.dwSize = 1;
    cursorInfo.bVisible = false;
    SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE), &cursorInfo);
}

void gotoxy(int x, int y) {
    COORD pos = { x, y };
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), pos);
}

void drawMap(string msg, Coordinate target = { -1, -1 }) {
    tickCnt++;

    if (isDraw == false) return;

    if (tickCnt <= startTickCount) {
        gotoxy(0, 0);
        printf("TICK : %d...\n", tickCnt);
        return;
    }

    int N = 10;
    int lineCnt = 0;

    Coordinate reDrawPoint1 = { -1, -1 };
    Coordinate reDrawPoint2 = { -1, -1 };
    for (int py = 0; py < N * 2; py++) {
        for (int px = 0; px < N * 2; px++) {
            int y = robotY - N + py;
            int x = robotX - N + px;
            if (y < 0 || x < 0 || y >= 130 || x >= 130) continue;

            if (y == target.y && x == target.x) {
                reDrawPoint1 = { py, px };
            }
            else if (y == robotY && x == robotX) {
                reDrawPoint2 = { py, px };
            }

            if (screenBuf[py][px] == vMap[y][x]) continue;
            screenBuf[py][px] = vMap[y][x];

            string output;
            if (vMap[y][x] == '+') {
                output = "▩";
            }
            else if (vMap[y][x] == '#') {
                output = "■";
            }
            else if (vMap[y][x] == ' ') {
                output = "  ";
            }
            else if (vMap[y][x] == '_') {
                output = "__";
            }

            gotoxy(px * 2, py);
            printf("%s", output.c_str());
        }

        lineCnt++;
    }

    if (reDrawPoint1.x != -1) {
        gotoxy(reDrawPoint1.x * 2, reDrawPoint1.y);
        printf("★");
        screenBuf[reDrawPoint1.y][reDrawPoint1.x] = 'X';
    }

    if (reDrawPoint2.x != -1) {
        gotoxy(reDrawPoint2.x * 2, reDrawPoint2.y);
        if (robotDir == UP) printf("△");
        if (robotDir == LEFT) printf("◁");
        if (robotDir == DOWN) printf("▽");
        if (robotDir == RIGHT) printf("▷");
        screenBuf[reDrawPoint2.y][reDrawPoint2.x] = 'X';
    }

    gotoxy(0, lineCnt++);

    printf("TICK : %d\n", tickCnt);
    printf("(Y,X) = (%d,%d), Direction = ", robotY, robotX);
    if (robotDir == UP)    printf("UP      \n");
    if (robotDir == LEFT)  printf("LEFT    \n");
    if (robotDir == DOWN)  printf("DOWN    \n");
    if (robotDir == RIGHT) printf("RIGHT   \n");

    printf("SCAN COUNT : %d (%d점)\n", scanCnt, scanCnt * 20);
    printf("MOVE COUNT : %d (%d점)\n", moveCnt, moveCnt * 10);
    printf("TURN COUNT : %d (%d점)\n", turnCnt, turnCnt * 15);
    printf("%s\n", msg.c_str());

    Sleep(drawSpeed);
}

void stateSpin(int result[3][3]) {
    if (robotDir == UP) return;

    int base[3][3];
    memcpy(base, result, sizeof(base));

    switch (robotDir)
    {
    case 3: // LEFT
        for (int y = 0, sx = 2; y <= 2; ++y, --sx)
            for (int x = 0, sy = 0; x <= 2; ++x, ++sy)
                result[sy][sx] = base[y][x];
        break;
    case 2: // DOWN
        for (int y = 0, sy = 2; y <= 2; ++y, --sy)
            for (int x = 0, sx = 2; x <= 2; ++x, --sx)
                result[sy][sx] = base[y][x];
        break;
    case 1: // RIGHT
        for (int y = 0, sx = 0; y <= 2; ++y, ++sx)
            for (int x = 0, sy = 2; x <= 2; ++x, --sy)
                result[sy][sx] = base[y][x];
        break;
    }
}

void scanning() {
    //scan 후 나오는 데이터가 항상 위에서 바라본 데이터로 나오도록 한다.
    //방향이 왼쪽이면 오른쪽으로 한번 돌려주어 원상복구
    extern void scan(int floorState[3][3]);

    int state[3][3];
    scan(state);
    scanCnt++;
    stateSpin(state);

    //스캔한 정보를 맵에 그려줌.   
    for (int y = 0; y < 3; y++) {
        for (int x = 0; x < 3; x++) {
            int ny = robotY + y - 1;
            int nx = robotX + x - 1;

            if (state[y][x] == 0 && vMap[ny][nx] == '#') {
                vMap[ny][nx] = '_';
            }
            if (state[y][x] == 1 && vMap[ny][nx] == '#') {
                vMap[ny][nx] = '+';
            }
        }
    }
    drawMap("Scanning...");
}

int getMovePrice(int nowDir, int targetBang) {
    if (nowDir == targetBang) return 10;
    return 10 + 15;
}

void turnning(int nextDir) {
    if (robotDir == nextDir) return;

    turnCnt++;
    if (robotDir == UP && nextDir == RIGHT) turn(RIGHT);
    else if (robotDir == UP && nextDir == LEFT) turn(LEFT);
    else if (robotDir == UP && nextDir == DOWN) turn(DOWN);
    else if (robotDir == LEFT && nextDir == UP) turn(RIGHT);
    else if (robotDir == LEFT && nextDir == DOWN) turn(LEFT);
    else if (robotDir == LEFT && nextDir == RIGHT) turn(DOWN);
    else if (robotDir == RIGHT && nextDir == DOWN) turn(RIGHT);
    else if (robotDir == RIGHT && nextDir == UP) turn(LEFT);
    else if (robotDir == RIGHT && nextDir == LEFT) turn(DOWN);
    else if (robotDir == DOWN && nextDir == LEFT) turn(RIGHT);
    else if (robotDir == DOWN && nextDir == RIGHT) turn(LEFT);
    else if (robotDir == DOWN && nextDir == UP) turn(DOWN);

    robotDir = nextDir;
}

//현재 로봇 위치에서 target 위치에 갈 수 있는 방법을 찾고
//그 라우팅대로 이동한다. 그 장소는 청소된다.
int moving(Coordinate target, vector<int> route) {

    string msg = string{ "Moving... (" } + to_string(target.y) + string{ "," } + to_string(target.x) + string{ ")" };
    drawMap(msg, target);

    //라우팅 한대로 이동하기
    for (int i = route.size() - 1; i >= 0; i--) {
        int nextDir = route[i];
        turnning(nextDir);

        moveCnt++;
        int isMoving = move();

        //이동실패시 종료!
        if (isMoving == 0) {
            int ny = robotY + dirY[nextDir];
            int nx = robotX + dirX[nextDir];
            vMap[ny][nx] = '+';
            drawMap("쿵!");
            return 0;
        }

        robotY = robotY + dirY[nextDir];
        robotX = robotX + dirX[nextDir];
        drawMap(msg, target);
    }

    vMap[robotY][robotX] = ' ';
    drawMap("Cleaning...");
    return 1;
}

//Flood Fill로 가장 가까운 곳을 선택, 라우팅
//'-' 또는 '#'을 찾으면 된다.

vector<int> getCloseRoute(Coordinate& target) {
    vector<int> result;
    memset(used, 0, sizeof(used));

    //매번 초기화시 시간초과 발생
    //memset(q, 0, sizeof(Node) * 500000);

    int head = 0;
    int tail = 0;

    q[tail++] = { robotY, robotX, robotDir, -1 };
    int exitFlag = 0;

    while (head != tail) {
        Node now = q[head];

        for (int t = 0; t < 4; t++) {
            int ny = now.y + dirY[t];
            int nx = now.x + dirX[t];
            int nDir = t;

            if (vMap[ny][nx] == '_' || vMap[ny][nx] == '#') {
                target = { ny, nx };
                exitFlag = 1;
                q[tail] = { ny, nx, nDir, head };
                break;
            }

            if (vMap[ny][nx] == '+') continue;
            if (used[ny][nx] == 1) continue;
            used[ny][nx] = 1;

            q[tail++] = { ny, nx, nDir, head };

        }
        if (exitFlag == 1) break;

        head++;
    }

    //라우팅 실패 : 더이상 청소할 곳이 없다.
    if (exitFlag == 0) {
        return {};
    }

    int p = tail;
    while (q[p].parent != -1) {
        result.push_back(q[p].dir);
        p = q[p].parent;
    }

    return result;
}

void cleanHouse(void)
{
    drawMap("Ready...");

    init();

    scanning();

    while (1) {

        //갈 수 있는 가까운곳 정하기 '_' 또는 '#'
        Coordinate target = { 0 };
        vector<int> route = getCloseRoute(target);

        //더 이상 '_' 또는 '#' 없으면 종료
        if (route.size() == 0) {
            break;
        }

        //라우팅 대로 이동한다.
        int isMoving = moving(target, route);

        //충돌 발생시, Scan한다.
        if (isMoving == 0) scanning();
    }
}
```