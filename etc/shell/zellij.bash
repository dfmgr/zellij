#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Zellij shell integration for bash
# Source this file in your .bashrc
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Only run if zellij is available
command -v zellij &>/dev/null || return 0

# =============================================================================
# TAB AUTO-NAMING
# =============================================================================
# Automatically rename tabs based on current directory and running command

if [ -n "$ZELLIJ" ]; then
  # Get current directory name (~ for home, basename otherwise)
  __zellij_current_dir() {
    if [ "$PWD" = "$HOME" ]; then
      echo "~"
    else
      basename "$PWD"
    fi
  }

  # Rename tab (runs in background to avoid lag)
  __zellij_rename_tab() {
    nohup zellij action rename-tab "$1" >/dev/null 2>&1 &
  }

  # Set tab to working directory (called after each command)
  __zellij_precmd() {
    __zellij_rename_tab "$(__zellij_current_dir)"
  }

  # Set tab to command being run (called before command execution)
  __zellij_preexec() {
    # Get the command name (first word)
    local cmd="${1%% *}"
    # Skip if it's a background job or empty
    [ -z "$cmd" ] && return
    __zellij_rename_tab "$cmd"
  }

  # Install hooks using PROMPT_COMMAND for precmd
  __zellij_prompt_command() {
    __zellij_precmd
  }

  # Append to PROMPT_COMMAND if not already present
  if [[ ! "$PROMPT_COMMAND" =~ __zellij_prompt_command ]]; then
    PROMPT_COMMAND="__zellij_prompt_command${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
  fi

  # For preexec, use DEBUG trap
  __zellij_debug_trap() {
    # Only run for interactive commands, not subshells or PROMPT_COMMAND
    [ -n "$COMP_LINE" ] && return  # Skip during completion
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return  # Skip PROMPT_COMMAND itself
    [[ "$BASH_COMMAND" =~ ^__zellij ]] && return  # Skip our own functions
    __zellij_preexec "$BASH_COMMAND"
  }

  trap '__zellij_debug_trap' DEBUG
fi

# =============================================================================
# SESSION MANAGEMENT FUNCTIONS
# =============================================================================

# zj - Start or attach to session named after current directory
zj() {
  local session_name="${1:-$(basename "$PWD")}"
  # If already in zellij, just print info
  if [ -n "$ZELLIJ" ]; then
    echo "Already in zellij session: $ZELLIJ_SESSION_NAME"
    return 0
  fi
  # Check if session exists and attach, otherwise create new
  if zellij list-sessions 2>/dev/null | grep -q "^$session_name"; then
    zellij attach "$session_name" "${@:2}"
  else
    zellij -s "$session_name" "${@:2}"
  fi
}

# zja - Attach to session (directory name default)
zja() {
  local session_name="${1:-$(basename "$PWD")}"
  zellij attach "$session_name" "${@:2}"
}

# zjn - Force new session with directory name
zjn() {
  local session_name="${1:-$(basename "$PWD")}"
  zellij -s "$session_name" "${@:2}"
}

# zjl - List sessions
zjl() {
  zellij list-sessions "$@"
}

# zjk - Kill session
zjk() {
  local session_name="${1:-$(basename "$PWD")}"
  zellij kill-session "$session_name"
}

# zjd - Delete session
zjd() {
  local session_name="${1:-$(basename "$PWD")}"
  zellij delete-session "$session_name"
}

# =============================================================================
# PANE/TAB HELPER FUNCTIONS
# =============================================================================

# Run command in new pane
zr() { zellij run --name "$*" -- bash -ic "$*"; }
zrf() { zellij run --name "$*" --floating -- bash -ic "$*"; }
zri() { zellij run --name "$*" --in-place -- bash -ic "$*"; }

# Edit file in new pane
ze() { zellij edit "$@"; }
zef() { zellij edit --floating "$@"; }
zei() { zellij edit --in-place "$@"; }

# Pipe to plugin
zpipe() {
  if [ -z "$1" ]; then
    zellij pipe
  else
    zellij pipe -p "$1"
  fi
}
