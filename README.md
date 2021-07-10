# dotfiles

I realized that I should probably start keeping my dotfiles in version control since I've started amassing a pretty serious addiction to customizations and themes and aliases. And I don't want to lose them. And I want to be able to use them across devices.

## .zshrc

## more coming

# Usage
Based on this tutorial: https://www.atlassian.com/git/tutorials/dotfiles

Original setup:
1. git init --bare $HOME/.cfg
2. alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
3. echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zsh/aliases
4. config config --local status.showUntrackedFiles no
5. config add .vimrc + config commit -m "add .vimrc" + set up a remote repository on GitHub or your Git server of choice + config push

Installing from this repo:
1. echo ".cfg" >> .gitignore
2. git clone --bare <remote-git-repo-url> $HOME/.cfg
3. alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
4. config config --local status.showUntrackedFiles no
5. config checkout
