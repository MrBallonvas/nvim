return {
    "folke/which-key.nvim",
    {"folke/neoconf.nvim", cmd = "Neoconf"},
    {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
},
    "folke/neodev.nvim",
    {
        "nvim-treesitter/nvim-treesitter"
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            local status_ok, npairs = pcall(require, "nvim-autopairs")
            if not status_ok then
                return
            end
            npairs.setup {
                check_ts = true,
                ts_config = {
                    lua = {"string", "source"},
                    javascript = {"string", "template_string"},
                    java = false
                },
                disable_filetype = {"TelescopePrompt", "spectre_panel"},
                fast_wrap = {
                    map = "<M-e>",
                    chars = {"{", "[", "(", '"', "'"},
                    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                    offset = 0,
                    end_key = "$",
                    keys = "qwertyuiopzxcvbnmasdfghjkl",
                    check_comma = true,
                    highlight = "PmenuSel",
                    highlight_grey = "LineNr"
                }
            }

            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            local cmp_status_ok, cmp = pcall(require, "cmp")
            if not cmp_status_ok then
                return
            end
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {map_char = {tex = ""}})
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {}
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000
                    }
                },
                sections = {
                    lualine_a = {"mode"},
                    lualine_b = {"branch", "diff", "diagnostics"},
                    lualine_c = {"filename"},
                    lualine_x = {"encoding", "fileformat", "filetype"},
                    lualine_y = {"progress"},
                    lualine_z = {"location"}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {"filename"},
                    lualine_x = {"location"},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
    },
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {},
        version = "^1.0.0"
    },
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
        config = function()
            require("Comment").setup(
                {
                    ---Add a space b/w comment and the line
                    padding = true,
                    ---Whether the cursor should stay at its position
                    sticky = true,
                    ---Lines to be ignored while (un)comment
                    ignore = nil,
                    ---LHS of toggle mappings in NORMAL mode
                    toggler = {
                        ---Line-comment toggle keymap
                        line = "<Leader>.",
                        ---Block-comment toggle keymap
                        block = "gbc"
                    },
                    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                    opleader = {
                        ---Line-comment keymap
                        line = "gc",
                        ---Block-comment keymap
                        block = "gb"
                    },
                    ---LHS of extra mappings
                    extra = {
                        ---Add comment on the line above
                        above = "gcO",
                        ---Add comment on the line below
                        below = "gco",
                        ---Add comment at the end of line
                        eol = "gcA"
                    },
                    ---Enable keybindings
                    ---NOTE: If given `false` then the plugin won't create any mappings
                    mappings = {
                        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                        basic = true,
                        ---Extra mapping; `gco`, `gcO`, `gcA`
                        extra = true
                    },
                    ---Function to call before (un)comment
                    pre_hook = nil,
                    ---Function to call after (un)comment
                    post_hook = nil
                }
            )
        end
    },
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim', build = ':MasonUpdate' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
		{ 'wakatime/vim-wakatime', lazy = false },
		{
			'mhartington/formatter.nvim',
			config = function()
				-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

      -- You can also define your own configuration
      function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}
			end
		}
}
