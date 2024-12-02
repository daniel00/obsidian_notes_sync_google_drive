---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11506
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:01.23
---
### Seq Numbering

**\- HashTable 자료구조로 구현**  
\- <String, Int>  <-- 많이 사용  
\- <Int, Int> <--- 많이 사용

**reference Code 연습 필요**  
1\. 연습 1 - <String, Int>   
2\. 연습 2 - <Int, Int>

**Seq Numbering 를 구현해야할 때**   
unordered\_map 으로 구현하시고,  
reference Code로 변환을 해주시면 됩니다.  
 

### Unodered\_map으로 구현한 Seq Numbering

사람 고유 이름이 주어지면

새로운 ID를 부여한다.

```cpp
#include <iostream>
#include <unordered_map>

using namespace std;

unordered_map<string, int> seqNums;
int newIDCnt = 0;

int getNewID(string ID) {
	if (seqNums.count(ID) == 0) { //부여가 안되었으면 (처음등장)
		seqNums[ID] = ++newIDCnt;
	}
	return seqNums[ID];
}

void go(string id) {

	int newID = getNewID(id);

	//cout << id << " = " << newID << "\n";
	printf("%s = %d\n", id.c_str(), newID);

	//char buf[10]
	//string str = "ABC";
	//printf("%s", str.c_str());
}

int main() {

	go("ABC");
	go("HAHA");
	go("BTS");
	go("GO");
	go("GI");
	go("ABC");
	go("GI");
}
```

### 컨버팅 <string, int>

```cpp
#include <iostream>
#include <unordered_map>
#include <stdio.h>
#include <string.h>
#include <memory.h>

using namespace std;

class HashTable {
public:
    static const int MAX_KEY = 10;
    static const int MAX_TABLE = 4096; //HashTable 자료구조에 들어오는 노드 개수 x 2

    typedef struct
    {
        char key[MAX_KEY + 1]; //문자열
        int data; //int
    }Hash;
    Hash tb[MAX_TABLE] = { 0 };

    unsigned long hash(const char* str)
    {
        unsigned long hash = 5381;
        int c;

        while (c = *str++)
        {
            hash = (((hash << 5) + hash) + c) % MAX_TABLE;
        }

        return hash % MAX_TABLE;
    }

    int find(const char* key, int* data)
    {
        unsigned long h = hash(key);
        int cnt = MAX_TABLE;

        while (tb[h].key[0] != 0 && cnt--)
        {
            if (strcmp(tb[h].key, key) == 0)
            {
                *data = tb[h].data;
                return 1;
            }
            h = (h + 1) % MAX_TABLE;
        }
        return 0;
    }

    int add(const char* key, int data)
    {
        unsigned long h = hash(key);

        while (tb[h].key[0] != 0)
        {
            if (strcmp(tb[h].key, key) == 0)
            {
                return 0;
            }

            h = (h + 1) % MAX_TABLE;
        }
        strcpy(tb[h].key, key);

        tb[h].data = data;
        return 1;
    }

};

//unordered_map<string, int> seqNums;
HashTable seqNums;
int newIDCnt = 0;

int getNewID(string ID) {
	//if (seqNums.count(ID) == 0) { //부여가 안되었으면 (처음등장)

    int result;
    if (seqNums.find(ID.c_str(), &result) == 0) {
        result = ++newIDCnt;
        seqNums.add(ID.c_str(), result);
		//seqNums[ID] = ++newIDCnt;
	}

    seqNums.find(ID.c_str(), &result);
	return result;
}

void go(string id) {

	int newID = getNewID(id);

	//cout << id << " = " << newID << "\n";
	printf("%s = %d\n", id.c_str(), newID);

	//char buf[10]
	//string str = "ABC";
	//printf("%s", str.c_str());
}

int main() {

	go("ABC");
	go("HAHA");
	go("BTS");
	go("GO");
	go("GI");
	go("ABC");
	go("GI");
}
```