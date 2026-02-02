╔══════════════════════════════════════════════════════════════════════════════╗
║                        ZELLIJ KEYBINDINGS REFERENCE                          ║
╚══════════════════════════════════════════════════════════════════════════════╝

PREFIX: Ctrl+Space (enters TMUX/PRE mode)

┌─ SESSION MANAGEMENT ──────────────────────────────────────────────────────────┐
│ PREFIX d           Detach from session                                        │
│ PREFIX Tab         Session mode                                               │
│ PREFIX s           Open session manager                                       │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ TAB (WINDOW) MANAGEMENT ─────────────────────────────────────────────────────┐
│ PREFIX t/c         Create new tab                                             │
│ PREFIX n           Next tab                                                   │
│ PREFIX p           Previous tab                                               │
│ PREFIX `           Last tab                                                   │
│ PREFIX ,           Rename current tab                                         │
│ PREFIX @           Kill current tab (close all panes)                         │
│ PREFIX 1-9         Switch to tab 1-9                                          │
│ Shift+Left         Previous tab (no prefix)                                   │
│ Shift+Right        Next tab (no prefix)                                       │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ PANE MANAGEMENT ─────────────────────────────────────────────────────────────┐
│ PREFIX \           Split pane horizontally (right)                            │
│ PREFIX /           Split pane vertically (down)                               │
│ PREFIX ←↑↓→        Select pane (arrow keys)                                   │
│ PREFIX Ctrl+h/j/k/l Select pane (vim keys)                                    │
│ PREFIX x           Close current pane                                         │
│ PREFIX w           Pane mode                                                  │
│ PREFIX +/z         Zoom/fullscreen pane                                       │
│ PREFIX f           Toggle floating panes                                      │
│ PREFIX F           Toggle pane embed/floating                                 │
│ Ctrl+h/j/k/l       Navigate panes (no prefix, vim-style)                      │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ PANE RESIZING ───────────────────────────────────────────────────────────────┐
│ PREFIX h           Resize pane left                                           │
│ PREFIX j           Resize pane down                                           │
│ PREFIX k           Resize pane up                                             │
│ PREFIX l           Resize pane right                                          │
│ PREFIX r           Enter resize mode                                          │
│ PREFIX Ctrl+←↑↓→   Resize pane (arrow keys)                                   │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ SCROLL/COPY MODE ────────────────────────────────────────────────────────────┐
│ PREFIX [           Enter scroll mode                                          │
│ Alt+[              Enter scroll mode (no prefix)                              │
│ (in scroll mode)                                                              │
│   j/k or ↑↓        Scroll up/down                                             │
│   Ctrl+d/u         Half page down/up                                          │
│   Ctrl+f/b         Full page down/up                                          │
│   g/G              Go to top/bottom                                           │
│   /                Search forward                                             │
│   n/N              Next/previous search result                                │
│   v/Space          Enter selection mode                                       │
│   e                Edit scrollback in $EDITOR                                 │
│   q/Esc            Exit scroll mode                                           │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ OTHER MODES ─────────────────────────────────────────────────────────────────┐
│ PREFIX r           Resize mode (then h/j/k/l to resize)                       │
│ PREFIX o           Move mode (then h/j/k/l to move pane)                      │
│ Esc                Exit any mode, return to normal                            │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ SPECIAL FEATURES ────────────────────────────────────────────────────────────┐
│ PREFIX m           Toggle mouse mode                                          │
│ PREFIX ?           Show this help                                             │
│ PREFIX Space       Next swap layout                                           │
│ Alt+n              New pane (no prefix)                                       │
│ Alt+[/]            Previous/next layout (no prefix)                           │
│ Ctrl+q             Quit zellij                                                │
└───────────────────────────────────────────────────────────────────────────────┘

┌─ SESSION MODE (PREFIX Tab) ───────────────────────────────────────────────────┐
│ d                  Detach                                                     │
│ w                  Session manager                                            │
│ c                  Configuration                                              │
│ p                  Plugin manager                                             │
└───────────────────────────────────────────────────────────────────────────────┘

Use arrow keys or j/k to scroll • Press 'q' to close
