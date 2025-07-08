---
created: 2025-07-09 00:08:37 Wed
updated: 2025-07-09 00:08:37 Wed
tags: []
alias: []
---

created: 2025-07-09 00:08:37 Wed
updated: 2025-07-09 00:08:37 Wed

####  nvim에서 copilot 로그인 하는 방법

lazyvim 에서 copilot를 사용하는데, 로그인해서 사용하는 방법?


  Copilot ───

LazyVim에서 GitHub Copilot을 사용하려면, copilot.nvim 플러그인을 설치한 뒤 GitHub 계정으로 로그인해야 합니다. 로그인 방법은 다음과 같습니다:

1. Neovim에서 아래 명령어를 입력하세요:
```
:Copilot auth
```

2. 터미널에 표시되는 GitHub 인증 URL을 복사해 웹 브라우저에 붙여넣고, 안내에 따라 로그인 및 인증을 완료하세요.

3. 인증이 완료되면 Neovim에 "Authentication successful" 메시지가 표시됩니다.

이제 Copilot 기능을 사용할 수 있습니다.



####  copilot 계정 변경 하는 방법

- /Users/yoo/.config/github-copilot/apps.json 파일을 삭제하고 (rm app.json)
- nvim을 종료 후 재시작 한다.
- :Copilot auth를 입력하면,
- 8자리 코드가 뜨고, 그 아래에는 github copilot device 인증 링크가 뜬다.
- 해당 링크를 복사해서 웹브라우저에서 열면, 인증코드를 입력하라고 나온다.
- 위 8자리 코드를 복사해서 붙여 넣기 하면 된다.
- :Copilot auth 로 계정을 확인해 보면 된다.


