-- Normal Mode: Copy "@path:line"
vim.keymap.set("n", "<leader>cy", function()
  local path = vim.fn.expand("%:.")
  local line = vim.fn.line(".")
  local result = string.format("@%s:%s", path, line)
  vim.fn.setreg("+", result)
  vim.notify("Copied: " .. result)
end, { desc = "Copy @Path:Line" })

-- Visual Mode: Copy "@path:start-end" (same format as normal)
vim.keymap.set("v", "<leader>cy", function()
  local path = vim.fn.expand("%:.")
  local sline = vim.fn.line("v")
  local eline = vim.fn.line(".")

  -- Ensure sline is the smaller number
  if sline > eline then
    sline, eline = eline, sline
  end

  local result = string.format("@%s:%d-%d", path, sline, eline)

  vim.fn.setreg("+", result)
  vim.notify("Copied: " .. result)
end, { desc = "Copy @Path:Range" })
