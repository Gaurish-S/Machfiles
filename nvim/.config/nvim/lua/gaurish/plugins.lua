local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim"  -- Have packer manage itself
  use "nvim-lua/plenary.nvim"
  --themes
  use "luisiacc/gruvbox-baby"  
  use "rebelot/kanagawa.nvim"
  --cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer"-- buffer completions
  use "hrsh7th/cmp-path"-- path completions
  use "saadparwaiz1/cmp_luasnip"-- snippet completions
  use "hrsh7th/cmp-nvim-lsp"  
  use "hrsh7th/cmp-nvim-lua"
  --jdlts
  use "mfussenegger/nvim-jdtls"
  --dap
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "nvim-telescope/telescope-dap.nvim"
  --telescope
   use "nvim-telescope/telescope.nvim"
  --lsp plugins
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple LSP installer 
  --lualine
  use "nvim-lualine/lualine.nvim"
  --nvim tree
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua" 
  --snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  --treesitter
  use "nvim-treesitter/nvim-treesitter"
  --discord presence
  use "andweeb/presence.nvim"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
