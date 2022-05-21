return require("packer").startup(function()
	use("wbthomason/packer.nvim") --> packer plugin manager

	-->
    use("kyazdani42/nvim-web-devicons") --> enable icons
   	use("norcalli/nvim-colorizer.lua")
  	use("nvim-lualine/lualine.nvim") --> a statusline written in lua
  	use("romgrk/barbar.nvim") --> tabs for neovim
    use("kyazdani42/nvim-tree.lua") --> file explorer
--	use("akinsho/toggleterm.nvim")
	  use("nvim-lua/plenary.nvim")
	  use("nvim-telescope/telescope.nvim") --> Find, Filter, Preview, Pick. All lua, all the time.
    use("rcarriga/nvim-notify")
  	use("windwp/nvim-autopairs")
--
--	--> colorschemes
    use 'folke/tokyonight.nvim'
--
	--> treesitter & treesitter modules/plugins
  	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) --> treesitter
--	use("nvim-treesitter/nvim-treesitter-textobjects") --> textobjects
	  use("nvim-treesitter/nvim-treesitter-refactor")
--	use("p00f/nvim-ts-rainbow")
--	use("nvim-treesitter/playground")
--	use("JoosepAlviste/nvim-ts-context-commentstring")
--
--	--> lsp
    use("neovim/nvim-lspconfig") --> Collection of configurations for built-in LSP client
		use("williamboman/nvim-lsp-installer") --> Companion plugin for lsp-config, allows us to seamlesly install language servers
		use("jose-elias-alvarez/null-ls.nvim") --> inject lsp diagnistocs, formattings, code actions, and more ...
		use("onsails/lspkind-nvim") --> vscode-like pictograms for neovim lsp completion items
	
		  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

end)
