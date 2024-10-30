# Neovim Configuration

## Installation

1. Clone the repository with the configuration:

```bash
git clone https://github.com/nontypeable/nvim-config.git ~/.config/nvim
```

2. Install ripgrep:

```bash
sudo apt-get install ripgrep    # Debian/Ubuntu
sudo pacman -S ripgrep          # Arch
sudo dnf install ripgrep        # Fedora
brew install ripgrep            # macOS
```

## Hotkeys

### General

| Hotkey | Description      |
| ------ | ---------------- |
| `jk`   | Exit insert mode |

### Window and Tab Management

| Hotkey       | Description                          |
| ------------ | ------------------------------------ |
| `<leader>to` | Open a new tab                       |
| `<leader>tx` | Close the current tab                |
| `<leader>tn` | Go to the next tab                   |
| `<leader>tp` | Go to the previous tab               |
| `<leader>tf` | Open the current buffer in a new tab |
| `<leader>sv` | Split window vertically              |
| `<leader>sh` | Split window horizontally            |
| `<leader>se` | Make window sizes equal              |
| `<leader>sx` | Close the current window             |

### Search

| Hotkey       | Description                                               |
| ------------ | --------------------------------------------------------- |
| `<leader>ff` | Fuzzy search for files in the current directory           |
| `<leader>fs` | Find a string in the current directory                    |
| `<leader>fr` | Fuzzy search for recent files                             |
| `<leader>fc` | Find the string under the cursor in the current directory |
| `<C-k>`      | Jump to the previous search result                        |
| `<C-j>`      | Jump to the next search result                            |
| `<C-t>`      | Open problems in the selected file                        |
| `<leader>nh` | Clear highlighting of search results                      |

### Commenting

| Hotkey              | Description                                    |
| ------------------- | ---------------------------------------------- |
| `gcc`               | Comment/uncomment a line                       |
| `gc`                | Comment/uncomment the selection (visual mode)  |
| `gbc`               | Comment/uncomment the block                    |
| `[count]gcc`        | Comment out/comment out [count] lines          |
| `gc[count]{motion}` | Comment/uncomment the area defined by {motion} |

### Sessions

| Hotkey       | Description                               |
| ------------ | ----------------------------------------- |
| `<leader>wr` | Restore session for the current directory |
| `<leader>ws` | Save the session for the root directory   |

### Code Actions

| Hotkey       | Description                               |
| ------------ | ----------------------------------------- |
| `<leader>l`  | Start linting for the current file        |
| `<leader>mp` | Format the file or selected range         |
| `<leader>xx` | Open problem diagnostics in the workspace |
| `<leader>cs` | Open symbols in the current buffer        |

### File Explorer

| Hotkey       | Description                               |
| ------------ | ----------------------------------------- |
| `<leader>ee` | Toggle file explorer visibility           |
| `<leader>ef` | Open file explorer at the current file    |
| `<leader>ec` | Collapse the file explorer                |
| `<leader>er` | Refresh the contents of the file explorer |

### Autocompletion

| Hotkey      | Description                        |
| ----------- | ---------------------------------- |
| `<C-Space>` | Show suggestions for autocomplete  |
| `<C-j>`     | Go to the next suggestion          |
| `<C-k>`     | Go to the previous suggestion      |
| `<C-b>`     | Scroll up 4 lines in documentation |
| `<C-f>`     | Scroll down 4 lines                |
| `<CR>`      | Confirm the selected prompt        |
| `<C-e>`     | Close the autocomplete window      |

