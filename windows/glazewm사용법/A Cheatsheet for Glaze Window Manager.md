---
title: "A Cheatsheet for Glaze Window Manager"
source: "https://nulldocs.com/windows/glazewm-cheatsheet/"
author:
published: 2025-05-05
created: 2025-11-22
description: "This cheatsheet provides a concise yet comprehensive reference for using the Glaze Window Manager—from essential keybindings and layout commands to customization tips and configuration examples. Whether you're new to Glaze or just need a quick refresher, this guide is designed to help you navigate and streamline your tiling window management experience with confidence and ease."
tags:
  - "clippings"
---
Text copied to clipboard

---

#### GlazeWM Commands Cheatsheet

*All available commands and their default keybindings*

---

#### 🧭 Shifting Focus

| Action | Command | Keybinding |
| --- | --- | --- |
| Focus in direction | `focus --direction <DIRECTION>` | `Alt + h/j/k/l` |
| Cycle focus: tiling → floating → fullscreen | `wm-cycle-focus` | `Alt + Space` |
| Focus recent workspace | `focus --recent-workspace` | `Alt + '` |
| Focus next workspace | `focus --next-workspace` | `Alt + .` |
| Focus previous workspace | `focus --prev-workspace` | `Alt + ,` |
| Focus workspace by name | `focus --workspace <NAME>` | `Alt + <0-9>` |

---

#### 🧱 Moving Around

| Action | Command | Keybinding |
| --- | --- | --- |
| Move window in direction | `move --direction <DIRECTION>` | `Alt + Shift + h/j/k/l` |
| Move window to recent workspace | `move --recent-workspace` | `Alt + Shift + '` |
| Move window to next workspace | `move --next-workspace` | `Alt + Shift + .` |
| Move window to previous workspace | `move --prev-workspace` | `Alt + Shift + ,` |
| Move window to workspace | `move --workspace <NAME>` | `Alt + Shift + <0-9>` |
| Move workspace in direction | `move-workspace --direction <DIRECTION>` | `Alt + Shift + a/d` |

---

#### 🪟 Modifying Windows

| Action | Command | Keybinding |
| --- | --- | --- |
| Resize window | `resize --width <AMOUNT> --height <AMOUNT>` | `Alt + u/i/o/p` |
| Set exact window size | `size --width <AMOUNT> --height <AMOUNT>` |  |
| Close window | `close` | `Alt + Shift + q` |
| Ignore window | `ignore` |  |
| Resize window borders | `adjust-borders --left --right ...` |  |
| Toggle tiling direction | `toggle-tiling-direction` |  |
| Toggle floating state | `toggle-floating` | `Alt + Shift + Space` |
| Toggle minimized state | `toggle-minimized` | `Alt + -` |
| Toggle fullscreen state | `toggle-fullscreen` | `Alt + =` |
| Toggle tiling state | `toggle-tiling` | `Alt + t` |
| Change to floating state | `set-floating` |  |
| Change to minimized state | `set-minimized` |  |
| Change to fullscreen state | `set-fullscreen` |  |
| Change to tiling state | `set-tiling` |  |

---

#### ⚙️ General

| Action | Command | Keybinding |
| --- | --- | --- |
| Gracefully exit WM | `wm-exit` | `Alt + Shift + e` |
| Reload config | `wm-reload-config` | `Alt + Shift + r` |
| Redraw all windows | `wm-redraw` | `Alt + Shift + w` |
| Enable binding mode by name | `wm-enable-binding-mode --name <NAME>` |  |
| Disable binding mode by name | `wm-disable-binding-mode --name <NAME>` |  |
| Execute a shell command | `shell-exec <COMMAND...>` |  |

---

#### 🎹 Keybindings Overview

##### With Alt pressed:

- `h/j/k/l`: Focus window left/down/up/right
- `u/i/o/p`: Resize window
- `Space`: Cycle focus
- `'/.`, `,`: Focus workspaces
- `0–9`: Focus workspace by name
- `t`: Toggle tiling
- `-`: Toggle minimized
- `=`: Toggle fullscreen

##### With Alt + Shift pressed:

- `h/j/k/l`: Move window
- `'/.`, `,`: Move window to workspace
- `0–9`: Move window to workspace by name
- `a/d`: Move workspace left/right
- `Space`: Toggle floating
- `q`: Close window
- `e`: Exit WM
- `r`: Reload config
- `w`: Redraw windows

---

**Legend**:

- `<DIRECTION>` = `left`, `right`, `up`, `down`
- `<NAME>` = Workspace name or number
- `<AMOUNT>` = Pixel value or percentage