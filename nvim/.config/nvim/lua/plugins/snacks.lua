return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		dashboard = {
			width = 60,
			row = nil,
			col = nil,
			pane_gap = 4,
			autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
			preset = {
				pick = nil,
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				header = [[
				██╗  ██╗██████╗ ██████╗ ██╗   ██╗███████╗████████╗ ██████╗ ██████╗ ██╗ █████╗ ███╗   ██╗
				╚██╗██╔╝██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗██║██╔══██╗████╗  ██║
				 ╚███╔╝ ██████╔╝██║  ██║ ╚████╔╝ ███████╗   ██║   ██║   ██║██████╔╝██║███████║██╔██╗ ██║
				 ██╔██╗ ██╔══██╗██║  ██║  ╚██╔╝  ╚════██║   ██║   ██║   ██║██╔═══╝ ██║██╔══██║██║╚██╗██║
				██╔╝ ██╗██║  ██║██████╔╝   ██║   ███████║   ██║   ╚██████╔╝██║     ██║██║  ██║██║ ╚████║
				╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝    ╚═╝   ╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
		explorer = { enabled = true },
		indent = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
	},
	keys = {
		{
			"\\",
			function()
				local explorer = Snacks.picker.get({ source = "explorer" })[1]
				if explorer then
					explorer:close()
				else
					Snacks.explorer.reveal()
				end
			end,
			desc = "Toggle Explorer",
		},
	},
}
