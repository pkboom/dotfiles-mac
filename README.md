### [Setting up your Mac](https://github.com/driesvints/dotfiles#setting-up-your-mac)

1. [Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```zsh
   curl https://raw.githubusercontent.com/pkboom/dotfiles-mac/master/ssh.sh | sh -s "<your-email-address>"
   ```

1. Clone this repo to `~/.dotfiles` with:

   ```zsh
   git clone git@github.com:pkboom/dotfiles-mac.git ~/.dotfiles
   ```

1. Run the installation with:

   ```zsh
   ~/.dotfiles/fresh.sh
   ```

1. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
1. Restart your computer to finalize the process

### [Connecting to GitHub with SSH](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)

[Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

```zsh
curl https://raw.githubusercontent.com/pkboom/dotfiles-mac/master/ssh.sh | sh -s
```
