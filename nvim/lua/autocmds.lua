local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-------------------------------------- FilePost User Event (from NvChad) ------------------------------------------

-- User event that loads after UIEnter + only if file buf is there
-- This is used by plugins to lazy load on file open
autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = augroup("FilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name("FilePost")

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})

        if vim.g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end)
    end
  end,
})

-------------------------------------- Terminal Autocmds (your customizations) ------------------------------------------

-- Auto-enter insert mode when opening terminal
autocmd("TermOpen", {
  group = augroup("TerminalInsert", { clear = true }),
  callback = function()
    vim.cmd("startinsert")
  end,
})

-- Auto-enter insert mode when switching to terminal buffer
autocmd("WinEnter", {
  group = augroup("TerminalWinEnter", { clear = true }),
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd("startinsert")
    end
  end,
})

-------------------------------------- Cleanup on Quit (your customization) ------------------------------------------

-- Close everything before quitting
autocmd("QuitPre", {
  group = augroup("CleanupOnQuit", { clear = true }),
  callback = function()
    -- Close nvim-tree if open
    pcall(vim.cmd, "NvimTreeClose")

    -- Close all terminal buffers
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal" then
        pcall(vim.api.nvim_buf_delete, buf, { force = true })
      end
    end
  end,
})

-------------------------------------- Highlight on Yank ------------------------------------------

autocmd("TextYankPost", {
  group = augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-------------------------------------- Restore Cursor Position ------------------------------------------

autocmd("BufReadPost", {
  group = augroup("RestoreCursor", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-------------------------------------- Auto Resize Splits ------------------------------------------

autocmd("VimResized", {
  group = augroup("ResizeSplits", { clear = true }),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

