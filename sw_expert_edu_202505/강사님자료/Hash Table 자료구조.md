---
title: " Hash Table 자료구조"
source: "https://pro.mincoding.co.kr/enterprise/contest/sdi/593/announcements/12644"
author:
published:
created: 2025-06-22
description:
tags:
  - "clippings"
---
```cpp
#include <iostream>
using namespace std;

class HashTable {
public:
    static const int MAX_KEY = 64;
    static const int MAX_DATA = 128;
    static const int MAX_TABLE = 4096;

    typedef struct
    {
        char key[MAX_KEY + 1];
        char data[MAX_DATA + 1];
    }Hash;
    Hash tb[MAX_TABLE];

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

    int find(const char* key, char* data)
    {
        unsigned long h = hash(key);
        int cnt = MAX_TABLE;

        while (tb[h].key[0] != 0 && cnt--)
        {
            if (strcmp(tb[h].key, key) == 0)
            {
                strcpy(data, tb[h].data);
                return 1;
            }
            h = (h + 1) % MAX_TABLE;
        }
        return 0;
    }

    int add(const char* key, const char* data)
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
        strcpy(tb[h].data, data);
        return 1;
    }
};

HashTable ht;

int main() {

    ht.add("huhu", "haha");
    ht.add("huh", "hah2");

    char buf[10];
    ht.find("huhu", buf);

    //프로젝트 > 속성 > C/C++ > 일반 > SDL 검사 : 아니오
    std::cout << buf;
    
    return 0;
}
```