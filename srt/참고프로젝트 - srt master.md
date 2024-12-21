---
created: 2024-12-16 00:28
updated: 2024-12-16 00:28
tags: []
alias: []
---

created: 2024-12-16 00:28
updated: 2024-12-16 00:28

이 프로젝트를 참고해서 만들어 보자.
아래의 login, logout, search_schedule 등을 참고해서 천천히 만들어 보자!
updated.... test



```python
SRT_MOBILE = "https://app.srail.or.kr:443"
API_ENDPOINTS = {
    "main": f"{SRT_MOBILE}/main/main.do",
    "login": f"{SRT_MOBILE}/apb/selectListApb01080_n.do",
    "logout": f"{SRT_MOBILE}/login/loginOut.do",
    "search_schedule": f"{SRT_MOBILE}/ara/selectListAra10007_n.do",
    "reserve": f"{SRT_MOBILE}/arc/selectListArc05013_n.do",
    "tickets": f"{SRT_MOBILE}/atc/selectListAtc14016_n.do",
    "ticket_info": f"{SRT_MOBILE}/ard/selectListArd02017_n.do?",
    "cancel": f"{SRT_MOBILE}/ard/selectListArd02045_n.do",
    "standby_option": f"{SRT_MOBILE}/ata/selectListAta01135_n.do",
    "payment": f"{SRT_MOBILE}/ata/selectListAta09036_n.do",
}

```

위 코드를 참고해 만든 로그인 코드 [[login]]
