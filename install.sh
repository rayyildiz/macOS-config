#!/usr/bin/env bash

set -euo pipefail

# =========================================
# macOS Setup Script — Brewfile Installer
# =========================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREWFILE="$SCRIPT_DIR/Brewfile"

# ---- Colors ----
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# ---- Helpers ----
info()    { echo -e "${CYAN}${BOLD}[INFO]${RESET}  $*"; }
success() { echo -e "${GREEN}${BOLD}[OK]${RESET}    $*"; }
warn()    { echo -e "${YELLOW}${BOLD}[WARN]${RESET}  $*"; }
error()   { echo -e "${RED}${BOLD}[ERROR]${RESET} $*" >&2; }
die()     { error "$*"; exit 1; }

separator() {
  echo -e "${BOLD}--------------------------------------------------${RESET}"
}

# ---- Checks ----

check_macos() {
  if [[ "$(uname)" != "Darwin" ]]; then
    die "This script is intended for macOS only."
  fi
  success "macOS detected: $(sw_vers -productVersion)"
}

check_brewfile() {
  if [[ ! -f "$BREWFILE" ]]; then
    die "Brewfile not found at: $BREWFILE"
  fi
  success "Brewfile found: $BREWFILE"
}

# ---- Homebrew ----

install_homebrew() {
  separator
  if command -v brew &>/dev/null; then
    success "Homebrew is already installed: $(brew --version | head -1)"
  else
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    # Add Homebrew to PATH for Intel
    elif [[ -f "/usr/local/bin/brew" ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    fi

    success "Homebrew installed successfully."
  fi
}

update_homebrew() {
  separator
  info "Updating Homebrew..."
  brew update
  success "Homebrew updated."
}

# ---- Brewfile ----

run_brewfile() {
  separator
  info "Running: brew bundle --file=\"$BREWFILE\""
  echo ""

  if brew bundle --file="$BREWFILE" --verbose; then
    echo ""
    success "All Brewfile packages installed successfully."
  else
    echo ""
    warn "Some packages may have failed to install."
    warn "Run 'brew bundle check --file=\"$BREWFILE\"' to see what is missing."
    exit 1
  fi
}

# ---- Cleanup (optional) ----

cleanup() {
  separator
  info "Running brew cleanup to free up disk space..."
  brew cleanup
  success "Cleanup complete."
}

# ---- Summary ----

print_summary() {
  separator
  echo -e "${GREEN}${BOLD}"
  echo "  ✅  macOS setup complete!"
  echo ""
  echo "  Installed via Brewfile:"
  echo "    • $(brew bundle list --brews  --file="$BREWFILE" 2>/dev/null | wc -l | tr -d ' ') formulae"
  echo "    • $(brew bundle list --casks  --file="$BREWFILE" 2>/dev/null | wc -l | tr -d ' ') casks"
  echo -e "${RESET}"
  separator
}

# ---- Entrypoint ----

main() {
  echo ""
  echo -e "${BOLD}==========================================${RESET}"
  echo -e "${BOLD}   macOS Brewfile Installer               ${RESET}"
  echo -e "${BOLD}==========================================${RESET}"
  echo ""

  check_macos
  check_brewfile
  install_homebrew
  update_homebrew
  run_brewfile
  cleanup
  print_summary
}

main "$@"
