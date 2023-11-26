return require('packer').startup(function()
	use { 'andweeb/presence.nvim' }
	use {
  		'kyazdani42/nvim-tree.lua',
  		requires = {
    			'kyazdani42/nvim-web-devicons', -- optional, for file icons
  		},
  	tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use {
        	'nvim-treesitter/nvim-treesitter',
        	run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    	}	
end)
