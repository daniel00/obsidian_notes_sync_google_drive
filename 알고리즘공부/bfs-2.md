---
created: 2025-04-01 00:00
updated: 2025-04-01 00:00
tags: []
alias: []
---

created: 2025-04-01 00:00
updated: 2025-04-01 00:00


코파일럿에게 다음과 같이 물었다.

bfs알고리즘에서 갑자기 헷갈리네. 맵에서 시작점부터 도착점까지 최단경로를 찾을때, bfs가 어떻게 최단 거리임을 알 수 있는거지?


BFS(Breadth-First Search)가 그래프에서 최단 경로를 보장하는 이유는 BFS의 탐색 방식 때문입니다. BFS는 시작 노드에서 출발하여 모든 인접 노드를 탐색한 후, 그 다음 레벨의 노드들을 탐색합니다. 즉, 노드와 노드를 잇는 간선의 길이가 동일한 무가중치 그래프에서 BFS는 최단 경로를 보장합니다.

### BFS의 탐색 방식
1. **레벨 단위로 탐색**: BFS는 시작 노드에서부터 인접한 모든 노드를 먼저 탐색하고, 그 다음으로 인접한 노드들을 탐색합니다. 이 과정을 반복하면서 각 레벨별로 탐색합니다.
2. **큐 사용**: BFS는 큐를 사용하여 현재 탐색 중인 노드를 저장하고, 큐에서 꺼낸 노드의 인접 노드를 다시 큐에 추가합니다.
3. **방문 체크**: BFS는 각 노드를 방문할 때마다 방문 여부를 체크하여 이미 방문한 노드를 다시 탐색하지 않도록 합니다.

### BFS가 최단 경로를 보장하는 이유
- **레벨 기반 탐색**: BFS는 레벨 단위로 노드를 탐색합니다. 즉, 시작 노드와의 거리가 같거나 더 가까운 노드를 먼저 탐색하고, 더 먼 노드는 나중에 탐색합니다.
- **첫 번째 도착**: 특정 노드에 처음 도달하는 경로는 항상 최단 경로입니다. 왜냐하면 BFS는 모든 가능한 경로 중 가장 짧은 경로부터 탐색하기 때문입니다.

### 예시
다음은 BFS가 최단 경로를 찾는 과정을 설명하는 예시입니다.

#### 그래프 예시
```
A -- B -- D -- E
|    |    |
C -- F    G
```
- 시작 노드: `A`
- 목표 노드: `E`

#### 탐색 과정
1. **레벨 0**: 시작 노드 `A`
   - 큐: [A]
   - 방문: {A}

2. **레벨 1**: `A`의 인접 노드 `B`, `C`
   - 큐: [B, C]
   - 방문: {A, B, C}

3. **레벨 2**: `B`의 인접 노드 `D`, `F`와 `C`의 인접 노드 `F`
   - 큐: [D, F]
   - 방문: {A, B, C, D, F}

4. **레벨 3**: `D`의 인접 노드 `E`, `G`와 `F`의 인접 노드 `D`
   - 큐: [E, G]
   - 방문: {A, B, C, D, E, F, G}

이 과정에서 `E`에 처음 도달하는 경로는 `A -> B -> D -> E`입니다. BFS는 레벨 단위로 탐색하기 때문에, `E`에 도달하는 경로가 가장 짧은 경로임을 보장합니다.

### 코드 예시
다음은 BFS를 구현한 C++ 코드입니다. Allman 스타일로 작성되었습니다.

```cpp name=bfs_example.cpp
#include <stdio.h>
#include <queue>
#include <vector>

#define MAX_NODES 100

class Graph
{
private:
    std::vector<int> adj[MAX_NODES];
    bool visited[MAX_NODES];
    int num_nodes;

public:
    Graph(int nodes) : num_nodes(nodes)
    {
        for (int i = 0; i < nodes; i++)
        {
            visited[i] = false;
        }
    }

    void add_edge(int src, int dest)
    {
        adj[src].push_back(dest);
        adj[dest].push_back(src); // 무방향 그래프인 경우
    }

    void bfs(int start_node)
    {
        std::queue<int> q;
        q.push(start_node);
        visited[start_node] = true;

        while (!q.empty())
        {
            int node = q.front();
            q.pop();
            printf("%d ", node);

            for (int i = 0; i < adj[node].size(); i++)
            {
                int adj_node = adj[node][i];
                if (!visited[adj_node])
                {
                    q.push(adj_node);
                    visited[adj_node] = true;
                }
            }
        }
    }
};

int main()
{
    int num_nodes = 6;
    Graph g(num_nodes);

    g.add_edge(0, 1);
    g.add_edge(0, 2);
    g.add_edge(1, 3);
    g.add_edge(1, 4);
    g.add_edge(2, 5);

    printf("BFS Traversal starting from node 0:\n");
    g.bfs(0);

    return 0;
}
```

### 요약
BFS는 시작 노드부터 레벨 단위로 노드를 탐색하기 때문에, 특정 노드에 처음 도달하는 경로가 항상 최단 경로임을 보장합니다. 이를 통해 무가중치 그래프에서 최단 경로를 찾는 데 적합한 알고리즘입니다.