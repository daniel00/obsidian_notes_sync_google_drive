---
created: 2025-04-26 15:40
updated: 2025-04-26 15:40
tags: [bfs]
alias: [bfs]
---

created: 2025-04-26 15:40
updated: 2025-04-26 15:40

#### BFS (Breadth First Search)

그래프 등을 탐색 할 때, 현재 노드에 연결된 모든 자식 노드를 우선적으로 탐색하는 알고리즘 이다.

자식 노드를 탐색하기 위해, 자식들을 "큐"에 넣어놓고 큐 앞에서 부터 한 개씩 꺼내면서 탐색한다.

그래프 구조를 레벨 별로 탐색하게 되므로, 특정 노드를 찾을 때 사용 할 경우,
*항상 최단 거리를 보장* 한다.


level 1     node1

level2      node2   node3   node4

level3      node5   node6   node7   node8

...

...



