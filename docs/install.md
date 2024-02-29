# 🚀 Installation

[Home](readme.md) / Installation

- Install the required packages and font

    ```sh
    brew install neovim fzf ripgrep php iterm2
    brew tap homebrew/cask-fonts
    brew install font-jetbrains-mono-nerd-font
    ```

- Set font in iTerm2

    `Preferences -> Profiles -> Text -> Font`

- Allow use ⌥ as meta key

    `Preferences -> Profiles -> Keys` in `Left Option key` choose `Meta`
    
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

