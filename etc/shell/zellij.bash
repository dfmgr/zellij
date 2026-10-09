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
# Rename the tab to the current directory, only when the directory changes

if [ -n "$ZELLIJ" ]; then
  __zellij_last_tab_name=""

  # Get current directory name (~ for home, basename otherwise)
  __zellij_current_dir() {
    if [ "$PWD" = "$HOME" ]; then
      echo "~"
    else
      basename "$PWD"
    fi
  }

  # Rename tab only if the name changed (background, no job-control noise)
  __zellij_prompt_command() {
    local name
    name="$(__zellij_current_dir)"
    [ "$name" = "$__zellij_last_tab_name" ] && return 0
    __zellij_last_tab_name="$name"
    (zellij action rename-tab "$name" >/dev/null 2>&1 &)
  }

  # Append to PROMPT_COMMAND if not already present
  if [[ ! "$PROMPT_COMMAND" =~ __zellij_prompt_command ]]; then
    PROMPT_COMMAND="__zellij_prompt_command${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
  fi
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
  if zellij list-sessions --short --no-formatting 2>/dev/null | grep -qxF -- "$session_name"; then
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

# =============================================================================
# THEME SWITCHING
# =============================================================================

# zjtheme - Switch theme in config.kdl and recolor the zjstatus layout
# Usage: zjtheme [name]   (no name lists available themes)
zjtheme() {
  local cfg="${ZELLIJ_CONFIG_DIR:-$HOME/.config/zellij}"
  local name="$1" theme_file="$cfg/themes/$1.kdl"
  local tmpl="$cfg/layouts/default.kdl.tmpl"
  if [ -z "$name" ]; then
    local f
    for f in "$cfg"/themes/*.kdl; do f="${f##*/}"; echo "${f%.kdl}"; done
    return 0
  fi
  [ -f "$theme_file" ] || { echo "zjtheme: unknown theme: $name" >&2; return 1; }
  [ -f "$tmpl" ] || { echo "zjtheme: missing template: $tmpl" >&2; return 1; }
  local -A map
  local key val
  # Legacy single-color fields
  for key in fg bg red green yellow cyan magenta orange blue; do
    val="$(sed -n "s/^ *$key \"\(#[0-9a-fA-F]\{6\}\)\".*/\1/p" "$theme_file" | head -n1)"
    map[$key]="$val"
  done
  # Block fields given as "R G B" triples
  __zjtheme_block() {
    local r g b
    sed -n "/^ *$1 {/,/}/p" "$theme_file" | sed -n "s/^ *$2 \([0-9]\+\) \([0-9]\+\) \([0-9]\+\).*/\1 \2 \3/p" | head -n1 |
      { read -r r g b && printf '#%02x%02x%02x' "$r" "$g" "$b"; }
  }
  map[surface]="$(__zjtheme_block ribbon_unselected background)"
  map[muted]="$(__zjtheme_block frame_unselected base)"
  unset -f __zjtheme_block
  for key in "${!map[@]}"; do
    [ -n "${map[$key]}" ] || { echo "zjtheme: theme missing color: $key" >&2; return 1; }
  done
  # Dracula hex -> role in the template
  local out
  out="$(sed \
    -e "s/#282a36/@bg@/g" -e "s/#f8f8f2/@fg@/g" -e "s/#44475a/@surface@/g" \
    -e "s/#6272a4/@muted@/g" -e "s/#bd93f9/@blue@/g" -e "s/#50fa7b/@green@/g" \
    -e "s/#ff5555/@red@/g" -e "s/#8be9fd/@cyan@/g" -e "s/#ffb86c/@orange@/g" \
    -e "s/#f1fa8c/@yellow@/g" -e "s/#ff79c6/@magenta@/g" "$tmpl")"
  for key in "${!map[@]}"; do
    out="${out//@$key@/${map[$key]}}"
  done
  printf '%s\n' "$out" >"$cfg/layouts/default.kdl"
  sed -i "s/^theme \".*\"/theme \"$name\"/" "$cfg/config.kdl"
  echo "zjtheme: switched to $name (restart zellij to apply)"
}
