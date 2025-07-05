---
created: 2025-07-06 01:15:12 Sun
updated: 2025-07-06 01:15:12 Sun
tags: []
alias: []
---

created: 2025-07-06 01:15:12 Sun
updated: 2025-07-06 01:15:12 Sun

#### 리디렉션에 대해서 설명 합니다.


아래는 command 가 존재하는지 아닌지를 점검하는 쉘스크립트 입니다. 
if  문에서 command -v 로 쉘 스크립트 수행시 인자로 받은 CMD가 존재하는지를 판단하게 되는데 (command -v htop)
CMD가 존재하면 , exit code 0을 출력 합니다.

bash 에서 exit code 0 이 


```sh
#!/bin/bash

#if statement
CMD=$1

if command -v $CMD >/dev/null 2>&1; then
    echo "the command $CMD is exist"
else
    echo "the command $CMD is not exist"
fi
```
