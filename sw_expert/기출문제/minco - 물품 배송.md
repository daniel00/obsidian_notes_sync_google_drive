---
title: minco | 물품 배송
source: https://pro.mincoding.co.kr/enterprise/contest/sdi/512/problem/SM03
author: 
published: 
created: 2024-11-08
description: 
tags:
  - clippings
updated: 2024-11-08 00:56.46
---
```
// *** main.cpp ***
#ifndef _CRT_SECURE_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS
#endif

#include <stdio.h>
#include <string.h>

#define ABS(x)    ((x) > 0 ? (x) : -(x))

static unsigned long long seed = 5;

static int pseudo_rand(void)
{
	seed = seed * 25214903917ULL + 11ULL;
	return (seed >> 16) & 0x3fffffff;
}

struct Coordinates
{
	int y;
	int x;
	Coordinates() {
		y = x = 0;
	}
	Coordinates(int _y, int _x) {
		y = _y;
		x = _x;
	}
	int operator-(Coordinates& param) {
		return ABS(y - param.y) + ABS(x - param.x);
	}
};

struct Product
{
	int id;
	int count;

	Product() {
		id = count = 0;
	}
	Product(int _id, int _count) {
		id = _id;
		count = _count;
	}
};

static const long long PENALTY = 1000000000000;

static int center_map[1000][1000];
static Coordinates center_coordinates_list[1000];
static Coordinates center_coordinates_list_bak[1000];
static Product center_product_list[1000][100];
static Product center_product_list_bak[1000][100];
static int center_product_size[1000];
static int center_product_size_bak[1000];

static Coordinates delivery_coordinates_list[1000000];
static Coordinates delivery_coordinates_list_bak[1000000];
static int delivery_order_list[1000000];
static int delivery_order_list_bak[1000000];

static int product_stock_count[10000];
static Coordinates truck_pos;
static int truck_package_list[50];
static int truck_package_count;

static long long SCORE = 0;

extern void sendCenterList(int, int, Coordinates[], Product[][100], int[]);
extern void sendDeliveryList(int, Coordinates[], int[]);
extern void solve(Coordinates);

int truckMove(int deliveryID)
{
	if (deliveryID < 0 || deliveryID >= 1000000)
		return 0;

	Coordinates dest_pos = delivery_coordinates_list[deliveryID];
	int dist = dest_pos - truck_pos;

	SCORE += dist * (100 + truck_package_count * 10);
	truck_pos = dest_pos;

	int& product_id = delivery_order_list[deliveryID];
	if (product_id == -1)
		return 0;

	for (int i = 0; i < truck_package_count; i++) {
		if (truck_package_list[i] == product_id) {
			product_id = -1;
			truck_package_list[i] = truck_package_list[truck_package_count - 1];
			truck_package_count -= 1;
			return 1;
		}
	}

	return 0;
}

int truckLoading(int centerID, int packageList[], int listSize)
{
	if (centerID < 0 || centerID >= 1000)
		return 0;

	Coordinates center_pos = center_coordinates_list[centerID];
	int dist = center_pos - truck_pos;

	SCORE += dist * (100 + truck_package_count * 10);
	truck_pos = center_pos;

	if (listSize + truck_package_count > 50)
		return 0;

	int ret = 0;

	for (int i = 0; i < listSize; i++) {
		for (int k = 0; k < center_product_size[centerID]; k++) {
			if (center_product_list[centerID][k].id == packageList[i] && center_product_list[centerID][k].count > 0) {
				center_product_list[centerID][k].count -= 1;
				truck_package_list[truck_package_count] = center_product_list[centerID][k].id;
				truck_package_count++;

				ret++;
				break;
			}
		}
	}

	return ret == listSize ? 1 : 0;
}

static bool run()
{
	memset(center_map, -1, sizeof(center_map));
	memset(product_stock_count, 0, sizeof(product_stock_count));

	truck_package_count = 0;

	for (int i = 0; i < 1000; i++) {
		int y, x;
		do {
			y = pseudo_rand() % 1000;
			x = pseudo_rand() % 1000;
		} while (center_map[y][x] != -1);

		center_map[y][x] = i;
		center_coordinates_list_bak[i] = center_coordinates_list[i] = Coordinates(y, x);

		int P = pseudo_rand() % 100 + 1;

		center_product_size_bak[i] = center_product_size[i] = P;

		for (int j = 0; j < P; j++) {
			Product new_product = Product(pseudo_rand() % 10000, pseudo_rand() % 100 + 1);
			center_product_list_bak[i][j] = center_product_list[i][j] = new_product;
			product_stock_count[new_product.id] += new_product.count;
		}
	}

	for (int i = 0; i < 1000000; i++) {
		int id;
		do {
			id = pseudo_rand() % 10000;
		} while (product_stock_count[id] == 0);

		delivery_coordinates_list_bak[i] = delivery_coordinates_list[i] = Coordinates(pseudo_rand() % 1000, pseudo_rand() % 1000);
		delivery_order_list_bak[i] = delivery_order_list[i] = id;

		product_stock_count[id] -= 1;
	}

	truck_pos = Coordinates(pseudo_rand() % 1000, pseudo_rand() % 1000);

	sendCenterList(1000, 10000, center_coordinates_list_bak, center_product_list_bak, center_product_size_bak);
	sendDeliveryList(1000000, delivery_coordinates_list_bak, delivery_order_list_bak);
	solve(truck_pos);

	for (int i = 0; i < 1000000; i++) {
		if (delivery_order_list[i] >= 0)
			return false;
	}

	return true;
}

int main()
{
	setbuf(stdout, NULL);

	if (run() == false) {
		//printf("SCORE: %lld\n", PENALTY);
		SCORE = PENALTY;
		return 0;
	}

	//printf("SCORE: %lld\n", SCORE);

	// 실제 시험의 커트라인과 오차가 있을 수 있습니다.
	if (SCORE < 13000000000) {
		puts("PASS");
	}
	else {
		puts("FAIL");
	}

	return 0;
}
```