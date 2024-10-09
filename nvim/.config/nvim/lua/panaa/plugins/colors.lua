-- Sidenote since i'm using alacritty there is close to no changes 
-- when it comes to the terminal with this plugin
function InitColor(color)
	color = color or "nightfox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		config = function()
			require("nightfox").setup({
				options = {
					styles = {
						comments = "italic",
						keywords = "bold",
						types = "italic,bold",
					},
				},
			})
			InitColor()
		end,
	},
}
