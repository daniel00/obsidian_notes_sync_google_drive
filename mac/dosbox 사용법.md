---
created: 2025-07-23 23:05:46 Wed
updated: 2025-07-23 23:05:46 Wed
tags: []
alias: []
---

created: 2025-07-23 23:05:46 Wed
updated: 2025-07-23 23:05:46 Wed

#### DOSBox 사용법

##### 1. 도스박스 설치

##### 2. mount c /Users/yoo/mydos/

##### 3. 전체화면 적용 cmd + option + enter
config파일에 아래 처럼 적용 해야 함.
- config 파일 경로 -  /Users/yoo/Library/Preferences/DOSBox 0.74-3-3 Preferences
- 변경내용

#### 4. 마운트 경로 저장
위 config파일의 아래처럼 등록
[autoexec]
mount c /Users/yoo/mydos/

| 항목                       | 설명                        |
| ------------------------ | ------------------------- |
| `fullscreen=true`        | 실행 시 전체화면으로 시작            |
| `fullresolution=desktop` | 현재 Mac 데스크탑 해상도에 맞춤       |
| `output=opengl`          | M1에서도 잘 작동하는 백엔드 출력 방식    |
| `aspect=true`            | 비율 유지 (찌그러짐 방지)           |
| `scaler=normal2x`        | 고해상도 화면에서 너무 작게 보이는 문제 해결 |
#### 한메타자 사용법
한메타자 리눅스용 다운로드
https://github.com/hamonikr/hanme-taja?tab=readme-ov-file

맥에서 deb 파일 설치 할 수 있도록 dpkg 설치
brew install dpkg



##### 도스박스 키맵
https://www.dosbox.com/wiki/Special_Keys
