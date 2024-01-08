## Linux

### Scale UI
Create ~/.Xresources file and add the following line  
```
# default value 96, this line scales everything 125% (96*1.25)
Xft.dpi: 120
```
### Configure monitors
Create ~/.xprofile with the following line  
```
# This sets the external monitor with the max resolution & refresh rate, and turns off the laptop monitor
# This is required for the current multiport adapter
xrandr --output DisplayPort-1 --mode 3440x1440 --rate 59.97 --output eDP --off
```

### Mise
[Mise](https://mise.jdx.dev) replace the need for nvm and gvm.  
Install with brew  
In order to ignore the .mise.toml files globally do the following   
```
# link .gitignore file from dotfiles
ln -s $DOTFILES/.gitignore ~/.gitignore

# set .gitignore file in global config
git config --global core.excludesfile ~/.gitignore

# if need to add it to a project
git add --force .mise.toml
```
