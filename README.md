# dotfiles

Personal dotfiles for macOS.

## Structure

- `.zshrc` — zsh config (symlinked to `~/.zshrc`)
- `iterm2/` — iTerm2 Dynamic Profiles (symlinked to `~/Library/Application Support/iTerm2/DynamicProfiles`)
- `launchdaemons/` — LaunchDaemon plists (manually copied to `/Library/LaunchDaemons/`)

## Setup on a new machine

```sh
git clone git@github.com:nickagliano/dotfiles.git ~/.dotfiles

# zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# iTerm2 Dynamic Profiles
rm -rf ~/Library/Application\ Support/iTerm2/DynamicProfiles
ln -s ~/.dotfiles/iterm2 ~/Library/Application\ Support/iTerm2/DynamicProfiles

# tailscaled (requires sudo)
sudo cp ~/.dotfiles/launchdaemons/com.tailscale.tailscaled.plist /Library/LaunchDaemons/
sudo launchctl load /Library/LaunchDaemons/com.tailscale.tailscaled.plist
```
