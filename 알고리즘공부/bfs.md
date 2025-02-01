---
created: 2025-01-27 01:56
updated: 2025-01-27 01:56
tags: [bfs, 최단거리, 큐, 너비우선, 미로, 레벨]
alias: []
---

created: 2025-01-27 01:56
updated: 2025-01-27 01:56

#### BFS(Bread First Search, 너비우선 탐색)

[[1726 로봇. robot]] 이 문제를 풀면서 bfs에 대한 이해도가 깊어진거 같다.

bfs에서는,
아직 이웃을 점검하지 않은 노드들을 큐에 넣어야 한다.  방문하지 않은 노드를 넣는게 아니다. 방문 하였더라도 아직 이웃을 점검하지 않은 노드라면 큐에 넣고, 큐에 넣은 노드를 꺼내어 이웃을 점검 하는 과정으로 진행한다.

visited == queued, 즉 이미 큐에 한번 넣은 노드를 visited = 1 로 표시하여,
다시 큐에 넣는 중복 탐색을 방지하여야 한다.
visited의 의미가 계속 헷갈린다. 명칭 자체가 '방문' 이라 그런가 보다.
visited는 "이 노드는 이미 큐에 넣었다. 그러니 다시 넣지 말아라" 라는 의미로 해석하자.
아니면 명칭을 alreadyEnqued 정도로 하면 어떨까 싶다.

- 노드는, 탐색에 영향을 미치는 상태 데이터들을 모두 고려하여야 한다.
예를들어, 
- 좌표만 가지는 맵에서이 길찾기는, x,y좌표를 큐에 넣으면 되고, 
  visited 배열은 좌표에 대해서만 표현하면 된다. 
```cpp
  enque(y,x);
  visted[y][x] = 1 ;
 ```
 
- 좌표와 방향까지 고려하는 길찾기는, x,y좌표와 direction 정보까지 큐에 넣어야 한다.
  visited 배열은 좌표와 방향에 대해서 표현해야 한다. 
```cpp
  enque(y,x,dir);
  visted[y][x][dir] = 1;
```




from . copilot
BFS 탐색 방식
BFS에서는 현재 노드의 인접 노드들, 즉 현재 노드의 하위 레벨에 있는 노드들을 먼저 탐색합니다. 예를 들어, 아래와 같은 트리 구조를 생각해 볼게요:

      A  (레벨 0)
     / \
    B   C (레벨 1)
   / \   \
  D   E   F (레벨 2)
  
레벨 0: 루트 노드 A에서 탐색 시작.

레벨 1: A의 인접 노드인 B와 C를 탐색.

레벨 2: B와 C의 인접 노드인 D, E, F를 탐색.

즉, BFS는 현재 노드의 다음 레벨을 너비 우선으로 탐색합니다.

이렇게 설명드리니 이해가 더 잘 되셨길 바랍니다! 또 다른 질문이 있으시면 언제든지 말씀해 주세요. 😊


![[Screenshot_20250127_021933_Samsung capture.jpg]]


 코파일럿에게, 다음과 같이 질문했더니
 
 "2차원 행렬구조의 판에서, 최단 경로를 찾는 프로그램을 작성하는데, 회전을 최소화 하도록 cpp로 작성해줘. 큐를 활용하면 좋겠어. 주석을 달아주고. 테스트 코드도 만들어줘."
 
 아래의 코드를 만들어 주었다. 잘 짜준거 같다.
```cpp
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



여러개의 경로중 어떻게 최단 거리를 구하는지 이해가 되지 않아서 , 깃헙코파일럿에게 물어봤더니, 아래처럼 명쾌한 답을 주었다.

### 먼저 들어온 노드를 먼저 탐색한다. 
### 따라서 첫 번째로 목표에 도달한 노드까지의 거리가 최단 거리가 된다.



![[Pasted image 20250129204545.png]]