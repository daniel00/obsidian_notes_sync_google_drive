---
tags:
  - binarysearch
  - 바이너리서치
  - 이진탐색
created: 2023-01-21 23:11.44
updated: 2024-05-22 22:46.43
---
```cpp
int binarySearch(int* src, int size, int key)
{
    int left = 0;
    int right = size-1;
    int mid;

    while(left <= right)
    {
        mid = (left + right)/2;

        if(key < src[mid])
            right = mid-1;
        else if(key > src[mid])
            left = mid +1;
        else
            return mid;
    }

    // printf("no key in src array : %d\n", key);
    return -1;  //no key
}
```
