# Installing zsh without root access

Add the following to .bashrc:

```bash
export TERM=xterm-color
export CXXFLAGS="-fPIC"
export CFLAGS="-fPIC"
export NCURSES_HOME=$HOME/.local/ncurses # here is ncurses directory of home directory. You can set your own path
export PATH=$NCURSES_HOME/bin:$PATH
export LD_LIBRARY_PATH=$NCURSES_HOME/lib:$LD_LIBRARY_PATH
export CPPFLAGS="-I$NCURSES_HOME/include" LDFLAGS="-L$NCURSES_HOME/lib"
```
Now install ncurses:

```bash
wget ftp://ftp.invisible-island.net/ncurses/ncurses.tar.gz
tar -zxvf ncurses*
cd ncurses-*
./configure --prefix=$NCURSES_HOME --with-shared --without-debug --enable-widec  
make
make install
```
And then zsh:

```bash
wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download --no-check-certificate
mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
cd zsh
./configure --prefix=$HOME
make
make install
```



# Making zsh the default shell

```bash
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
echo 'if test -t 1;' >> ~/.bashrc
echo '  then exec zsh' >> ~/.bashrc
echo 'fi' >> ~/.bashrc
```

And now run ```source ~/.bashrc```

# Install oh-my-zsh and plugins

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

# Increase zsh history size

Append the following to lines to ~/.zshrc
```
export HISTFILESIZE=10000000
export HISTSIZE=10000000
```

# Set theme and plugins

We can manually edit the ```~/.zshrc``` file to set up the theme and plugins:
```
plugins=(git history jsontools z zsh-syntax-highlighting zsh-autosuggestions)
ZSH_THEME="powerlevel10k/powerlevel10k"
```
Use history with ```hsi``` and jsontools with ```json_pp``` and [more](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jsontools)


# Add user bin to path
```
echo "path+='$HOME/bin'" >> ~/.zshrc
echo "path+='$HOME/.local/bin'" >> ~/.zshrc
```

# Replace ~/.p10k.sh with the file provided in this repository

Pretty straightforward


# Reload zsh and apply all changes using either:

```omz reload``` or ```exec zsh```

# Install dir-colors solarized for auto-completion colors:

Grab ```dircolors.ansi-universal``` from [here](https://github.com/seebi/dircolors-solarized) and put it in the ```~/.dircolors``` folder, then add to .zshrc:

```
eval `dircolors ~/.dircolors/dircolors.ansi-universal`
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
```
And run:
```
chmod u+r ~/.zshrc
```

# Add fzf

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```


