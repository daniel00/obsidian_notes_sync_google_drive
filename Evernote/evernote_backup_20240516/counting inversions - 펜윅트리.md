---
tags:
  - bit
  - binary-index-tree
  - 바이너리-인덱스-트리
  - 펜윅트리
created: 2017-06-16 00:16.15
updated: 2024-05-22 23:00.35
---
펜윅트리를 이용해서 counting inversions(반전횟수) 를 구하는 문제.

inversions 이란?
정의 : i<j 이고 A\[i\]>A\[j\]  인 숫자쌍
\== 배열을 정렬했을때 정렬과 반대모양으로 놓여있는 숫자의 쌍(주로 오름차순 기준의 문제가 출제)
\== 정렬하면 \[작은수-->큰수\]순이 되어야 하는데 \[큰수-->작은수\]의 순서로 놓여있는 쌍.
\== 자기보다 오른쪽에 작은수가 있는 쌍

ex) 9,1,0,5,4
inversions 수 : 6
(9,1) (9,0),(9,5),(9,4)
(1,0)
(5,4)

\*풀이 아이디어
\-어떤수의 오른쪽에, 어떤수보다 작은수가 몇개(==몇번)이나 출현했었는지를 알아내면 된다.
또는 어떤수의 왼쪽에 자기보다 큰수가 몇개 출현했는지를 보면됨
\-\[몇개/몇번\]을 구하기위해, 점검한 숫자의 빈도수를 펜윅트리에 저장해서 합을 구하면 된다.(update():logN, getSum():logN)
\-배열의 오른쪽부터 점검하면서 펜윅트리에 점검한 숫자의 빈도수를 하나씩 늘려간다.

예를들어, 7보다 작은수가 몇 번 나왔는지를 알아내려면, 7보다 1작은수인 6까지의 숫자들이 몇 번 출현 했었는지를 구하면 된다.
이는, bit에 각 숫자의 출현 횟수를 저장해서 구하면 된다.(logN만에 구할 수 있다)
즉, 0~6까지 숫자가 출현한 빈도수 == 빈도수 배열중 6 까지의 부분합

그런데, 숫자배열을 그대로 이용하면 다음의 문제가 있다.
\-배열의 숫자가 매우 크므로 빈도수를 저장하려면 엄청나게 큰 배열이 필요하게 된다.(예, 배열이 {1, 10^9, 5} 세개의 데이터밖에 안되지만 빈도수 테이블을 만들려면 10^9개가 필요하다) 
\-배열에 음수의 빈도수를 저장할 수 없다.

이를 해결하기 위해서, 배열의 값이 아닌 배열의 인덱스를 이용하도록 한다.(그러려면 배열의 값<->배열의 인덱스가 같은 순서로 놓여야 한다.(우리는 두값의 대소만 알면되지, 그 크기를 정확히 알 필요는 없다는 점도 착안하자)
다음의 방법으로 이 아이디어를 구현 할 수 있다.
\-배열을 값의 크기순으로 정렬한다.(sort())
정렬이 되면 원래 큰 값은 큰 인덱스를 갖게 될 것이고, 작은 값은 작은 인덱스를 갖게 될 것이므로 원래 숫자의 크고 작음의 관계가 유지되고 위의 문제들이 발생하지 않는다.
\-정렬된 배열에서 원래 값의 인덱스를 찾아서(lower\_bound()이용) 새로운 배열을 만든다. (\*펜윅트리를 사용하여야 하므로 배열의 인덱스는 1부터 사용 될 수 있도록 하여야 한다)

\-인덱스 배열을 오른쪽 부터 점검하며, 
==(1)지금까지 현재수보다 작은수(현재수-1)가 몇번(inversions회수) 이나 나왔었는지를 확인해서 누적하고==
==(2)현재 점검했던 수의 빈도수를 하나 늘려서 펜윅트리를 업데이트 한다.==
(3)위 과정을 반복하면 총 inversions 수를 구할 수 있다.

아래는 위의 아이디어를 구현한 코드이다.

```cpp
#include <iostream>
#include <cstdio>
#include <algorithm>

using namespace std;

const int MAXN = 1e6;

int A[MAXN + 1];
int B[MAXN + 1];
int C[MAXN + 1];

int BIT[MAXN + 1];

int N;

void convertValToIndex()
{
      //copy
      for (int i = 1; i <= N; i++)
              B[i] = A[i];

      //sort
      sort(B + 1, B + N + 1);

      //value-->index
      for (int i = 1; i <= N; i++)
              C[i] = lower_bound(B + 1, B + N + 1, A[i]) - (B + 1)+1;      //펜윅트리는 1베이스이므로 마지막에 인덱스 위치를 찾은후 +1
}

void updateBIT(int idx, int val)
{
      while (idx <= N)
      {
              BIT[idx] += val;
              idx += (idx&-idx);
      }
}

int getSum(int idx)
{
      int ans = 0;
      while (idx > 0)
      {
              ans += BIT[idx];
              idx -= (idx&-idx);
      }
      return ans;
}

int main()
{
      freopen("sample_input.txt", "r", stdin);

      scanf("%d", &N);
      for (int i = 1; i <= N; i++)
              scanf("%d", &A[i]);

      convertValToIndex();

      int invCnt = 0;
      for (int i = N; i >= 1; i--)
      {
              invCnt += getSum(C[i]-1); //현재값보다 작은값(C[i]-1)이 나온 회수
              updateBIT(C[i], 1);
      }

      printf("%d\n", invCnt);

      return 0;
}
```

input

```
5
9 1 0 5 4
```

output

```
6
```
