# This plugin adds `clearestate` shell commands.

## Installation

```sh
git clone https://github.com/pkboom/zsh-clearestate.git $ZSH_CUSTOM/plugins/clearestate
```

Add the plugin in `~/.zshrc`

```sh
plugins=(... clearestate)
```

Update the shell

```
source ~/.zshrc
```

## Usage

```sh
# Show all commands
$ce<space><tab>

# Show all commands starting with `mig`
$ce mig<tab>
```

<img src="/screenshot-ce.png" width="800"  title="demo">
