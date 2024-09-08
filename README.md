### Setting up your Mac

> https://github.com/driesvints/dotfiles#setting-up-your-mac

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

### Restore mackup backup

If icloud is synced, run this command to restore configurations.

```zsh
mackup restore
```

### Mackup issue with Sonoma

https://github.com/lra/mackup?tab=readme-ov-file#warning

```sh
mackup backup --force && mackup uninstall --force
mackup restore --force && mackup uninstall --force
```

### iCloud settings

System Prefrences > iCloud > iCloud Drive ( Options ) > uncheck apps (that I don't use)

### Disable cmd + m

https://apple.stackexchange.com/a/125628

### Add keunbae to sudoers

```sh
sudo -i
# sudo -i runs a shell with root privileges and gives you the root environment, i.e. your ~/.bashrc is ignored.
# It acquires the root user's environment.

echo 'keunbae ALL=(ALL) NOPASSWD: ALL' >/etc/sudoers.d/keunbae
```

- keunbae ALL=(ALL:ALL) NOPASSWD: ALL - The first “ALL” indicates that this rule applies to all hosts.
- keunbae ALL=(ALL:ALL) NOPASSWD: ALL - The second “ALL” indicates that keunbae can run commands as all users.
- keunbae ALL=(ALL:ALL) NOPASSWD: ALL - The third “ALL” indicates that keunbae can run commands as all groups.
- keunbae ALL=(ALL:ALL) NOPASSWD: ALL - The last “ALL” indicates these rules apply to all commands.

### Symlink python

```sh
ln -s /opt/homebrew/Cellar/python@3.11/3.11.3/bin/python3 /opt/homebrew/bin/python
```

> Note the version. Change it if necessary.

### Easy move and resize setup

<img src="/images/easymove.png" width="200">

### Download terminal fondt

https://www.jetbrains.com/lp/mono/

Open `Font Book` and drag the unzipped font folder.

### Cron

> https://www.geekbitzone.com/posts/macos/crontab/macos-schedule-tasks-with-crontab/

```sh
crontab -e
```

Schedule

```
# at 9 pm every night
0 21 * * * sh /Users/keunbae/.dotfiles/cron/emptyPhpFpmLog.sh > /dev/null 2>&1

# Every hour
0 * * * * cd /Users/keunbae/code/rendering-ios && /opt/homebrew/opt/node@20/bin/node dev/pingServersCommand.js --mail > /dev/null 2>&1

*/20 * * * * cd /Users/keunbae/code/rendering-ios && /opt/homebrew/opt/node@20/bin/node dev/getQueueAttributeCommand.js --profile inboxmonster_prod --mail > /dev/null 2>&1

# Log
0 * * * * cd /Users/keunbae/code/rendering-ios/dev && /opt/homebrew/bin/node pingServersCommand.js >> /Users/keunbae/code/cron.log 2>&1
```

```sh
which node
# /opt/homebrew/bin/node
```

# Brew

If permission is a problem,

```sh
sudo chown -R $(whoami) $(brew --prefix)/*
```

# Start brew services

```sh
brew services start mysql
brew services start redis
brew services start mailhog
```
