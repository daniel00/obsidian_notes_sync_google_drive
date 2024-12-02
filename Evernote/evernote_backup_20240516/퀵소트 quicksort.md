---
created: 2023-01-24 15:53.41
updated: 2023-01-24 21:37.14
---
퀵정렬을 구현해 보자

```
void myQuickSort(int* arr, int size)
{
    if(size <= 1) return;  // 재귀 탈출

    int left = 0;
    int right = size-2;
    int pivot = arr[size-1];

    while(1)
    {
        while(arr[left] < pivot && left < size-1) left++;
        while(arr[right] > pivot && right > 0) right--;

        if(left < right)
        {
            swap(arr+left, arr+right);  //swap left, right
            left++, right--;    //for next turn
        }
        else
        {
            swap(arr+left, arr+size-1); //swap left, pivot
            break;
        }
    }

    myQuickSort(arr,left);
    myQuickSort(arr+left+1, size-left-1);
}
```

```
void myQuickSort1(int* arr, int start, int end)
{
    printf("start:%d, end:%d\n", start, end);
    if(end-start < 1) return;  // 배열 크기가 한개 이하면 리턴

    int left = start;
    int right = end-1;
    int pivot = arr[end];

    while(1)
    {
        while(arr[left] < pivot && left < end) left++;
        while(arr[right] > pivot && right > 0) right--;

        if(left < right)
        {
            swap(arr+left, arr+right);  //swap left, right
            left++, right--;    //for next turn
        }
        else
        {
            swap(arr+left, arr+end); //swap left, pivot
            break;
        }
    }

    myQuickSort1(arr, start, left-1);
    myQuickSort1(arr, left+1, end);
}
```

```
void swap(int* a, int* b)
{
    int temp;
    temp = *a;
    *a = *b;
    *b = temp;
}
```

위 처럼 작성해서, 백준 18870 좌표압축 풀어보니, Segmentation Fault발생했다.
left++, right--  할 때 인덱스 리밋 처리를 안해주어서 발생했음을 확인했다.(스택오버플로우)
<https://stackoverflow.com/questions/15413620/quicksort-program-with-segmentation-fault>

![[./_resources/퀵소트_quicksort.resources/image.png]]
아래처럼 수정하니 정상 동작.

while(arr\[left\] < pivot **&& left < size-1**) left++;
while(arr\[right\] > pivot **&& right > 0**) right--;

while(arr\[left\] < pivot **&& left < end**) left++;
while(arr\[right\] > pivot **&& right > 0**) right--;

위 처럼 두가지 방식으로 구현해 보았다.
(1) 함수의 인자로  배열의 시작주소, 배열의 크기를 넘기는 방법
(2) 함수의 인자로 배열의 시작주소, 정렬할 영역을 넘기는 방법

둘다 구조는 거의 동일 하지만 ,
(1)번의 경우 재귀적으로 함수를 호출할 때 , 두번째 인수인 배열의 크기를 구하는데 어려움이 있었다.
(2)번은 재귀 탈출 조건을 판단할 때 실수가 있었다.
결론은 (2)번으로 연습하는게 좋을 것 같다.

* 나는 피벗을 배열의 가장 끝 원소로 선택했고,
* 피벗보다 작은값이 나오면 left인덱스를 하나씩 증가 시키고, 크거나 같은 값이 나오면 멈춘다.
* 피벗보다 큰값이 나오면 right인덱스를 하나씩 감소 시키고,  작거나 같은 값이 나오면 멈춘다.
* 양쪽 인덱스가 둘 다 멈추게 되면 이때 , left, right인덱스의 위치를 확인해서
*      left < right 조건이면   -> left, right가 가리키고 있는 값을 스왑한다.
*                                                 -> left, right 인덱스를 하나씩 증가시킨 후 작업을 계속한다.
*      rifht <= left 조건이면 ->  피벗(배열끝원소)와 left가 가리키는 원소를 스왑한다.
*                                                -> 반복문을 탈출한다.
* 피벗기준으로 왼쪽 오른쪽 영역을 재귀적으로 다시 정렬한다.
