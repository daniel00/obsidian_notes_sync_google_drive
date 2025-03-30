---
created: 2025-03-30 17:52
updated: 2025-03-30 17:52
tags: []
alias: []
---

created: 2025-03-30 17:52
updated: 2025-03-30 17:52

#### vim-easymotion 을  lazyvim 에 설치해서 사용하는 방법

 ###### 일단 disabled.lua 파일에 "flash"를 disable 한다.

그리고, 아래의 코드를 easymotion.lua 파일에 작성한다.

이 코드는 , easymotion 과 lsp의 충돌로 인한 깜박임 방지코드를 포함하고 있다.


```lua
return {
  "easymotion/vim-easymotion",
  config = function()
    -- EasyMotion 설정 (추가로 원하는 설정이 있으면 여기에 추가)
    vim.api.nvim_set_keymap("n", "s", "<Plug>(easymotion-s)", {})
    -- vim.api.nvim_set_keymap('n', 's', '<Plug>(easymotion-bd-f)', {})
    -- vim.api.nvim_set_keymap('n', '<Leader>f', '<Plug>(easymotion-overwin-f)', {})
    -- vim.api.nvim_set_keymap('n', '<Leader>l', '<Plug>(easymotion-lineforward)', {})
    -- vim.api.nvim_set_keymap('n', '<Leader>h', '<Plug>(easymotion-linebackward)', {})

    ------------------------------------------------------------------------------------------------------
    -- easymotion이 lsp와 충돌해서 lsp error 상태로 가는 깜박임 현상 방지
    vim.api.nvim_create_autocmd("User", {
      pattern = { "EasyMotionPromptBegin" },
      callback = function()
        vim.diagnostic.disable()
      end,
    })
    function check_easymotion()
      local timer = vim.loop.new_timer()
      timer:start(
        500,
        0,
        vim.schedule_wrap(function()
          -- vim.notify("check_easymotion")
          if vim.fn["EasyMotion#is_active"]() == 0 then
            vim.diagnostic.enable()
            vim.g.waiting_for_easy_motion = false
          else
            check_easymotion()
          end
        end)
      )
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "EasyMotionPromptEnd",
      callback = function()
        if vim.g.waiting_for_easy_motion then
          return
        end
        vim.g.waiting_for_easy_motion = true
        check_easymotion()
      end,
    })
    ------------------------------------------------------------------------------------------------------
  end,
}

```