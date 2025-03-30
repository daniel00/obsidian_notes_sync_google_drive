---
created: 2025-03-30 03:08
updated: 2025-03-30 03:08
tags: [algospot, bfs, 가중치, 01bfs]
alias: []
---

created: 2025-03-30 03:08
updated: 2025-03-30 03:08



![[Pasted image 20250330030821.png]]


문제 풀이하는 두가지 방법을 기록한다.
1 번 방법이 더 직관적이고 이해하기 쉬었다.
##### 1. 가중치가 있는 셀을 우선 점검하도록 큐의 맨 앞에 집어 넣는 방법 ( 0-1 BFS라고 한다.)

- 0인셀('방')이 우선 점검 되도록 큐의 맨앞에 넣는 다.
- 1인셀('벽')은 큐의 맨 뒤에 넣는다.
- 큐의 맨앞, 맨뒤가 큐의 경계를 넘어서지 않도록 처리 해 주어야 한다.
- 나눗셈 연산으로 처리해도 되는데, 직관적으로 if문으로 처리해도 된다.

##### 2. 부수는 벽의 개수를 최소화 하는 경로로 "갱신"하면서 맵의 모든 "셀"을 점검하는 방법.
- 모든 맵을 다 점검해야 하고, 최소가중치의 경로가 갱신될 수 있으므로 한번 방문했던 경로도 다시 큐에 넣어 점검해야 한다. -> visited를 점검 하면 안된다.
- minWallBreakCount를 전역으로 관리하면서, 계속 작은 값으로 갱신해주어야 한다.



###### 방법1. 가중치가 높은 셀을 우선 점검하도록 큐의 맨 앞에 집어 넣는 방법

```cpp
//방법 1 : 0-1 BFS 기법을 사용한 방법
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
				//head가 큐에 맨앞보다 작아질 경우, 큐의 맨 뒤로 옮긴다.
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
				//tail이 큐의 마지막을 넘어설 경우 큐의 맨 앞으로 옮긴다.
                if (tail == MAX_QUEUE_SIZE - 1)
                {
                    tail = 0;
                }
                else
                {
                    tail++;
                }
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


###### 2. 부수는 벽의 개수를 최소화 하는 경로로 "갱신"하면서 맵의 모든 "셀"을 점검하는 방법.
- 큐 사이즈 때문에 고생했다. 넉넉하게 잡아줘야 하는거 같다. 넉넉한 기준은.... 맵크기의 5배 정도는 되야 하는것 같다.

```cpp
// boj 1261 알고스팟
#include <stdio.h>

struct Pos
{
    int y;
    int x;
};

const int MAXN = 101;

int m; // col
int n; // row

char map[MAXN][MAXN] = {0};
// int map[MAXN][MAXM] = {0};

// 큐사이즈는 이정도 해야 런타임 에러가 발생하지 않는다
Pos q[MAXN * MAXN * 10] = {0};
int head = 0;
int tail = 0;
int visited[MAXN][MAXN] = {0};
int minWallBreakCount[MAXN][MAXN] = {0};

int dx[4] = {1, -1, 0, 0};
int dy[4] = {0, 0, 1, -1};

// void printMap(int rowsize, int colsize)
// {
//     for (int row = 1; row <= rowsize; row++)
//     {
//         for (int col = 1; col <= colsize; col++)
//         {
//             printf("%c", map[row][col]);
//         }
//         printf("\n");
//     }
// }

void bfs(Pos s)
{
    q[tail++] = s;
    visited[s.y][s.x] = 1;
    minWallBreakCount[s.y][s.x] = 0;

    while (head < tail)
    {
        // Pos curr = q[head++ % (MAXN * MAXN)];
        Pos curr = q[head++];
        int currentWallBreakCount = minWallBreakCount[curr.y][curr.x];

        for (int i = 0; i < 4; i++)
        {
            int ny = curr.y + dy[i];
            int nx = curr.x + dx[i];

            // 경계를 넘는지 점검
            // if (ny < 1 || ny > n || nx < 1 || nx > m || visited[ny][nx] == 1)
            if (ny < 1 || ny > n || nx < 1 || nx > m)
                continue;

            // 벽을 최소로 부수는 경로를 큐에 넣는다.
            // int nextWallBreakCount = currentWallBreakCount + map[ny][nx];
            int nextWallBreakCount;

            if (map[ny][nx] == '0')
                nextWallBreakCount = currentWallBreakCount + 0;
            else if (map[ny][nx] == '1')
                nextWallBreakCount = currentWallBreakCount + 1;

            if (nextWallBreakCount < minWallBreakCount[ny][nx])
            {
                minWallBreakCount[ny][nx] = nextWallBreakCount;

                Pos next;
                next.y = ny;
                next.x = nx;
                q[tail++] = next;
                // visited[ny][nx] = 1;
            }

            //
        }
    }
}

int main()
{
#ifndef ONLINE_JUDGE
    freopen("./testcases/3/input.txt", "r", stdin);
    // freopen("input.txt", "r", stdin);
#endif

    scanf("%d %d", &m, &n); // col, row

    for (int row = 1; row <= n; row++)
    {
        for (int col = 1; col <= m; col++)
        {
            scanf(" %c", &map[row][col]);
            // scanf("%1d", &map[row][col]);
            minWallBreakCount[row][col] = 9999999;
            visited[row][col] = 0;
        }
    }

    // printMap(n, m);

    Pos start;
    start.y = 1;
    start.x = 1;
    bfs(start);

    printf("%d", minWallBreakCount[n][m]);

    return 0;
}
```
