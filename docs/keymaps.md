# ⌨️  Keymaps

[Home](readme.md) / Keymaps

StormVim use which-key.nvim to help you remember keymaps. Just press any key like `<space>` and you'll see a popup with all possible keymaps starting with `<space>`.

Default `<leader>` is `<space>`.

If you want to unbind some keymaps, just uncomment the line with `vim.keymap.del` in the `keymaps.lua` file.

## General

| Key | Description | Mode |
| --- | ----------- | ---- |
| <code>&lt;C-h&gt;</code> | Go to left window | **n**, **t** |
| <code>&lt;C-j&gt;</code> | Go to lower window | **n**, **t** |
| <code>&lt;C-k&gt;</code> | Go to upper window | **n**, **t** |
| <code>&lt;C-l&gt;</code> | Go to right window | **n**, **t** |
| <code>&lt;A-j&gt;</code> | Move down | **n**, **i**, **v** |
| <code>&lt;A-k&gt;</code> | Move up | **n**, **i**, **v** |
| <code>&lt;S-h&gt;</code> | Prev buffer | **n** |
| <code>&lt;S-l&gt;</code> | Next buffer | **n** |
| <code>&lt;esc&gt;</code> | Escape and clear hlsearch | **i**, **n** |
| <code>n</code> | Next search result | **n**, **x**, **o** |
| <code>N</code> | Prev search result | **n**, **x**, **o** |
| <code>&lt;C-s&gt;</code> | Save file | **i**, **x**, **n**, **s** |
| <code>&lt;leader&gt;cd</code> | Line Diagnostics | **n** |
| <code>]d</code> | Next Diagnostic | **n** |
| <code>[d</code> | Prev Diagnostic | **n** |
| <code>]e</code> | Next Error | **n** |
| <code>[e</code> | Prev Error | **n** |
| <code>]w</code> | Next Warning | **n** |
| <code>[w</code> | Prev Warning | **n** |
| <code>&lt;leader&gt;qq</code> | Quit all | **n** |
| <code>&lt;leader&gt;ui</code> | Inspect Pos | **n** |
| <code>&lt;c-/&gt;</code> | Terminal (root dir) | **n** |
| <code>&lt;c-_&gt;</code> | which_key_ignore | **n**, **t** |
| <code>&lt;esc&gt;&lt;esc&gt;</code> | Enter Normal Mode | **t** |
| <code>&lt;C-/&gt;</code> | Hide Terminal | **t** |
| <code>&lt;leader&gt;wd</code> | Delete window | **n** |
| <code>&lt;leader&gt;w-</code> | Split window below | **n** |
| <code>&lt;leader&gt;w&vert;</code> | Split window right | **n** |
| <code>&lt;leader&gt;-</code> | Split window below | **n** |
| <code>&lt;leader&gt;&vert;</code> | Split window right | **n** |
| <code>&lt;leader&gt;&lt;tab&gt;l</code> | Last Tab | **n** |
| <code>&lt;leader&gt;&lt;tab&gt;f</code> | First Tab | **n** |
| <code>&lt;leader&gt;&lt;tab&gt;&lt;tab&gt;</code> | New Tab | **n** |
| <code>&lt;leader&gt;&lt;tab&gt;]</code> | Next Tab | **n** |
| <code>&lt;leader&gt;&lt;tab&gt;d</code> | Close Tab | **n** |
| <code>&lt;leader&gt;&lt;tab&gt;[</code> | Previous Tab | **n** |


## LSP

| Key | Description | Mode |
| --- | ----------- | ---- |
| <code>&lt;leader&gt;cl</code> | Lsp Info | **n** |
| <code>gd</code> | Goto Definition | **n** |
| <code>gr</code> | References | **n** |
| <code>gD</code> | Goto Declaration | **n** |
| <code>gI</code> | Goto Implementation | **n** |
| <code>gy</code> | Goto T[y]pe Definition | **n** |
| <code>K</code> | Hover | **n** |
| <code>gK</code> | Signature Help | **n** |
| <code>&lt;c-k&gt;</code> | Signature Help | **i** |
| <code>&lt;leader&gt;ca</code> | Code Action | **n**, **v** |
| <code>&lt;leader&gt;cA</code> | Source Action | **n** |
| <code>&lt;leader&gt;cr</code> | Rename | **n** |

## [bufferline.nvim](https://github.com/akinsho/bufferline.nvim.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;leader&gt;bl</code> | Delete buffers to the left | **n** |
| <code>&lt;leader&gt;bo</code> | Delete other buffers | **n** |
| <code>&lt;leader&gt;bp</code> | Toggle pin | **n** |
| <code>&lt;leader&gt;bP</code> | Delete non-pinned buffers | **n** |
| <code>&lt;leader&gt;br</code> | Delete buffers to the right | **n** |
| <code>[b</code> | Prev buffer | **n** |
| <code>]b</code> | Next buffer | **n** |
| <code>&lt;S-h&gt;</code> | Prev buffer | **n** |
| <code>&lt;S-l&gt;</code> | Next buffer | **n** |

## [conform.nvim](https://github.com/stevearc/conform.nvim.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;leader&gt;cF</code> | Format Injected Langs | **n**, **v** |

## [mason.nvim](https://github.com/williamboman/mason.nvim.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;leader&gt;cm</code> | Mason | **n** |

## [mini.bufremove](https://github.com/echasnovski/mini.bufremove.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;leader&gt;bd</code> | Delete Buffer | **n** |
| <code>&lt;leader&gt;bD</code> | Delete Buffer (Force) | **n** |

## [mini.surround](https://github.com/echasnovski/mini.surround.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>gsa</code> | Add surrounding | **n**, **v** |
| <code>gsd</code> | Delete surrounding | **n** |
| <code>gsf</code> | Find right surrounding | **n** |
| <code>gsF</code> | Find left surrounding | **n** |
| <code>gsh</code> | Highlight surrounding | **n** |
| <code>gsn</code> | Update `MiniSurround.config.n_lines` | **n** |
| <code>gsr</code> | Replace surrounding | **n** |

## [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;leader&gt;be</code> | Buffer explorer | **n** |
| <code>&lt;leader&gt;e</code> | Explorer NeoTree (root dir) | **n** |
| <code>&lt;leader&gt;E</code> | Explorer NeoTree (cwd) | **n** |
| <code>&lt;leader&gt;fe</code> | Explorer NeoTree (root dir) | **n** |
| <code>&lt;leader&gt;fE</code> | Explorer NeoTree (cwd) | **n** |
| <code>&lt;leader&gt;ge</code> | Git explorer | **n** |

## [noice.nvim](https://github.com/folke/noice.nvim.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;c-b&gt;</code> | Scroll backward | **n**, **i**, **s** |
| <code>&lt;c-f&gt;</code> | Scroll forward | **n**, **i**, **s** |
| <code>&lt;leader&gt;sna</code> | Noice All | **n** |
| <code>&lt;leader&gt;snd</code> | Dismiss All | **n** |
| <code>&lt;leader&gt;snh</code> | Noice History | **n** |
| <code>&lt;leader&gt;snl</code> | Noice Last Message | **n** |
| <code>&lt;S-Enter&gt;</code> | Redirect Cmdline | **c** |

## [nvim-notify](https://github.com/rcarriga/nvim-notify.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;leader&gt;un</code> | Dismiss all Notifications | **n** |

## [nvim-spectre](https://github.com/nvim-pack/nvim-spectre.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;leader&gt;sr</code> | Replace in files (Spectre) | **n** |

## [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;bs&gt;</code> | Decrement selection | **x** |
| <code>&lt;c-space&gt;</code> | Increment selection | **n** |

## [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;leader&gt;ut</code> | Toggle Treesitter Context | **n** |

## [persistence.nvim](https://github.com/folke/persistence.nvim.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;leader&gt;qd</code> | Don't Save Current Session | **n** |
| <code>&lt;leader&gt;ql</code> | Restore Last Session | **n** |
| <code>&lt;leader&gt;qs</code> | Restore Session | **n** |

## [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;leader&gt;&lt;space&gt;</code> | Find Files (root dir) | **n** |
| <code>&lt;leader&gt;,</code> | Find Config File | **n** |
| <code>&lt;leader&gt;/</code> | Grep (root dir) | **n** |
| <code>&lt;leader&gt;:</code> | Command History | **n** |
| <code>&lt;leader&gt;fb</code> | Buffers | **n** |
| <code>&lt;leader&gt;ff</code> | Find Files (root dir) | **n** |
| <code>&lt;leader&gt;fg</code> | Find Files (git-files) | **n** |
| <code>&lt;leader&gt;gc</code> | Git commits | **n** |
| <code>&lt;leader&gt;gb</code> | Git branches | **n** |
| <code>&lt;leader&gt;sh</code> | Help Pages | **n** |
| <code>&lt;leader&gt;sH</code> | Search Highlight Groups | **n** |
| <code>&lt;leader&gt;sk</code> | Key Maps | **n** |
| <code>&lt;leader&gt;sM</code> | Man Pages | **n** |
| <code>&lt;leader&gt;so</code> | Options | **n** |

## [todo-comments.nvim](https://github.com/folke/todo-comments.nvim.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;leader&gt;st</code> | Todo | **n** |
| <code>&lt;leader&gt;sT</code> | Todo/Fix/Fixme | **n** |
| <code>&lt;leader&gt;xt</code> | Todo (Trouble) | **n** |
| <code>&lt;leader&gt;xT</code> | Todo/Fix/Fixme (Trouble) | **n** |
| <code>[t</code> | Previous todo comment | **n** |
| <code>]t</code> | Next todo comment | **n** |

## [trouble.nvim](https://github.com/folke/trouble.nvim.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;leader&gt;dl</code> | Location List (Trouble) | **n** |
| <code>&lt;leader&gt;dq</code> | Quickfix List (Trouble) | **n** |
| <code>&lt;leader&gt;dd</code> | Document Diagnostics (Trouble) | **n** |
| <code>&lt;leader&gt;dw</code> | Workspace Diagnostics (Trouble) | **n** |

## [flit.nvim](https://github.com/ggandor/flit.nvim.git)

| Key | Description | Mode |
| --- | --- | --- |
| <code>f</code> | f | **n**, **o**, **x** |
| <code>F</code> | F | **n**, **o**, **x** |
| <code>t</code> | t | **n**, **o**, **x** |
| <code>T</code> | T | **n**, **o**, **x** |

## [diffview](https://github.com/sindrets/diffview.nvim)

| Key | Description | Mode |
| --- | --- | --- |
| <code>&lt;leader&gt;h</code> | Git file history | **n** |
| <code>&lt;C-g&gt;</code> | Open diffview | **n** |

