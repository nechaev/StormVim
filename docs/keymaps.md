# ⌨️  Keymaps

[Home](readme.md) / Keymaps

> [!NOTE]
> StormVim use which-key.nvim to help you remember keymaps. Just press any key like `<Space>` and you'll see a popup with all possible keymaps starting with `<Space>`.

Use the combination `<space>` `?` to view the available keymaps in the editor.

<details>
  <summary><i>Click to see the features of key combinations and modes</i></summary>

  | Combination | Example | Description |
  | --- | --- | --- |
  | `<key>` + `<key>` | `⌃` + `g` | press the `Ctrl` key and the `g` key without releasing `Ctrl` |
  | `<key>` `<key>` | `<Space>` `h` | press these keys one after the other, releasing the previous one |
  
  | Shortcut | Keyboard key | | Short-Name | Mode name |
  | --- | --- | --- | :---: | --- |
  | `⌥` | Option | | `c` | Command-line editing |
  | `⌃` | Control | | `i` | Insert |
  | `⇧` | Shift | | `n` | Normal |
  | `<Tab>` | Tab | | `o` | Operator-pending |
  | `<Space>` | Space | | `s` | Select |
  | `<Esc>` | Escape | | `t` | Terminal |
  | `<Enter>` | Enter | | `v` | Visual |
  | `<BS>` | Backspace/delete | | `x` | Replace |

</details>

If you want to unbind some keymaps, just uncomment the line with `vim.keymap.del` in the `keymaps.lua` file.

## General

| Key | Description | Mode |
| --- | ----------- | :----: |
| `⌃` + `h` | Go to left window | **n**, **t** |
| `⌃` + `j` | Go to lower window | **n**, **t** |
| `⌃` + `k` | Go to upper window | **n**, **t** |
| `⌃` + `l` | Go to right window | **n**, **t** |
| `<Space>` `w` `d` | Delete window | **n** |
| `<Space>` `-` | Split window below | **n** |
| `<Space>` `\|` | Split window right | **n** |
| `<Esc>` | Escape and clear hlsearch | **i**, **n** |
| `⌃` + `s` | Save file | **i**, **x**, **n**, **s** |
| `<Space>` `q` `q` | Quit all | **n** |
| `<Space>` `u` `i` | Inspect Pos | **n** |
| `⌃` + `/` | Terminal (root dir) | **n** |
| `⌃` + `/` | Hide Terminal | **t** |
| `⌃` + `_` | which_key_ignore | **n**, **t** |
| `<Esc>` `<Esc>` | Enter Normal Mode | **t** |
| `<Space>` `s` `h` | Help Pages | **n** |

## Editing / Refactoring

| Key | Description | Mode |
| --- | ----------- | :----: |
| `⌥` + `j` | Move line(s) down | **n**, **i**, **v** |
| `⌥` + `k` | Move line(s) up | **n**, **i**, **v** |
| `⌥` + `/` | Comment/uncomment line(s) | **n**, **v** |
| `g` `d` | Goto Definition | **n** |
| `g` `r` | References | **n** |
| `K` | Hover | **n** |
| `⌃` + `k` | Signature Help | **i** |
| `<Space>` `c` `F` | Format Injected Langs | **n**, **v** |
| `<Space>` `c` `r` | Rename | **n** |
| `<Space>` `g` `l` | Toggle git blame line | **n**, **v** |
| `<Space>` `h` | Git file history | **n** |
| `<Space>` `c` `a` | Code Action | **n**, **v** |
| `<Space>` `c` `d` | Line Diagnostics | **n** |
| `]` `d` | Next Diagnostic | **n** |
| `[` `d` | Prev Diagnostic | **n** |
| `]` `e` | Next Error | **n** |
| `[` `e` | Prev Error | **n** |
| `]` `w` | Next Warning | **n** |
| `[` `w` | Prev Warning | **n** |
| `<Space>` `d` `l` | Location List (Trouble) | **n** |
| `<Space>` `d` `q` | Quickfix List (Trouble) | **n** |
| `<Space>` `d` `d` | Document Diagnostics (Trouble) | **n** |
| `<Space>` `d` `w` | Workspace Diagnostics (Trouble) | **n** |
| `<Space>` `s` `t` | Todo | **n** |
| `<Space>` `s` `T` | Todo/Fix/Fixme | **n** |
| `<Space>` `x` `t` | Todo (Trouble) | **n** |
| `<Space>` `x` `T` | Todo/Fix/Fixme (Trouble) | **n** |
| `[` `t` | Previous todo comment | **n** |
| `]` `t` | Next todo comment | **n** |

## Search / Replace

| Key | Description | Mode |
| --- | ----------- | :----: |
| `<Space>` `<Space>` <br/>  `<Space>` `f` `f` | Find Files (root dir) | **n** |
| `<Space>` `f` `g` | Find Files (git-files) | **n** |
| `<Space>` `/` | Grep (root dir) | **n** |
| `<Space>` `f` `b` | List of open buffers | **n** |
| `<Space>` `s` `r` | Replace in files (Spectre) | **n** |
| `<Space>` `:` | Command History | **n** |
| `<Space>` `?` | Key Maps | **n** |
| `<Space>` `,` | Find Config File | **n** |

