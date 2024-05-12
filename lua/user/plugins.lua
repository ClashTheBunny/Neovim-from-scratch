local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" })
	use({ "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" })
	use({ "kyazdani42/nvim-tree.lua", commit = "c995ce087875ec5d4df51520b1e9cb09a4b51725" })
	use({ "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" })
	-- use({ "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" })
	use({ "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" })
	use({ "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" })
	-- use({ "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" })
	-- use("folke/which-key.nvim")
  use ({ "nvim-lua/popup.nvim" }) -- An implementation of the Popup API from vim in Neovim
  use ({ "antoinemadec/FixCursorHold.nvim" }) -- This is needed to fix lsp doc highlight
  use ({ "jeetsukumaran/vim-indentwise" }) -- Indent-based movement
  -- use ({ "jlanzarotta/bufexplorer" }) -- Easily switch between buffers

  -- Vimux and testing support
  use ({ "preservim/vimux" }) -- vim-tmux integration, for things like running tests
  use ({ "vim-test/vim-test" })

	-- Colorschemes
  use { "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" }
  use { "lunarvim/darkplus.nvim", commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" }
  use ({ "lunarvim/colorschemes" }) -- A bunch of colorschemes you can try out
  use ({ "lifepillar/vim-solarized8" })
  use ({ "NLKNguyen/papercolor-theme" })
  use ({ "owickstrom/vim-colors-paramount" })
  use ({ "preservim/vim-colors-pencil" })
  use ({ "tomasr/molokai" })
  use ({ "sickill/vim-monokai" })
  use ({ "joshdick/onedark.vim" })
  use ({ "artanikin/vim-synthwave84" })
  use ({ "TroyFletcher/vim-colors-synthwave" })
  use {
    "sonph/onehalf",
    rtp = "vim",
    -- config = function()
    --   vim.cmd [[colorscheme onehalfdark]]
    -- end,
    -- event = "VimEnter",
  }

	-- Cmp 
  use { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
	use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
	use { "hrsh7th/cmp-nvim-lsp", commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" }
	use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
  use ({ "hrsh7th/cmp-cmdline" }) -- cmdline completions
  use ({ "hrsh7th/vim-vsnip" })
  use ({ "hrsh7th/vim-vsnip-integ" })

	-- Snippets
  use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use

	-- LSP
	use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12"} -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" }
	use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298" }

	-- Telescope
  if vim.fn.has('nvim-0.9') == 1 then
    use { "nvim-telescope/telescope.nvim" }
    use { "wbthomason/packer.nvim" }  -- Have packer manage itself
  else
    use { "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" }
    use { "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" }  -- Have packer manage itself
  end
  use({ "nvim-telescope/telescope-ui-select.nvim" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = 'make' })
  use({ "axkirillov/easypick.nvim", commit = "3f6af7b34eca30b81a8090ea6e5aa56212f8e746" })
  use ({ "mileszs/ack.vim" })

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		commit = "226c1475a46a2ef6d840af9caa0117a439465500",
	}
  use("rodjek/vim-puppet")

	-- Git
	use { "lewis6991/gitsigns.nvim", commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2" }

  use ({ "tpope/vim-fugitive" })
  use ({ "tpope/vim-abolish" })
  use ({ "pgr0ss/vim-github-url" })
  use ({ "tpope/vim-unimpaired" })
  use ({ "jlfwong/vim-mercenary" })
  use ({ "mhinz/vim-signify" })

  -- GhostText --
  use {
    'raghur/vim-ghost',
    run = ':GhostInstall'
  }
  use {"ellisonleao/glow.nvim", branch = 'main'}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
