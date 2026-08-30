# AGENTS.md — AI Agent Guidelines & Repository Architecture

Welcome, AI agent! This document defines the rules, architecture, and coding conventions for working in this dotfiles repository. Follow these guidelines strictly to ensure configurations remain portable, maintainable, and clean across multiple machines.

---

## 1. Repository Architecture: GNU Stow

This dotfiles repository is organized for management with **GNU Stow**.

### How GNU Stow Works Here
- Each directory at the root level is a **Stow package** (e.g. `alacritty`, `mango`, `zsh`, `nvim`, `bash`, `bin`).
- Files within each package directory mirror their target path relative to `$HOME`.
  - Example: `alacritty/.config/alacritty/alacritty.toml` symlinks to `~/.config/alacritty/alacritty.toml`.
  - Example: `bash/.bashrc` symlinks to `~/.bashrc`.
  - Example: `bin/.local/bin/auto_conserve.sh` symlinks to `~/.local/bin/auto_conserve.sh`.

### Critical Rules for File Management:
1. **Never place loose configuration files at the repository root.**
2. When modifying an existing config, locate its parent stow package folder.
3. When adding support for a new application or tool:
   - Create a dedicated top-level directory matching the package name (e.g. `rofi/`, `yazi/`).
   - Replicate the exact sub-path expected in `$HOME` (typically `.config/<app>/...`).

---

## 2. Multi-Laptop & Machine Portability

These dotfiles are deployed across multiple laptops (predominantly Lenovo systems) running Linux (Wayland compositors). Configurations must remain portable across different hardware models.

### Portability Guidelines:
- **No Hardcoded Machine Identifiers**: Avoid hardcoding single-laptop ACPI paths, device serials, or single-monitor output IDs unless placed in machine-local override files.
- **Dynamic Hardware Detection**: Shell scripts targeting hardware features (such as Lenovo battery conservation mode) must dynamically discover sysfs paths (e.g., searching `/sys/bus/platform/drivers/ideapad_acpi/` or `/sys/class/power_supply/BAT*/charge_control_end_threshold`).
- **Defensive Shell Initializations**: Tools (`starship`, `zoxide`, `fnm`, `bun`, `pnpm`, `fzf`) may not be installed on all machines. Always check tool availability before invoking:
  ```bash
  if command -v <tool> &>/dev/null; then
    eval "$(<tool> init zsh)"
  fi
  ```
- **No Distro-Specific Lockout Packages**: Do not add distro-specific dummy packages.

---

## 3. Desktop Environments & Window Managers

### Supported Compositors
- **Mango** (`mango/`) — Primary tiling/scroller Wayland compositor.
- **Niri** (`niri/`) — Scrollable-tiling Wayland compositor.
- **Hyprland** (`hypr/`) — Dynamic tiling Wayland compositor.
- **Sway** (`sway/`) & **i3** (`i3/`) — Traditional manual tiling.

### DankMaterialShell (DMS) Integration
- **DMS** (`DankMaterialShell/`, `danksearch/`, `environment.d/`) provides UI, styling, and spotlight functionality.
- DMS generates runtime configuration fragments (e.g. inside `mango/.config/mango/dms/` or `hypr/.config/hypr/dms/`).
- Only commit user-defined customizations, custom window rules, keybindings, and theme settings. Avoid tracking temporary runtime caches.

---

## 4. Shell, Terminals, & CLI Conventions

### Shell Configuration
- **Primary Shell**: `zsh` (configured in `zsh/.zshrc` and `zsh/.zshenv`).
- **Secondary Shell**: `bash` (maintained in `bash/.bashrc` and `bash/.profile`).
- **Terminal Default**: All terminal emulators (`alacritty`, `kitty`, `foot`, `ghostty`) should explicitly configure `/usr/bin/zsh` as their shell/command.

### Common Aliases & Core Utilities
- `ls` -> `eza --icons=always --color=always --group-directories-first`
- `cat` -> `bat`
- `vi` / `ci` -> `nvim`
- `cd` / `cdi` -> `zoxide` (`z` / `zi`)
- `lgit` -> `lazygit`
- `npm` -> `pnpm`

---

## 5. Editor & Development Environment

- **Neovim** (`nvim/.config/nvim/`): Configured with LazyVim, Blink CMP, Treesitter, and Mason.
  - When modifying plugins, update files under `nvim/.config/nvim/lua/plugins/`.
  - Always commit the matching `lazy-lock.json` when plugin versions change.

---

## 6. Safety & Git Practices for AI Agents

1. **Syntax Checking**: Before committing shell scripts or config changes, validate syntax:
   ```bash
   bash -n <script.sh>
   ```
2. **Never Commit Secrets**: Do not commit API keys, personal tokens, SSH private keys, or `.env` files.
3. **Semantic Commit Messages**: Use clear, conventional commit prefixes:
   - `feat:` new tool configurations or major feature setups.
   - `fix:` bug fixes in scripts or broken configurations.
   - `refactor:` reorganizing configs or improving portability.
   - `chore:` maintenance, dependency lock updates, or cleanup.
