---
created: 2025-07-06 01:15:12 Sun
updated: 2025-07-06 01:15:12 Sun
tags: [exit code]
alias: []
---

created: 2025-07-06 01:15:12 Sun
updated: 2025-07-06 01:15:12 Sun

#### 리디렉션에 대해서 설명 합니다.


아래는 command 가 존재하는지 아닌지를 점검하는 쉘스크립트 입니다. 
if  문에서 command -v 로 쉘 스크립트 수행시 인자로 받은 CMD가 존재하는지를 판단하게 되는데 (command -v htop)
CMD가 존재하면 , exit code 0을 출력 합니다.


check_cmd.sh

```sh
#!/bin/bash

#if statement
CMD=$1

if command -v $CMD >/dev/null 2>&1; then   #exit code 0이 출력되어 true가 된다.
    echo "the command $CMD is exist"
else
	echo "the command $CMD is not exist"   #exit code 1이 출력되어 false가 된다.
fi
```


```bash
if command -v $CMD >/dev/null 2>&1; then   
```

bash 에서는 exit code 0 이 성공을 나타낸다!!!
exit 0 : success, true
exit 1 : fail, false

$? 변수에 exit code가 저장 된다.
아래 처럼 exit code를 확인 할 수 있다.

![[Pasted image 20250706013037.png | 500]]



if 문의 조건을 점검하는 방법이 여러개 있는데,

- 문자열에 내용이 있으면 true, 없으면 false로 점검 하는 방법

```sh
if [ "" ]; then
    echo "test.cpp exist"
else
    echo "test.cpp not exist"
fi
```

- 조건 검사 결과를 확인 하는 방식 : *0(참), 1(거짓)*
```sh
if [ -f "test.cpp" ]; then
    echo "test.cpp exist"
else
    echo "test.cpp not exist"
fi
```