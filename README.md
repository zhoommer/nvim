# 💤 Neovim Configuration

A modern Neovim configuration built on [LazyVim](https://www.lazyvim.org/), featuring AI-powered development tools, comprehensive language support, and a carefully curated plugin ecosystem.

## ✨ Features

### 🤖 AI Integration
- **GitHub Copilot** - AI-powered code completion
- **Copilot Chat** - Interactive AI assistance
- **Claude Integration** - Advanced AI code assistance
- **MCP (Model Context Protocol)** - Extended AI capabilities

### 🛠️ Language Support
- Docker
- Java
- Markdown
- Prisma
- Python
- Svelte
- Vue

### 📦 Core Components
- **LSP (Language Server Protocol)** - Intelligent code completion and diagnostics
- **Treesitter** - Advanced syntax highlighting and code understanding
- **Custom UI** - Enhanced visual experience
- **Editor Enhancements** - Productivity-focused editor improvements
- **Coding Tools** - Development utilities and helpers

## 📁 Structure

```
nvim/
├── init.lua              # Entry point
├── lazy-lock.json        # Plugin version lock file
├── lazyvim. json          # LazyVim extras configuration
└── lua/
    ├── config/           # Core configuration
    ├── plugins/          # Plugin configurations
    │   ├── claude.lua
    │   ├── coding.lua
    │   ├── colorscheme.lua
    │   ├── editor.lua
    │   ├── lsp. lua
    │   ├── mcp.lua
    │   ├── treesitter.lua
    │   └── ui.lua
    ├── craftzdog/        # Custom utilities
    └── util/             # Helper functions
```

## 🚀 Installation

### Prerequisites
- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional, but recommended)
- Node.js (for Copilot and LSP servers)

### Quick Start

1. **Backup your existing configuration** (if any):
```bash
mv ~/.config/nvim ~/. config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

2. **Clone this repository**:
```bash
git clone https://github.com/zhoommer/nvim.git ~/. config/nvim
```

3. **Launch Neovim**:
```bash
nvim
```

Lazy. nvim will automatically install all plugins on first launch.

## ⚙️ Configuration

The configuration is organized into modular files under `lua/plugins/`:

- **`claude.lua`** - Claude AI integration settings
- **`coding.lua`** - Code completion and snippets
- **`colorscheme.lua`** - Theme configuration
- **`editor.lua`** - Editor behavior and features
- **`lsp.lua`** - Language server configurations
- **`mcp.lua`** - Model Context Protocol settings
- **`treesitter.lua`** - Syntax highlighting rules
- **`ui.lua`** - User interface customizations

## 🎨 Customization

To customize the configuration:

1. Edit files in `lua/plugins/` to modify plugin settings
2. Update `lazyvim.json` to add/remove LazyVim extras
3. Modify `lua/config/` for core settings

## 🔧 Requirements

### Optional Dependencies
- **ripgrep** - for telescope live grep
- **fd** - for telescope file finder
- **lazygit** - for git integration
- **GitHub CLI** - for Copilot authentication

Install on macOS:
```bash
brew install ripgrep fd lazygit gh
```

Install on Ubuntu/Debian:
```bash
sudo apt install ripgrep fd-find lazygit gh
```

## 📚 Resources

- [LazyVim Documentation](https://www.lazyvim.org/)
- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Plugin Manager](https://github.com/folke/lazy.nvim)

## 🤝 Contributing

Feel free to submit issues or pull requests if you have suggestions for improvements! 

## 📝 License

This configuration is available as open source under the terms of your choice. 

---

**Note**: This configuration is built on top of LazyVim, which provides a solid foundation with sensible defaults. The customizations focus on AI-powered development and multi-language support. 
