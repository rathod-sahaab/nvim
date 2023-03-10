-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use { 'nvim-treesitter/nvim-treesitter', run = { ':TSUpdate' } }
	use 'nvim-treesitter/playground'
	use 'theprimeagen/harpoon'
	use 'mbbill/undotree'

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	use("kylechui/nvim-surround")
	use {
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig"
	}
	use 'lewis6991/gitsigns.nvim'
	use "ahmedkhalf/project.nvim"
	use "folke/which-key.nvim"
	use "simrat39/symbols-outline.nvim"
	use "JoosepAlviste/nvim-ts-context-commentstring"
	use {
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	}
	use 'lewis6991/impatient.nvim'

	-- focus
	use {
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup {}
		end
	}
	use {
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	-- formatting
	use "jose-elias-alvarez/null-ls.nvim"
	use 'nmac427/guess-indent.nvim'

	-- debugging
	use 'mfussenegger/nvim-dap'
	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

	-- completion
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{ 'williamboman/mason.nvim' }, -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' }, -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	}
	use {
		"zbirenbaum/copilot.lua",
		event = 'VimEnter',
		config = function()
			vim.defer_fn(function()
				require('copilot').setup()
			end, 100)
		end,
	}
	use {
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end
	}
	-- colors
	use { "catppuccin/nvim", as = "catppuccin" }
	use { "ellisonleao/gruvbox.nvim" }
	use { 'rose-pine/neovim', as = 'rose-pine' }
	use {
		'ramojus/mellifluous.nvim',
		requires = { 'rktjmp/lush.nvim' },
	}
	use "savq/melange-nvim"
	-- appearance
	use "lukas-reineke/indent-blankline.nvim"
	use "p00f/nvim-ts-rainbow"
	-- view (menu, status-line, winbar, etc.)
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
	use {
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
		config = function()
			require("barbecue").setup({
				attach_navic = false
			})
		end,
	}
	use {
		'goolord/alpha-nvim',
		requires = { 'nvim-tree/nvim-web-devicons' },
	}
	use 'ggandor/leap.nvim'
	use {
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ 'nvim-telescope/telescope.nvim' },
		},
	}
	-- Lua
	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	}
end)
