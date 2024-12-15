---
title: 유니티 UI 화면
description: ""
preview: ""
publishedAt: 2024-02-17 01:34:21
tags:
  - all
date: 2024-02-26 00:35:58+0900
lastmod: 2024-05-01 18:39:14
layout: post
created: 2024-05-12 01:52.59
updated: 2024-05-22 20:56.28
---

## 연습을 통해 유니티 화면에 익숙해져 봅니다.


## Secne View. 씬뷰
게임을 구성하는 메인화면. 리소스를 배치해 화면을 구성한다.  

![main](/assets/main.png)  

## Game View.  게임뷰
게임을 실행했을때 보이는 화면.  
내가 테스트 할 때는 Game View가 검정화면 으로만 보였다. 
해결방법은 Scene - 우클릭 - Add Tab - Game을 하면 보였다.
이래도 해결이 안된다면, 카메라, 조명 등이 오브젝트를 잘 비추고 있는지 확인해 보시길.

![gameView](/assets/gameView.png)

## Hierarchy View. 하이어라키 뷰. 계층 뷰
씬에서 사용되는 오브젝트 이름을 목록으로 표시한다.  
프로젝트를 만들면 기본적으로 Main Camera와 Directional Light 오브젝트가 추가된다.

![hierarchy](/assets/hierarchy.png)

## 오브젝트 추가하기
Hierarchy View에서 추가한다.  
여기서는 3D 오브젝트중 Cube(정육면체)를 추가해 보겠다.

![addobj](/assets/addobj.png)

Hierarchy, Scene View 에 Cube가 추가되었다.
![addedobj](/assets/addedobj.png)

## 오브젝트 선택
* Secne View의 아이콘모음에서 "Move Tool"을 선택 한 후 오브젝트를 클릭하면 오브젝트가 선택된다.
* 또는 Hierarchy View에서 선택해도 된다.
![selobj2](/assets/selobj2.png)

## Inspector View 인스펙터 뷰
오브젝트가 선택되면 인스펙터 뷰에 오브젝트의 정보가 나타나고 수정 할 수 있다.
![inspector](/assets/inspector.png)

## 오브젝트를 뷰의 정가운데로 이동하기
 * Hierarchy View에서 오브젝트 선택 후 더블클릭
 * 오브젝트를 선택 한 후 Shift + f 를 누른다(대문자 F)

메인카메라를 선택 후 shift f 를 눌러서 씬뷰의 정 가운데로 이동시켰다.
![centerobj](/assets/centerobj.png)

shift f를 한번더 누르면 줌이 된다.
![zoomobj](/assets/zoomobj.png)


## Scene View에서 관찰자 시점 변경하는 방법
Scene 시점을 변경하면, 개발자가 보는 화면만 변경되는 것 뿐이지 실제 게임 화면이 변하는건 아니다.

* 줌 - 마우스 휠  
![zoom](/assets/zoom.gif)

* 시점 이동 - 손모양 아이콘 선택 후 드래그  
![move](/assets/move.gif)

* 시점 회전 - Alt + 드래그 (커서가 눈동자 모양으로 바뀐다)  
![rotate](/assets/rotate.gif)  

## 오브젝트 변경하기(크기, 위치, 회전)
오브젝트를 변경하면 실제 게임시 보여지는 화면이 변경된다.

* 오브젝트 이동   
  * 십자가 화살표 아이콘 선택 후 오브젝트 선택한 후 드래그하면 오브젝트가 이동된다.
  * 3축 화살표를 누르고 이동하면 X,Y,Z 각 축으로만 이동된다.  
![move object](/assets/move_obj.gif)  

* 오브젝트 회전   
  * 로테이션 아이콘 선택 후 각축 가이드 라인을 선택한 후 드래그 하면 오브젝트의 회전이 수행된다.  
![rotate object](/assets/rotate_obj.gif)  
  

* 오브젝트 크기변경   
  * Scale 아이콘 선택 후 각축 가이드 라인을 선택한 후 드래그 하면 오브젝트의 크기가 변경된다.  
![scale object](/assets/scale_obj.gif)  

test