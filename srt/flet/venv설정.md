---
created: 2024-12-22 13:06
updated: 2024-12-22 13:06
tags: []
alias: []
---

created: 2024-12-22 13:06
updated: 2024-12-22 13:06


mkdir first-flet-app
cd first-flet-app
python3 -m venv .venv
source .venv/bin/activate


이후, 이 폴더에서 "first-flet-app"
flet create srt_yoo_flet
등의 이름으로 프로젝트를 만들어 주어야 한다.

```bash
flet create srt_yoo_flet
```

만들어진 폴더 구조는 다음과 같다.

![[Pasted image 20241222131622.png | 500]]


main.py 를 다음과 같이 수정한 후 ,
```python
import flet as ft

def main(page: ft.Page):
    counter = ft.Text("0", size=50, data=0)

    def increment_click(e):
        counter.data += 3
        counter.value = str(counter.data)
        counter.update()

    page.floating_action_button = ft.FloatingActionButton(
        icon=ft.Icons.ADD, on_click=increment_click
    )
    page.add(
        ft.SafeArea(
            ft.Container(
                counter,
                alignment=ft.alignment.center,
            ),
            expand=True,
        )
    )


ft.app(main)

```

flet 프로젝트 폴더 안에서(여기서는 srt_yoo_flet) 다음의 명령을 수행하면,
앱이 실행된다.

```bash
flet run
```

![[Pasted image 20241222151938.png | 500]]