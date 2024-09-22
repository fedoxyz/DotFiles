local M = {}

M.open_nvim_in_current_explorer_dir = function()
  local current_dir
    if vim.bo.filetype == "netrw" then
      current_dir = vim.b.netrw_curdir
    else
      -- If not in a Netrw buffer, use the current file's directory
      current_dir = vim.fn.expand("%:p:h")
    end

  local terminal_cmd = "terminator"  -- Change this to your preferred terminal emulator
  
  -- Escape spaces in the path
  current_dir = current_dir:gsub(" ", "\\ ")
 
  local cmd = string.format("%s -e 'cd %s && nvim .; exec $SHELL'", terminal_cmd, current_dir)
  vim.fn.system(cmd)
end

return M
