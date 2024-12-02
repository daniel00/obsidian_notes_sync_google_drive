---
title: minco | [SDI] SW역량테스트 Expert 대비과정 (11.04-11.08)
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/announcements/11504
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 01:01.58
---
```cpp
#include <iostream>
#include <stdio.h>
#include <string.h>
#include <memory.h>
using namespace std;

class HashTable_String_To_INT {
public:
    static const int MAX_KEY = 64;
    static const int MAX_DATA = 128;
    static const int MAX_TABLE = 4096;

    typedef struct
    {
        char key[MAX_KEY + 1];
        //char data[MAX_DATA + 1]; //변경
        int data;
    }Hash;
    Hash tb[MAX_TABLE] = { 0 };

    unsigned long hash(const char* str)
    {
        //djb2 hash func
        unsigned long hash = 5381; //수학자 결정한 수, 
        int c;

        while (c = *str++)
        {
            hash = (((hash << 5) + hash) + c) % MAX_TABLE;
        }

        return hash % MAX_TABLE;
    }

    int find(const char* key, int* data) //변경
    {
        unsigned long h = hash(key);
        int cnt = MAX_TABLE;

        while (tb[h].key[0] != 0 && cnt--)
        {
            if (strcmp(tb[h].key, key) == 0)
            {
                //strcpy(data, tb[h].data); //변경
                *data = tb[h].data;
                return 1;
            }
            h = (h + 1) % MAX_TABLE;
        }
        return 0;
    }

    int add(const char* key, int* data) //변경
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

        //strcpy(tb[h].data, data);
        tb[h].data = *data; //변경
        return 1;
    }
};

class HashTable_INT_To_INT {
public:
    static const int MAX_KEY = 64;
    static const int MAX_DATA = 128;
    static const int MAX_TABLE = 4096;

    typedef struct
    {
        //char key[MAX_KEY + 1];
        int key;
        //char data[MAX_DATA + 1]; //변경
        int data;
    }Hash;
    Hash tb[MAX_TABLE] = { 0 };

    unsigned long hash(int key)
    {
        key *= 13892;
        key *= 121156;

        return (unsigned int)key % MAX_TABLE;
    }

    int find(int key, int* data) //변경
    {
        unsigned long h = hash(key);
        int cnt = MAX_TABLE;

        while (tb[h].key != 0 && cnt--)
        {
            if (tb[h].key == key)
            {
                //strcpy(data, tb[h].data); //변경
                *data = tb[h].data;
                return 1;
            }
            h = (h + 1) % MAX_TABLE;
        }
        return 0;
    }

    int add(int key, int* data) //변경
    {
        unsigned long h = hash(key);

        while (tb[h].key != 0)
        {
            if (tb[h].key == key)
            {
                return 0;
            }

            h = (h + 1) % MAX_TABLE;
        }
        //strcpy(tb[h].key, key);
        tb[h].key = key;

        //strcpy(tb[h].data, data);
        tb[h].data = *data; //변경
        return 1;
    }
};

int main() {

    HashTable_String_To_INT ht1;

    int value = 6;
    ht1.add("BTS", &value);

    int ret = 0;
    ht1.find("BTS", &ret);

    cout << ret;

    HashTable_INT_To_INT ht2;

    int g = 22;
    ht2.add(5, &g);

    int tt = 0;
    ht2.find(5, &tt);
    cout << tt;
}
```