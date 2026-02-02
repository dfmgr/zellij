# Zellij Keybindings Reference

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                         ZELLIJ KEYBINDINGS REFERENCE                         ║
╚══════════════════════════════════════════════════════════════════════════════╝

PREFIX: Ctrl+Space (enters TMUX mode, then press key)

┌─ SESSION MANAGEMENT ──────────────────────────────────────────────────────────┐
│ PREFIX d           Detach from session                                        │
│ PREFIX Tab         Enter session mode                                         │
│ PREFIX s           Open session manager (floating)                            │
│ Ctrl+q             Quit zellij (from most modes)                              │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ TAB MANAGEMENT (tmux windows) ───────────────────────────────────────────────┐
│ PREFIX t           Create new tab                                             │
│ PREFIX c           Create new tab (alternate)                                 │
│ PREFIX n           Next tab                                                   │
│ PREFIX p           Previous tab                                               │
│ PREFIX `           Previous tab (alternate)                                   │
│ PREFIX ,           Rename current tab                                         │
│ PREFIX @           Close current tab                                          │
│ PREFIX 1-9         Switch to tab 1-9                                          │
│ Shift+Left         Previous tab (no prefix)                                   │
│ Shift+Right        Next tab (no prefix)                                       │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ PANE SPLITTING ──────────────────────────────────────────────────────────────┐
│ PREFIX \           Split pane right (horizontal)                              │
│ PREFIX /           Split pane down (vertical)                                 │
│ PREFIX w           Enter pane mode for more options                           │
│ Alt+n              New pane (no prefix, any mode)                             │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ PANE NAVIGATION ─────────────────────────────────────────────────────────────┐
│ PREFIX ←↑↓→        Select pane (arrow keys)                                   │
│ PREFIX Ctrl+h/j/k/l Select pane (vim keys with Ctrl)                          │
│ Ctrl+h/j/k/l       Navigate panes (no prefix, vim-style)                      │
│ Alt+h/l            Navigate panes or tabs (no prefix)                         │
│ Alt+j/k            Navigate panes up/down (no prefix)                         │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ PANE RESIZING ───────────────────────────────────────────────────────────────┐
│ PREFIX h           Resize pane left                                           │
│ PREFIX j           Resize pane down                                           │
│ PREFIX k           Resize pane up                                             │
│ PREFIX l           Resize pane right                                          │
│ PREFIX Ctrl+←↑↓→   Resize pane (arrow keys)                                   │
│ PREFIX r           Enter resize mode (dedicated)                              │
│                                                                               │
│ In RESIZE mode:                                                               │
│   h/j/k/l or ←↑↓→  Increase size in direction                                 │
│   H/J/K/L          Decrease size in direction                                 │
│   +/=              Increase size                                              │
│   -                Decrease size                                              │
│   Esc              Exit resize mode                                           │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ PANE MANAGEMENT ─────────────────────────────────────────────────────────────┐
│ PREFIX x           Close current pane                                         │
│ PREFIX +           Toggle fullscreen (zoom)                                   │
│ PREFIX z           Toggle fullscreen (zoom, alternate)                        │
│ PREFIX f           Toggle floating panes                                      │
│ PREFIX F           Toggle pane embed/floating                                 │
│ PREFIX o           Enter move mode                                            │
│ PREFIX Space       Next swap layout                                           │
│ Alt+[              Previous swap layout (no prefix)                           │
│ Alt+]              Next swap layout (no prefix)                               │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ MOVE MODE ───────────────────────────────────────────────────────────────────┐
│ h/j/k/l or ←↑↓→    Move pane in direction                                     │
│ n or Tab           Move pane forward                                          │
│ p                  Move pane backward                                         │
│ Esc                Exit move mode                                             │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ SCROLL MODE (Copy Mode) ─────────────────────────────────────────────────────┐
│ PREFIX [           Enter scroll mode                                          │
│ Alt+[              Enter scroll mode (no prefix)                              │
│                                                                               │
│ In SCROLL mode:                                                               │
│   j/k or ↑↓        Scroll up/down                                             │
│   Ctrl+d           Half page down                                             │
│   Ctrl+u           Half page up                                               │
│   Ctrl+f/PageDown  Full page down                                             │
│   Ctrl+b/PageUp    Full page up                                               │
│   g                Scroll to top                                              │
│   G                Scroll to bottom                                           │
│   /                Search forward                                             │
│   ?                Search backward                                            │
│   n                Next search result                                         │
│   N                Previous search result                                     │
│   v or Space       Enter selection mode                                       │
│   e                Edit scrollback in $EDITOR                                 │
│   q or Esc         Exit scroll mode                                           │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ SEARCH MODE ─────────────────────────────────────────────────────────────────┐
│ c                  Toggle case sensitivity                                    │
│ w                  Toggle wrap                                                │
│ o                  Toggle whole word                                          │
│ n/N                Next/previous result                                       │
│ Esc                Exit search mode                                           │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ TAB MODE ────────────────────────────────────────────────────────────────────┐
│ h/l or ←→          Previous/next tab                                          │
│ n                  New tab                                                    │
│ x                  Close tab                                                  │
│ r                  Rename tab                                                 │
│ s                  Toggle sync (send to all panes)                            │
│ b                  Break pane to new tab                                      │
│ [/]                Break pane left/right                                      │
│ 1-9                Go to tab                                                  │
│ Tab                Toggle between tabs                                        │
│ Esc                Exit tab mode                                              │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ PANE MODE ───────────────────────────────────────────────────────────────────┐
│ h/j/k/l or ←↑↓→    Navigate panes                                             │
│ n                  New pane                                                   │
│ d                  New pane down                                              │
│ r                  New pane right                                             │
│ x                  Close pane                                                 │
│ f                  Toggle fullscreen                                          │
│ z                  Toggle pane frames                                         │
│ w                  Toggle floating panes                                      │
│ e                  Toggle embed/floating                                      │
│ c                  Rename pane                                                │
│ Esc                Exit pane mode                                             │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ SESSION MODE ────────────────────────────────────────────────────────────────┐
│ d                  Detach                                                     │
│ w                  Session manager                                            │
│ c                  Configuration                                              │
│ p                  Plugin manager                                             │
│ Esc                Exit session mode                                          │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ SPECIAL FEATURES ────────────────────────────────────────────────────────────┐
│ PREFIX m           Toggle mouse mode on/off                                   │
│ PREFIX ?           Open configuration plugin                                  │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ MOUSE SUPPORT ───────────────────────────────────────────────────────────────┐
│ Scroll             Scroll through history (when mouse enabled)                │
│ Click              Select pane                                                │
│ Drag border        Resize pane                                                │
│ Double-click       Select word                                                │
└───────────────────────────────────────────────────────────────────────────────┘

╔══════════════════════════════════════════════════════════════════════════════╗
║                              MODE QUICK REFERENCE                            ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Normal    │ Default mode, basic navigation                                   ║
║ Tmux      │ PREFIX mode (Ctrl+Space), mirrors tmux behavior                  ║
║ Pane      │ Pane-specific operations                                         ║
║ Tab       │ Tab management                                                   ║
║ Resize    │ Pane resizing                                                    ║
║ Move      │ Pane repositioning                                               ║
║ Scroll    │ Scrollback/copy mode with vi keys                                ║
║ Search    │ Text search within scrollback                                    ║
║ Session   │ Session management and plugins                                   ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

## Comparison with tmux

| Action | tmux | zellij |
|--------|------|--------|
| Prefix | `Ctrl+Space` | `Ctrl+Space` |
| Detach | `PREFIX d` | `PREFIX d` |
| New window/tab | `PREFIX t` | `PREFIX t` |
| Next window/tab | `PREFIX n` | `PREFIX n` |
| Previous window/tab | `PREFIX p` | `PREFIX p` |
| Split horizontal | `PREFIX \` | `PREFIX \` |
| Split vertical | `PREFIX /` | `PREFIX /` |
| Navigate panes | `PREFIX arrows` | `PREFIX arrows` |
| Vim navigation | `Ctrl+h/j/k/l` | `Ctrl+h/j/k/l` |
| Resize panes | `PREFIX h/j/k/l` | `PREFIX h/j/k/l` |
| Close pane | `PREFIX x` | `PREFIX x` |
| Close window/tab | `PREFIX @` | `PREFIX @` |
| Zoom/Fullscreen | `PREFIX +` | `PREFIX +` |
| Copy mode | `PREFIX [` | `PREFIX [` |
| Toggle mouse | `PREFIX m` | `PREFIX m` |
| Session manager | `PREFIX Tab` | `PREFIX s` |
| Rename | `PREFIX ,` | `PREFIX ,` |

## Web Server

Zellij includes a built-in web server for browser-based terminal access:

```kdl
web_server true
web_server_ip "127.0.0.1"
web_server_port 59421
```

Access at: `http://127.0.0.1:59421`

## Theme Switching

Change the theme in `config.kdl`:

```kdl
theme "dracula"         // Default
theme "catppuccin-mocha"
theme "nord"
theme "gruvbox-dark"
theme "tokyo-night"
theme "onedark"
theme "solarized-dark"
theme "rose-pine"
theme "kanagawa"
theme "everforest"
```

Light themes: `catppuccin-latte`, `gruvbox-light`, `solarized-light`
