# Mac Systemwide Vim with Status Bar

Enables a system-wide Vim-mode (using a Karabiner config) with a 
convenient menu bar status bar indicator (courtesy of Hammerspoon).
Refer to the usage keys documentation in the end of the README.

### Installation

Works on MacOS Sonoma 14.1.1

#### Karabiner Elements

Install the latest version of Karabiner Elements (tested for 14.12.0).

Place the file `vim-status-karabiner.json`  into `~/.config/karabiner/assets/complex_modifications`.

Next, in Karabiner Settings go to Complex Modifications, press "Add
Rule" in the bottom, and enable all the Vim Status modifications.

#### Hammerspoon

Next, install the latest version of hammerspoon (tested for 0.9.100
(6815)).
Place the `vim-status-hammerspoon.lua` into `~/.hammerspoon`.

In the same folder, in the file `init.lua` add a line in the head of the
file, `require "vim-status-hammerspoon`.
Reload the hammerspoon config by clicking the hammer and finding the
reload menu item.

This project is based on this 
[fork of Vim Mode Plus](https://github.com/pqrs-org/KE-complex_modifications/blob/88ba4cfcce91fb8037a96366bec36c3906565199/public/json/vim_mode_plus_better_notifications.json#L4).
The original work is by: [@harmtemolder](https://github.com/harmtemolder).

### [Optional perk] Safari Vimari janky navigation fix

Allows a workflow in Vimari, which replaces its jittery implementation
of the `hjkl` navigation with arrow keys, as issued by Karabiner on
press of `hjkl`.
Delete the lines containing the `hjkl` bindings in the Vimari config
altogether.
Then this fix should work.
To enter the Vimari link navigation mode, press `f` when in Safari and
proceed in insert mode.

### Demo

https://github.com/dodgog/vim-menubar-binerspoon/assets/137945767/d1932258-100e-43bd-aad0-c949831f45b6

### Usage keys

#### NORMAL mode

- Activate with `caps lock`.
- Deactivate with:
  - `i` or `a` (there are more like these, see below)
  - `caps lock`
  - `escape`
  - `control` + `[`
  - Clicking any mouse button
  - Pressing any key within Vscode, Cursor, Android Studio, Terminal,
    Arc (because those have their own Vim modes)
  - Pressing any key while having at least one finger on your trackpad

Alternatively, you can hold `caps lock` for NORMAL mode and release it to exit.

Within NORMAL mode you can then move around with:

| key         | action                                  |
|-------------|-----------------------------------------|
| `h`         | Move cursor left*                       |
| `j`         | Move cursor down*                       |
| `k`         | Move cursor up*                         |
| `l`         | Move cursor right*                      |
| `e`         | Move cursor to next end of word         |
| `b`         | Move cursor to previous start of word   |
| `0`         | Move cursor to start of line (before any tabs) |
| `^`         | Move cursor to start of line (after any tabs)  |
| `$`         | Move cursor to end of line              |
| `g`, `g`    | Move cursor to start of document        |
| `G`         | Move cursor to end of document          |
| `{`         | Move cursor to start of paragraph       |
| `}`         | Move cursor to end of paragraph         |

*These work with `shift`, `control`, `option` and/or `command`, e.g. for hotkeys within apps.

Combine those with `d`, `y` and `c` to delete (“cut”), yank (“copy”) or change (“cut” and exit NORMAL mode) like so:

| key sequence             | action                                 |
|--------------------------|----------------------------------------|
| `d`, `d` / `y`, `y` / `c`, `c` | Delete/yank/change the entire line |
| `d`, `e` / `y`, `e` / `c`, `e` | Delete/yank/change to the next end of word |
| `d`, `b` / ... / ...      | Delete/yank/change to the previous start of word |
| ...                      | Ditto for all other navigation keys mentioned above |

Also:

| key                      | action                                  |
|--------------------------|-----------------------------------------|
| `x`                      | Delete forward                          |
| `X`                      | Delete back                             |
| `p` or `P`               | Paste at cursor                         |
| `u`                      | Undo                                    |
| `control` + `r`          | Redo                                    |

To exit NORMAL mode at specific locations:

| key                      | action                                  |
|--------------------------|-----------------------------------------|
| `i`                      | Exit NORMAL mode at the cursor          |
| `I`                      | Exit NORMAL mode at the start of the line |
| `a`                      | Exit NORMAL mode at the cursor          |
| `A`                      | Exit NORMAL mode at the end of the line |
| `o`                      | Exit NORMAL mode on a new line below the cursor |
| `O`                      | Exit NORMAL mode on a new line above the cursor |

Keys to `F18`, `F19` and `F20`, are mapped to function keys, allowing
the user to pick them up for their own usecase.

| key                      | action                                  |
|--------------------------|-----------------------------------------|
| `s`                      | F18                                    |
| `m`                      | F19                                    |
| `spacebar`               | F20                                    |

#### VISUAL mode

From within NORMAL mode you can switch to VISUAL mode with `v`.
(Unfortunately you cannot switch to the other end of the selection with
`o` as you normally would, so choose your starting point wisely.)

| key                      | action                                  |
|--------------------------|-----------------------------------------|
| `v`                      | Exit VISUAL mode, enter NORMAL mode     |
| `h`                      | Select left                             |
| `j`                      | Select down                             |
| ...                      | Ditto for all other navigation keys mentioned above |
| `d`                      | Delete (“cut”) the selection and enter NORMAL mode |
| `y`                      | Yank (“copy”) the selection and enter NORMAL mode |
| `c`                      | Change (“cut”) the selection and exit Vim Mode entirely |
| `x`                      | Remove the selection and enter NORMAL mode |

