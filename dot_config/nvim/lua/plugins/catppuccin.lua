return { 
	"catppuccin/nvim", 
	name = "catppuccin", 
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			auto_integrations = true,
			color_overrides = {
			mocha = {
					base = "#111111",
					mantle = "#0d0d0d",
					crust = "#000000",
				},
			}
		})
		vim.cmd.colorscheme "catppuccin-mocha"
	end
}
