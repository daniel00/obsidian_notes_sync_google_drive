---
created: 2023-01-21 23:14.45
updated: 2023-01-21 23:32.41
---
```
int myunique(int* src, int size)
{
    int j = 0;

    for (int i = 1; i < size; i++)
    {
        if(src[j] == src[i])
            continue;
        else
        {
            j++;
            src[j] = src[i];
        }
    }

    return j;
}
```

인덱스 두개로 현재값과 다음값을 비교한다.
현재값과 다음값이 같으면 **i** 인덱스를 계속 증가시키고,
현재값과 다음값이 달라지면  **j** 인덱스를 증가시키고 값을 복사한다.

1 2 3 3 3 4 4 4 5
중복 제거하면
**1 2 3 4 5** 4 4 4 5   
배열 뒤에는 남은 데이터를 무시 할 수 있도록,
**j** 인덱스를 리턴해준다.

고민하던 내용.
1 2 3 4 5 ..... 이렇게 중복이 없는 경우,
j인덱스를 증가시키고, src\[j\] = src\[i\] (자기데이터를 업데이트) 하는 무의미한 작업이 수행된다.
이거 머리속으로 고민하느라 헷갈렸다. 손으로 써보자!
