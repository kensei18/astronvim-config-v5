local maps = {
  -- first key is the mode
  n = {
    L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
    H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

    ["<Leader>pr"] = { ":Lazy restore<cr>", desc = "Plugins Restore" },

    ["zg"] = { function() require("utils.cspell").append() end },
    -- Leader * 2
    ["<Leader><Leader>"] = { name = "Next Menu" },

    -- save
    ["<Leader>w"] = { ":wa<cr>", desc = "Save all" },

    -- quit
    ["<Leader>Q"] = { ":qa<cr>", desc = "Quit all" },

    -- snacks
    ["gr"] = { function() Snacks.picker.lsp_references() end, desc = "LSP References" },
    ["<Leader>lD"] = {
      function() Snacks.picker.diagnostics { severity = vim.diagnostic.severity.WARN } end,
      desc = "Search Diagnostics",
    },
    ["<Leader>bb"] = {
      function() Snacks.picker.buffers() end,
      desc = "Find Buffers",
    },

    -- oil
    ["<Leader>o"] = { ":Oil<cr>", desc = "Oil file explorer" },

    -- buffer
    ["<Leader>bt"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<Leader><Leader>f"] = {
      function() require("buffer_manager.ui").toggle_quick_menu() end,
      desc = "Manage buffers",
    },

    -- sessions
    ["<Leader>r"] = { function() require("resession").load(nil, { dir = "dirsession" }) end, desc = "Load a session" },

    -- GUI font size
    ["<C-_>"] = {
      function()
        GuiFontSize = GuiFontSize + 1
        vim.opt.guifont = { GuiFontName, ":h" .. GuiFontSize }
      end,
      desc = "Increment Font Size",
    },
    ["<C-->"] = {
      function()
        GuiFontSize = GuiFontSize - 1
        vim.opt.guifont = { GuiFontName, ":h" .. GuiFontSize }
      end,
      desc = "Decrement Font Size",
    },

    -- todo-comments
    ["<Leader>fT"] = { function() Snacks.picker.todo_comments() end, desc = "Find TODO" },
    ["]T"] = { function() require("todo-comments").jump_next() end, desc = "Next TODO" },
    ["[T"] = { function() require("todo-comments").jump_prev() end, desc = "Previous TODO" },

    -- neotest
    ["<Leader><Leader>t"] = { name = "Test" },
    ["<Leader>T"] = { function() require("neotest").summary.toggle() end, desc = "Test summary" },
    ["<Leader><Leader>ts"] = { function() require("neotest").summary.toggle() end, desc = "Test summary" },
    ["<Leader><Leader>tt"] = {
      function()
        require("neotest").run.run()
        require("neotest").summary.open()
      end,
      desc = "Run nearest test",
    },
    ["<Leader><Leader>td"] = {
      function()
        require("neotest").run.run { strategy = "dap" }
        require("neotest").summary.open()
      end,
      desc = "Debug nearest test",
    },

    -- refactoring
    ["<Leader><Leader>r"] = { name = "Refactoring" },
    ["<Leader><Leader>ri"] = { ":Refactor inline_var<cr>", desc = "Inline var" },
    ["<Leader><Leader>rb"] = { ":Refactor extract_block ", desc = "Extract block" },
    ["<Leader><Leader>rf"] = { ":Refactor extract_block_to_file ", desc = "Extract block to file" },

    -- diffview
    ["<Leader><Leader>v"] = {
      function()
        if next(require("diffview.lib").views) == nil then
          vim.ui.input({ prompt = "git-rev" }, function(input)
            if input ~= nil and input ~= "" then
              vim.cmd("DiffviewOpen " .. input)
            else
              vim.cmd "DiffviewOpen"
            end
          end)
        else
          vim.cmd "DiffviewClose"
        end
      end,
      desc = "Diffview",
    },

    -- open-browser-github
    ["<Leader>go"] = { ":OpenGithubFile<cr><cr>", desc = "Open in Github" },
    ["<Leader>gP"] = { ":OpenGithubPullReq<cr><cr>", desc = "Open Pull Request" },
    ["<Leader>gB"] = { ":!gh browse<cr><cr>", desc = "Browse Github" },

    ["<Leader>gR"] = { require("utils.github").browse_repo, desc = "Open repo in browser" },

    -- blame
    -- ["<Leader>gb"] = { ":BlameToggle virtual<cr>", desc = "Toggle virtual blame" },
    ["<Leader>gb"] = { ":BlameToggle window<cr>", desc = "Toggle blame" },

    -- Telescope with search_dirs
    ["<Leader>fd"] = { name = "With directories" },
    ["<Leader>fdf"] = {
      function()
        local f = function(dirs) Snacks.picker.files { dirs = dirs } end
        require("utils.picker").with_search_dirs(f)
      end,
      desc = "Find files",
    },
    ["<Leader>fdF"] = {
      function()
        local f = function(dirs) Snacks.picker.files { dirs = dirs, ignored = true, hidden = true } end
        require("utils.picker").with_search_dirs(f)
      end,
      desc = "Find all files",
    },
    ["<Leader>fdw"] = {
      function()
        local f = function(dirs) Snacks.picker.grep { dirs = dirs } end
        require("utils.picker").with_search_dirs(f)
      end,
      desc = "Find words",
    },
    ["<Leader>fdW"] = {
      function()
        local f = function(dirs) Snacks.picker.grep { dirs = dirs, ignored = true, hidden = true } end
        require("utils.picker").with_search_dirs(f)
      end,
      desc = "Find words in all files",
    },

    -- move
    ["<C-S-j>"] = { ":MoveLine(1)<CR>" },
    ["<C-S-k>"] = { ":MoveLine(-1)<CR>" },
    ["<C-S-h>"] = { ":MoveHChar(-1)<CR>" },
    ["<C-S-l>"] = { ":MoveHChar(1)<CR>" },

    -- lspsaga
    -- ["gp"] = { name = "Goto Preview" },
    ["gd"] = { ":Lspsaga goto_definition<CR>", desc = "Goto Definition" },
    ["gD"] = { ":Lspsaga peek_definition<CR>", desc = "Definition Preview" },
    ["gR"] = { ":Lspsaga finder ref<CR>", desc = "References Preview" },
    ["<Leader>lS"] = { ":Lspsaga outline<CR>", desc = "Symbols outline" },
    -- ["gpt"] = { ":Lspsaga peek_type_definition<CR>", desc = "Goto Preview Type Definition" },

    -- no neck pain
    ["<Leader>n"] = { desc = "No neck pain" },
    ["<Leader>nn"] = { ":NoNeckPain<cr>", desc = "Toggle" },
    ["<Leader>nr"] = { ":NoNeckPainToggleRightSide<cr>", desc = "Toggle Right Side" },
    ["<Leader>nl"] = { ":NoNeckPainToggleLeftSide<cr>", desc = "Toggle Left Side" },
    ["<Leader>nu"] = { ":NoNeckPainWidthUp<cr>", desc = "Increase the width" },
    ["<Leader>nd"] = { ":NoNeckPainWidthDown<cr>", desc = "Decrease the width" },
  },
  x = {
    ["<Leader>g"] = { desc = require("astroui").get_icon("Git", 1, true) .. "Git" },
    ["<Leader><Leader>"] = { name = "Next Menu" },

    -- refactoring
    ["<Leader><Leader>r"] = { name = "Refactoring" },
    ["<Leader><Leader>ri"] = { ":Refactor inline_var<cr>", desc = "Inline var" },
    ["<Leader><Leader>re"] = { ":Refactor extract ", desc = "Extract" },
    ["<Leader><Leader>rv"] = { ":Refactor extract_var ", desc = "Extract var" },
    ["<Leader><Leader>rf"] = { ":Refactor extract_to_file ", desc = "Extract to file" },

    -- open-browser-github
    ["<Leader>go"] = { ":OpenGithubFile<cr><cr>", desc = "Open in Github" },

    -- move
    ["<C-S-j>"] = { ":MoveBlock(1)<CR>" },
    ["<C-S-k>"] = { ":MoveBlock(-1)<CR>" },
    ["<C-S-h>"] = { ":MoveHBlock(-1)<CR>" },
    ["<C-S-l>"] = { ":MoveHBlock(1)<CR>" },

    -- diff with clipboard
    ["<Leader>c"] = {
      function() require("utils.diff").compare_to_clipboard() end,
      desc = "Diff from clipboard",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-p>"] = { function() vim.lsp.buf.signature_help() end, desc = "Signature Help" },
    -- ["<C-o>"] = { "<ESC>o" },
    -- ["<C-i>"] = { "<ESC>O" },
  },
}

maps.n["<C-p>"] = { '"0p' }
maps.x["<C-p>"] = { '"0p' }

if vim.fn.executable "lazydocker" == 1 then
  maps.n["<Leader>D"] = { require("utils.docker").open_lazydocker, desc = "ToggleTerm lazydocker" }
end

if vim.fn.executable "lazygit" == 1 then
  maps.n["<Leader>gg"] = {
    function()
      require("astrocore").toggle_term_cmd {
        cmd = "lazygit",
        direction = "float",
        -- on_close = function() vim.api.nvim_command "bufdo edit" end,
      }
    end,
    desc = "ToggleTerm lazygit",
  }
end

local aiMaps = {
  ["<Leader>a"] = { name = "AI" },
}

for k, v in pairs(aiMaps) do
  maps.n[k] = v
  maps.x[k] = v
end

return maps
