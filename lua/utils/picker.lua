local M = {}

function M.with_search_dirs(f)
  local on_confirm = function(input)
    local dirs = {}

    if input ~= nil and input ~= "" then
      for _, dir in ipairs(vim.split(input, " ", { trimempty = true })) do
        table.insert(dirs, dir)
      end
    else
      local dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
      table.insert(dirs, dir)
    end

    f(dirs)
  end

  vim.ui.input({ prompt = "Directories", completion = "file" }, on_confirm)
end

return M
