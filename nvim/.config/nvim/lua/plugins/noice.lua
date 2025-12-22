return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- nvim-notify is removed from here because you are using snacks.notifier
	},
	opts = {
		lsp = {
			-- Suggested Setup: override markdown rendering so that cmp and other plugins use Treesitter
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		-- Suggested Setup: presets for a cleaner UI
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
		-- IMPORTANT: Disable Noice's notification handling to let Snacks take over
		notify = {
			enabled = false,
		},
		messages = {
			enabled = true, -- enables the Noice messages UI
			view = "notify", -- default view for messages
		},
		popupmenu = {
			enabled = true, -- enables the Noice popupmenu UI
			backend = "nui", -- backend to use to show regular cmdline completions
		},
	},
}
