require "nvchad.autocmds"

-- Auto-enter insert mode when switching to terminal buffer
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.cmd "startinsert"
  end,
})

vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd "startinsert"
    end
  end,
})

-- Close everything before quitting
vim.api.nvim_create_autocmd("QuitPre", {
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
