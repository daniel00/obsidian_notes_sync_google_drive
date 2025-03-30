---
created: 2025-03-30 03:08
updated: 2025-03-30 03:08
tags: []
alias: []
---

created: 2025-03-30 03:08
updated: 2025-03-30 03:08



![[Pasted image 20250330030821.png]]


문제 풀이하는 두가지 방법을 기록한다.
##### 1. 부수는 벽의 개수를 최소화 하는 경로로 "갱신"하면서 맵의 모든 "셀"을 점검하는 방법.
- 모든 맵을 다 점검해야 한다. 따라서
- 

##### 2. 가중치가 있는 셀을 우선 점검하도록 큐에 먼저 집어 넣는 방법 ( 0-1 BFS라고 한다.)



이 문제는 다른 BFS문제와 비슷하지만, 벽을 부수는 회수를 최소화하는 경로를 큐에 넣는다는게 중요하다.
또한, visited를 점검하지 말아야 한다!!! 이미 방문한 노드일지라도 더 적은 벽을 부수고 다시 방문 할 수 있기 때문이다.

```cpp
// 0-1 BFS 기법을 사용한 방법
// 이번 문제의 경우 벽을 적게 부수며 목표에 도착하는게 목표이다.
// 즉, 가능하면 벽을 부수지 않아야 한다.
// 이와같이 가중치가 중요한 경우 가중치가 작거나 큰 노드를 먼저 처리하게 하는 방법이 0-1 BFS 방법이다.
#include <stdio.h>
#include <stdlib.h>

struct Pos
{
    int y;
    int x;
    int wallBreaks;
};

#define MAXN 101
#define MAX_QUEUE_SIZE (MAXN * MAXN * 10)

int m; // col
int n; // row

char map[MAXN][MAXN] = {0};

Pos q[MAX_QUEUE_SIZE] = {0}; // 큐 크기를 늘림
int head = 0;
int tail = 0;
int visited[MAXN][MAXN] = {0};

int dx[4] = {1, -1, 0, 0};
int dy[4] = {0, 0, 1, -1};

void bfs(Pos s)
{
    q[tail++] = s;
    visited[s.y][s.x] = 1;

    while (head != tail)
    {
        Pos curr = q[head];
        head = (head + 1) % MAX_QUEUE_SIZE;

        if (curr.y == n && curr.x == m)
        {
            printf("%d\n", curr.wallBreaks);
            return;
        }

        for (int i = 0; i < 4; i++)
        {
            int ny = curr.y + dy[i];
            int nx = curr.x + dx[i];

            if (ny < 1 || ny > n || nx < 1 || nx > m || visited[ny][nx])
                continue;

            visited[ny][nx] = 1;
            Pos next = {ny, nx, curr.wallBreaks + (map[ny][nx] - '0')};

            if (map[ny][nx] == '0')
            {
                if (head == 0)
                {
                    head = MAX_QUEUE_SIZE - 1;
                }
                else
                {
                    head--;
                }
                q[head] = next;
            }
            else
            {
                q[tail] = next;
                if (tail == MAX_QUEUE_SIZE - 1)
                {
                    tail = 0;
                }
                else
                {
                    tail++;
                }
                // tail = (tail + 1) % MAX_QUEUE_SIZE;
            }
        }
    }
}

int main()
{
#ifndef ONLINE_JUDGE
    freopen("./testcases/3/input.txt", "r", stdin);
#endif

    scanf("%d %d", &m, &n); // col, row

    for (int row = 1; row <= n; row++)
    {
        for (int col = 1; col <= m; col++)
        {
            scanf(" %c", &map[row][col]);
            visited[row][col] = 0;
        }
    }

    Pos start = {1, 1, 0};
    bfs(start);

    return 0;
}

```

