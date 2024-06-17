-- return {
--         "ellisonleao/gruvbox.nvim",
--         priority = 1000,
--         config = function()
--             require("gruvbox").setup(
--                 {
--                     terminal_colors = true,
--                     undercurl = true,
--                     underline = true,
--                     bold = true,
--                     italic = {
--                         strings = true,
--                         emphasis = true,
--                         comments = true,
--                         operators = false,
--                         folds = true
--                     },
--                     strikethrough = true,
--                     invert_selection = false,
--                     invert_signs = false,
--                     invert_tabline = false,
--                     invert_intend_guides = false,
--                     inverse = true,
--                     contrast = "",
--                     palette_overrides = {},
--                     overrides = {},
--                     dim_inactive = false,
--                     transparent_mode = false
--                 }
--             )
--             vim.cmd("colorscheme gruvbox")
--         end

return {
	'xiyaowong/transparent.nvim',
	config = function()
		require("transparent").setup({ -- Optional, you don't have to run setup.
			groups = { -- table: default groups
				'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
				'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
				'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
				'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
				'EndOfBuffer',
			},
			extra_groups = {}, -- table: additional groups that should be cleared
			exclude_groups = {}, -- table: groups you don't want to clear
		})
	end
}
