---
created: 2025-10-23 21:30:50 Thu
updated: 2025-10-23 21:30:50 Thu
tags: []
alias: []
---

created: 2025-10-23 21:30:50 Thu
updated: 2025-10-23 21:30:50 Thu

#### WSL에 개발폴더를 만들어서 터미널 반응 속도를 올리고, 이 폴더를 백업용으로 D드라이브 등에 동기화 시키는 방법을 정리 합니다.


###### 문제상황 
- D드라이브에 study폴더를 만들고 여기에 각종 개발 프로젝트 코드를 넣고 저장 하려고 했다.
- 근데 이 폴더에 git 폴더를  만들었더니 터미널 반응이 너무 느려졌다. 
- 검색해 보니, /mnt/d/ 드라이브 IO에 접근하면서 느려진다고 한다.
- 그래서 WSL의 시스템공간에 폴더를 넣으라고 했다.
- 그래서 이 문서를 남긴다.

##### 적용순서
 - D드라이브의 study 폴더를 WSL의 ~/study_in_wsl 로 복사
   cp -r /mnt/d/study/*  ~/study_in_wsl/
 -  rsync로 위 두개의 폴더를 동기화
 ```shell
	 #!/bin/bash
	
	# WSL 내부 작업 디렉터리
	SOURCE=~/study_in_wsl/
	
	# Windows D드라이브 백업 경로
	DEST=/mnt/d/yoo_data/study/
	
	# 로그 출력
	echo "백업 시작: $(date)"
	
	# rsync 실행
	rsync -avh --delete "$SOURCE" "$DEST"
	
	echo "백업 완료: $(date)"

 ```
	 
     crontab으로 자동화 해도 되지만 일단은 그냥 쉘 스크립트를 실행 시키는걸로 하자
	 
 - 프로그램 작업은 wsl의 경로에서 수행
 - 