---
title: "Microsoft Copilot: AI 도우미"
source: "https://copilot.microsoft.com/chats/FCeisX284247aMvPB9RzY"
author:
  - "[[Microsoft Copilot: AI 도우미]]"
published:
created: 2025-01-27
description: "Microsoft Copilot은 정보를 제공하고, 생절하고, 영감을 주는 도우미입니다. 조언, 피드백 및 간단한 답변을 얻으세요. 지금 Copilot을 사용해 보세요."
tags:
  - "clippings"
---
```
#include <iostream>
#include <queue>
#include <utility>

using namespace std;

const int directions[4][2] = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}}; // 동, 남, 서, 북

struct Node {
    int x, y, dir, turns;
    Node(int _x, int _y, int _dir, int _turns) : x(_x), y(_y), dir(_dir), turns(_turns) {}
};

int minTurnsToReachEnd(int grid[][5], int n, int m) {
    bool visited[5][5][4] = {{{false}}}; // 방문 여부 배열 초기화
    queue<Node> q;
    
    // 시작 위치에서 모든 방향으로 시작
    for (int i = 0; i < 4; ++i) {
        q.push(Node(0, 0, i, 0));
        visited[0][0][i] = true;
    }
    
    while (!q.empty()) {
        Node current = q.front();
        q.pop();
        
        // 목표 위치에 도달하면 회전 수 반환
        if (current.x == n - 1 && current.y == m - 1) {
            return current.turns;
        }
        
        // 현재 방향으로 한 칸 이동
        int nx = current.x + directions[current.dir][0];
        int ny = current.y + directions[current.dir][1];
        
        // 유효한 위치인 경우 큐에 추가
        if (nx >= 0 && nx < n && ny >= 0 && ny < m && !visited[nx][ny][current.dir] && grid[nx][ny] == 0) {
            visited[nx][ny][current.dir] = true;
            q.push(Node(nx, ny, current.dir, current.turns));
        }
        
        // 회전하여 다른 방향으로 이동
        for (int i = 1; i < 4; ++i) {
            int newDir = (current.dir + i) % 4;
            nx = current.x + directions[newDir][0];
            ny = current.y + directions[newDir][1];
            
            if (nx >= 0 && nx < n && ny >= 0 && ny < m && !visited[nx][ny][newDir] && grid[nx][ny] == 0) {
                visited[nx][ny][newDir] = true;
                q.push(Node(nx, ny, newDir, current.turns + 1));
            }
        }
    }
    
    // 도달할 수 없을 경우 -1 반환
    return -1;
}

int main() {
    int grid[5][5] = {
        {0, 0, 1, 0, 0},
        {0, 1, 0, 1, 0},
        {0, 0, 0, 0, 0},
        {1, 0, 1, 0, 1},
        {0, 0, 0, 0, 0}
    };
    
    int n = 5;
    int m = 5;
    
    int result = minTurnsToReachEnd(grid, n, m);
    
    if (result != -1) {
        cout << "최소 회전 수: " << result << endl;
    } else {
        cout << "목표 위치에 도달할 수 없습니다." << endl;
    }
    
    return 0;
}
```