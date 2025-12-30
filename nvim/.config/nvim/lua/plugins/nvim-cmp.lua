return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	branch = "main",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"f3fora/cmp-spell",
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"roobert/tailwindcss-colorizer-cmp.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		local kind_icons = {
			Class = "",
			Color = "",
			Constant = "",
			Constructor = "",
			Enum = "",
			EnumMember = "",
			Event = "",
			Field = "",
			File = "",
			Folder = "",
			Function = "󰊕",
			Interface = "",
			Keyword = "",
			Method = "󰊕",
			Module = "",
			Operator = "",
			Property = "",
			Reference = "",
			Snippet = "",
			Struct = "",
			Text = "󰊄",
			TypeParameter = "",
			Unit = "",
			Value = "",
			Variable = "",
		}

		require("luasnip.loaders.from_vscode").lazy_load()

		-- Cmdline Setup (Outside main setup to ensure it works)
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = "buffer" } },
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline", option = { ignore_cmds = { "Man", "!" } } },
			}),
		})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			-- Matches your ghost_text = { enabled = false }
			experimental = { ghost_text = false },
			window = {
				completion = {
					-- Matches your winhighlight and scrollbar logic
					border = "rounded",
					scrollbar = true,
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
					-- Blink's "padding = 1" equivalent for CMP
					side_padding = 1,
				},
				documentation = {
					border = "rounded",
					scrollbar = true,
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				-- Ordering the fields to match: { Icon } { Label } { Kind Text } { Source }
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					-- 1. Icon (kind_icon)
					local icon = kind_icons[vim_item.kind] or " "

					-- 2. Source Name (matching the text = function(ctx) from your snippet)
					local source_name = ({
						nvim_lsp = "[LSP]",
						luasnip = "[Snippets]",
						buffer = "[Buffer]",
						path = "[Path]",
						cmdline = "[CMDLine]",
					})[entry.source.name] or string.format("(%s)", entry.source.name)

					-- 3. Combine Kind Text and Source for the right-hand side
					-- This replicates: { 'kind' }, { 'source_name' }
					vim_item.menu = string.format("%-10s %s", vim_item.kind, source_name)
					vim_item.kind = icon

					-- Matches width = { min = 15 } for label
					local label = vim_item.abbr
					if #label < 15 then
						vim_item.abbr = label .. string.rep(" ", 15 - #label)
					end

					return vim_item
				end,
			},
		})
	end,
}
