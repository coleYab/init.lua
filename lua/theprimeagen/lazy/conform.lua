return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			format_on_save = function(bufnr)
				local ignore_filetypes = { "c", "cpp" }
				if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
					return
				end
				return {
					timeout_ms = 5000,
					lsp_format = "fallback",
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt" },
				odin = { "odinfmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				elixir = { "mix" },
			},
		})

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ bufnr = 0 })
		end)
	end,
}
