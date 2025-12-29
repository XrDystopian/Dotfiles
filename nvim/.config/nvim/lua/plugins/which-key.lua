return {
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		opts = {
			-- 'classic', 'modern', or 'helix'
			preset = "modern",
			-- Delay before showing the popup.
			-- 0 for plugins (like marks), 200ms for regular keymaps
			delay = function(ctx)
				return ctx.plugin and 0 or 200
			end,

			icons = {
				mappings = vim.g.have_nerd_font,
				-- If using Nerd Font, these icons will represent the physical keys
				keys = vim.g.have_nerd_font and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
				},
			},

			-- Built-in plugins to help with Neovim primitives
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT
				spelling = {
					enabled = true, -- z= will show suggestions in which-key
					suggestions = 20,
				},
				presets = {
					operators = true, -- help for d, y, etc.
					motions = true, -- help for motions
					text_objects = true, -- help for objects like i(, at, etc.
					windows = true, -- <c-w> window bindings
					nav = true, -- misc window navigation
					z = true, -- fold/spell bindings
					g = true, -- common g-prefixed bindings
				},
			},

			-- Window styling
			win = {
				border = "single", -- none, single, double, shadow
				padding = { 1, 2 }, -- [top/bottom, right/left]
				title = true,
				title_pos = "center",
			},

			-- Document your custom key chains
			spec = {
				{ "<leader>c", group = "[C]ode", mode = { "n", "x" } },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>g", group = "[G]it" },
				{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>w", group = "[W]orkspace" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
