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
		local lspkind = require("lspkind")
		local tailwind_formatter = require("tailwindcss-colorizer-cmp").formatter

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

		-- ENHANCEMENT: Smart Confirm Logic
		local confirm = function(entry)
			local behavior = cmp.ConfirmBehavior.Replace
			if entry then
				local completion_item = entry.completion_item
				local newText = completion_item.textEdit and completion_item.textEdit.newText
					or completion_item.insertText
					or completion_item.label
					or ""

				local diff_after = math.max(0, entry.replace_range["end"].character + 1) - entry.context.cursor.col
				if entry.context.cursor_after_line:sub(1, diff_after) ~= newText:sub(-diff_after) then
					behavior = cmp.ConfirmBehavior.Insert
				end
			end
			cmp.confirm({ select = true, behavior = behavior })
		end

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = "buffer" } },
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				-- ENHANCEMENT: Also search buffer in cmdline for faster commands
				{ name = "cmdline", option = { ignore_cmds = { "Man", "!" } } },
				{ name = "buffer", option = { max_item_count = 5 } },
			}),
		})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			experimental = { ghost_text = false },
			window = {
				completion = {
					border = "rounded",
					scrollbar = true,
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
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
				-- ENHANCEMENT: Use our smart confirm function
				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						confirm(cmp.get_selected_entry())
					else
						fallback()
					end
				end),
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
				{ name = "buffer", keyword_length = 3 },
				{ name = "path" },
				-- ENHANCEMENT: Spell check for Markdown/Text
				{ name = "spell", option = { keep_all_entries = false } },
			}),
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, vim_item)
					-- 1. Get base icons
					local icon = kind_icons[vim_item.kind] or ""
					vim_item.kind = string.format("%s %s", icon, vim_item.kind)

					-- 2. Source Names
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[Snippet]",
						buffer = "[Buffer]",
						path = "[Path]",
						spell = "[Spell]",
					})[entry.source.name] or string.format("[%s]", entry.source.name)

					-- 3. Alignment
					local label = vim_item.abbr
					if #label < 25 then
						vim_item.abbr = label .. string.rep(" ", 25 - #label)
					end
					vim_item.menu_hl_group = "Comment"

					-- 4. ENHANCEMENT: Apply Tailwind Colorizer
					return tailwind_formatter(entry, vim_item)
				end,
			},
		})
	end,
}
