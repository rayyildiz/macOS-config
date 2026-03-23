# macOS Config

A personal macOS setup repository for quickly bootstrapping a new machine with all the tools, languages, and applications I use daily — managed via [Homebrew](https://brew.sh).

---

## 📦 What's Included

| File | Description |
|------|-------------|
| `Brewfile` | All Homebrew formulae and casks to install |
| `install.sh` | Automated setup script that installs Homebrew and runs the Brewfile |
| `.editorconfig` | Consistent editor settings across tools |

---

## 🚀 Quick Start

Clone the repository and run the install script:

```sh
git clone https://github.com/rayyildiz/macos-config.git
cd macos-config
chmod +x install.sh
./install.sh
```

The script will:

1. Verify you are running macOS
2. Install **Homebrew** if it is not already present
3. Update Homebrew to the latest version
4. Install all packages defined in the `Brewfile`
5. Run `brew cleanup` to free up disk space
6. Print a summary of what was installed

---

## 🗂 Brewfile Categories

The `Brewfile` is organized into the following sections:

### 🔧 Developer Tools
`git-delta`, `gh`, `neovim`, `just`, `pre-commit`, `ripgrep`, `hugo`, `goreleaser`, `golangci-lint`, `openapi-generator`, `mise`, `trunk`, and more.

### 🗣 Languages, Runtimes & SDKs
`go`, `rustup`, `python@3.12/3.13/3.14`, `openjdk@17/21/25`, `dotnet`, `ruby`, `zig`, `lua`, `node` (via `nvm`), `uv`, `poetry`, and more.

### ☁️ Cloud, Containers & Infrastructure
`docker`, `docker-buildx`, `awscli`, `aws-vault`, `kubernetes-cli`, `terraform-docs`, `tflint`, `tfsec`, `trivy`, `dagger`, `flyctl`, and more.

### 🗄 Databases, Queues & Data Tools
`postgresql@15/16/17/18`, `redis`, `sqlite`, `kafka`, `etcd`, `golang-migrate`, `pgvector`, and more.

### 🖥 CLI Utilities & Shell Tools
`bat`, `eza`, `fzf`, `fd`, `jq`, `htop`, `starship`, `zellij`, `nushell`, `rclone`, `hyperfine`, `oha`, `k6`, `wrk`, and more.

### 🔒 Networking & Security
`curl`, `openssl@3`, `openvpn`, `nmap`, `ca-certificates`, and more.

### 🖼 Media, Graphics & UI
`imagemagick`, `ffmpeg` libraries, `gnuplot`, Qt components, font tooling, and more.

### 📦 Core Libraries & Dependencies
Low-level system libraries required by the tools above (`abseil`, `llvm`, `gcc`, `icu4c`, `openssl`, etc.).

### 🖱 Casks (macOS Apps)

| Category | Apps |
|----------|------|
| **Security** | 1Password CLI, Keystore Explorer |
| **AI Tools** | ChatGPT, Claude |
| **Browsers** | Brave, Google Chrome |
| **Developer** | Ghostty, Lapce, Postman, VS Code, Zed, SceneBuilder |
| **Productivity** | Notion, Microsoft Teams, Zoom |
| **Media** | IINA |
| **Fonts** | Hack Nerd Font |
| **Utilities** | Block Goose, RAR, Sloth |

---

## ⚙️ Requirements

- macOS (Apple Silicon or Intel)
- Internet connection
- `bash` (pre-installed on macOS)

> The script handles Homebrew installation automatically, so no prior Homebrew installation is needed.

---

## 🔄 Keeping Things Up to Date

To update all installed packages:

```sh
brew update && brew upgrade && brew cleanup
```

To check that everything in the Brewfile is still installed:

```sh
brew bundle check --file=Brewfile
```

To reinstall any missing packages:

```sh
brew bundle install --file=Brewfile
```

---

## 📁 Project Structure

```
macos-config/
├── Brewfile          # Homebrew package definitions
├── install.sh        # Setup and installation script
├── .editorconfig     # Editor configuration
├── .gitignore        # Git ignore rules
└── README.md         # This file
```

---

## 📄 License

MIT © 2026 [Ramazan AYYILDIZ](https://github.com/rayyildiz)