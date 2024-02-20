<div align="center">
    <img src="https://https://raw.githubusercontent.com/nechaev/StormVim/master/screenshots/stormvim.png?raw=true"/>
</div>

<hr/>

StormVim is a Neovim configuration, oriented for web development in php, html, css, javascript.
Based on [LazyVim](https://github.com/LazyVim/LazyVim). Inspired by PhpStorm. Built for MacOS.
I made it for myself, but maybe it will be useful to someone else.

## ✨ Features

- 🌜 100% on Lua
- 💡 IDE Features: LSP, snippets, autocomplete, go to definition, go to references, etc.
- 🎨 Reproduction of the official JetBrains IDE Darcula theme

## ⚡️ Requirements

- Neovim >= 0.9
- [FZF](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [NerdFonts](https://www.nerdfonts.com) (JetBrainsMono Nerd Font)
- PHP
- Terminal that supports ligatures for proper representation (I use [iTerm2](https://iterm2.com))

## 🚀 Installation

- Make a backup of your current Neovim files:

  ```sh
  mv ~/.config/nvim ~/.config/nvim.bak
  mv ~/.local/share/nvim ~/.local/share/nvim.bak
  ```

- Clone the repository

  ```sh
  git clone https://github.com/nechaev/StormVim ~/.config/nvim
  ```

- Start Neovim!

  ```sh
  nvim
  ```

