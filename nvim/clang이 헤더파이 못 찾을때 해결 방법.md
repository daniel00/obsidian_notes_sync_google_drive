---
tags: .clangd
created: 2024-11-04 01:00.52
updated: 2024-11-30 17:44.12
---

creation date: 2024-11-30 17:20
modification date: Saturday 30th November 2024 17:20:06

#### 문제 현상
언제 부터인지 cpp 파일에서 헤더파일을 못 찾는다며 린트인지 lsp인지 모르지만 계속 빨간색으로 무시무시한 에러 메시지를 표시하였다.

![[Pasted image 20241130172612.png | 700]]


#### 해결방법
.clangd 파일을 아래 처럼 작성해서  프로젝트의 루프 폴더에 만들어 저장해 놓으니 에러를 뿜지 않는다.

.clangd 파일 - clangd 경로는 실제 경로를 확인해서 작성해 주어야 한다.

```txt
CompileFlags:
  Add: [-isystem, "/Library/Developer/CommandLineTools/SDKs/MacOSX14.4.sdk/usr/include/c++/v1/"]
```


.clangd 파일 적용 후에는 에러가 없다.
![[Pasted image 20241130174313.png | 700]]