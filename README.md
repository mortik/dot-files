# DotFiles

## Dependencies
```
brew install git bash-completion ansible hub michaeldfallen/formula/git-radar
```

## BashFiles
```
ln -s ~/.dotfiles/.bashrc ~/
ln -s ~/.dotfiles/.bash_aliases ~/
ln -s ~/.dotfiles/.bash_profile ~/
ln -s ~/.dotfiles/.bash_prompt ~/
```

## git
```
ln -s ~/.dotfiles/.gitignore_global ~/
ln -s ~/.dotfiles/.gitmessage.txt ~/
```

## others
```
ln -s ~/.dotfiles/.tigrc ~/
```


## local bash and gitconfig
bash_local.tmp and gitconfig.tmp a just examples. Copy them to your $HOME dir and make changes accordingly. Make also sure you add your github token like this:
```
git config --global github.token ${your-token}
```