## Work with file explorer

| Key | Description | Mode |
| --- | --- | :---: |
| `<Space>` `e` | Explorer NeoTree (root dir) | **n** |
| `<Space>` `E` | Explorer NeoTree (cwd) | **n** |
| `<Space>` `f` `e` | Explorer NeoTree (root dir) | **n** |
| `<Space>` `f` `E` | Explorer NeoTree (cwd) | **n** |

## Work with buffers

| Key | Description | Mode |
| --- | ----------- | :----: |
| `⇧` + `h` | Prev buffer | **n** |
| `⇧` + `l` | Next buffer | **n** |
| `<Space>` `f` `b` | List of open buffers | **n** |
| `<Space>` `q` | Close buffer | **n** |
| `<Space>` `b` `l` | Delete buffers to the left | **n** |
| `<Space>` `b` `o` | Delete other buffers | **n** |
| `<Space>` `b` `p` | Toggle pin | **n** |
| `<Space>` `b` `P` | Delete non-pinned buffers | **n** |
| `<Space>` `b` `r` | Delete buffers to the right | **n** |
| `<Space>` `b` `d` | Delete Buffer | **n** |
| `<Space>` `b` `D` | Delete Buffer (Force) | **n** |
| `<Space>` `b` `e` | Buffer explorer | **n** |

## Work with tabs

| Key | Description | Mode |
| --- | ----------- | :----: |
| `<Space>` `<Tab>` `l` | Last Tab | **n** |
| `<Space>` `<Tab>` `f` | First Tab | **n** |
| `<Space>` `<Tab>` `<Tab>` | New Tab | **n** |
| `<Space>` `<Tab>` `]` | Next Tab | **n** |
| `<Space>` `<Tab>` `d` | Close Tab | **n** |
| `<Space>` `<Tab>` `[` | Previous Tab | **n** |

## Work with git

| Key | Description | Mode |
| --- | --- | :---: |
| `⌃` + `g` | Open diffview | **n** |
| `<Space>` `g` `l` | Toggle git blame line | **n**, **v** |
| `<Space>` `h` | Git file history | **n** |
| `<Space>` `g` `c` | Git commits | **n** |
| `<Space>` `g` `b` | Git branches | **n** |
| `<Space>` `g` `e` | Git explorer | **n** |

## Work with session

| Key | Description | Mode |
| --- | --- | :---: |
| `<Space>` `q` `d` | Don't Save Current Session | **n** |
| `<Space>` `q` `l` | Restore Last Session | **n** |
| `<Space>` `q` `s` | Restore Session | **n** |

<details>
  <summary>Other</summary>

  ### [mason.nvim](https://github.com/williamboman/mason.nvim.git)

  | Key | Description | Mode |
  | --- | --- | :---: |
  | `<Space>` `c` `m` | Mason | **n** |

  ### [mini.surround](https://github.com/echasnovski/mini.surround.git)

  | Key | Description | Mode |
  | --- | --- | :---: |
  | `g` `s` `a` | Add surrounding | **n**, **v** |
  | `g` `s` `d` | Delete surrounding | **n** |
  | `g` `s` `f` | Find right surrounding | **n** |
  | `g` `s` `F` | Find left surrounding | **n** |
  | `g` `s` `h` | Highlight surrounding | **n** |
  | `g` `s` `n` | Update `MiniSurround.config.n_lines` | **n** |
  | `g` `s` `r` | Replace surrounding | **n** |

  ### [noice.nvim](https://github.com/folke/noice.nvim.git)

  | Key | Description | Mode |
  | --- | --- | :---: |
  | `⌃` + `b` | Scroll backward | **n**, **i**, **s** |
  | `⌃` + `f` | Scroll forward | **n**, **i**, **s** |
  | `<Space>` `s` `n` `a` | Noice All | **n** |
  | `<Space>` `s` `n` `d` | Dismiss All | **n** |
  | `<Space>` `s` `n` `h` | Noice History | **n** |
  | `<Space>` `s` `n` `l` | Noice Last Message | **n** |
  | `⇧` + `<Enter>` | Redirect Cmdline | **c** |

  ### [nvim-notify](https://github.com/rcarriga/nvim-notify.git)

  | Key | Description | Mode |
  | --- | --- | :---: |
  | `<Space>` `u` `n` | Dismiss all Notifications | **n** |

  ### [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter.git)

  | Key | Description | Mode |
  | --- | --- | :---: |
  | `<BS>` | Decrement selection | **x** |
  | `⌃` + `<Space>` | Increment selection | **n** |

  ### [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context.git)

  | Key | Description | Mode |
  | --- | --- | :---: |
  | `<Space>` `u` `t` | Toggle Treesitter Context | **n** |

</details>
