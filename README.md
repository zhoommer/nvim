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
- **`coding.lua`** - Code completion, snippets, and autopairs
- **`colorscheme.lua`** - Theme configuration
- **`editor.lua`** - Editor behavior and features
- **`git.lua`** - Git integration with gitsigns
- **`lsp.lua`** - Language server configurations (TypeScript/ts_ls, CSS, HTML, Lua, etc.)
- **`mcp.lua`** - Model Context Protocol settings
- **`treesitter.lua`** - Syntax highlighting rules
- **`ui.lua`** - User interface customizations

## ⌨️ Custom Keybindings

### General Keybindings

| Key | Mode | Description |
|-----|------|-------------|
| `<Space>` | Normal | Leader key |
| `<Leader>sa` | Normal | Select all text |
| `<Leader>p` / `<Leader>P` | Normal/Visual | Paste from yank register (doesn't overwrite) |
| `<Leader>d` / `<Leader>D` | Normal/Visual | Delete without affecting registers |
| `<Leader>c` / `<Leader>C` | Normal/Visual | Change without affecting registers |
| `x` | Normal | Delete character without affecting registers |

### Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `<Tab>` | Normal | Next buffer/tab |
| `<S-Tab>` | Normal | Previous buffer/tab |
| `<C-j>` | Normal | Next diagnostic |
| `sh/sk/sj/sl` | Normal | Move between split windows |

### Window Management

| Key | Mode | Description |
|-----|------|-------------|
| `ss` | Normal | Split window horizontally |
| `sv` | Normal | Split window vertically |
| `te` | Normal | Open new tab |
| `<C-w><left/right/up/down>` | Normal | Resize window |

### Increment/Decrement (dial.nvim)

| Key | Mode | Description |
|-----|------|-------------|
| `<C-a>` | Normal | Increment number/date/boolean |
| `<C-x>` | Normal | Decrement number/date/boolean |
| `+` | Normal | Increment (alternative) |
| `-` | Normal | Decrement (alternative) |

### LSP & Code Actions

| Key | Mode | Description |
|-----|------|-------------|
| `<Leader>i` | Normal | Toggle inlay hints |
| `<Leader>r` | Normal | Replace hex colors with HSL |
| `:ToggleAutoformat` | Command | Toggle auto-formatting on save |

### Git (gitsigns)

| Key | Mode | Description |
|-----|------|-------------|
| `]h` | Normal | Next hunk |
| `[h` | Normal | Previous hunk |
| `<Leader>hs` | Normal/Visual | Stage hunk |
| `<Leader>hr` | Normal/Visual | Reset hunk |
| `<Leader>hS` | Normal | Stage buffer |
| `<Leader>hR` | Normal | Reset buffer |
| `<Leader>hu` | Normal | Undo stage hunk |
| `<Leader>hp` | Normal | Preview hunk |
| `<Leader>hb` | Normal | Blame line |
| `<Leader>hd` | Normal | Diff this |

### Cowboy Mode 🤠

This configuration includes a "cowboy mode" that discourages repeated use of `h`, `j`, `k`, `l`, `+`, `-` keys without counts. If you press these keys more than 10 times in a row, you'll see a friendly warning. This encourages using more efficient movement commands like:
- `w/b/e` for word movement
- `{/}` for paragraph movement  
- `gg/G` for file start/end
- `<number>j/k` for counted movements

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
