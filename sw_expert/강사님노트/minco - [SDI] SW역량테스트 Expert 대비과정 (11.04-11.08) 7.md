---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11503
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:02.20
---
```cpp
#include <iostream>
#include <stdio.h>
#include <string.h>
#include <memory.h>
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

    int add(const char* key, char* data)
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

int main() {
    //key value - string, string

    HashTable ht;

    char buf[] = "huhu";
    ht.add("ABC", buf);

    char buf2[] = "haha";
    ht.add("BBB", buf2);

    char receive[100];

    ht.find("BBB", receive);

    cout << receive;
}
```