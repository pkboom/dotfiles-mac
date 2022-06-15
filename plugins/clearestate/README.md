# This plugin adds `clearestate` commands.

## Installation

```sh
git clone https://github.com/clearestate/zsh-clearestate.git $ZSH_CUSTOM/plugins/clearestate
```

Add the plugin in `~/.zshrc`

```sh
plugins=(... clearestate)

# Do not put `clearestate` plugin with `nix-shell` plugin together.

plugins=(nix-shell)
```

Update the shell

```
source ~/.zshrc
```

## Usage

```sh
$ce<space><tab>
```

<img src="/screenshot.png" width="800"  title="demo">
