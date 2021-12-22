# Installing zsh without root access

```bash
wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download --no-check-certificate
mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
cd zshremote-installers
./configure --prefix=$HOME
make
make install
```

# Making zsh the default shell

```echo 'if test -t 1;' >> ~/.bashrc
echo '  then exec zsh' >> ~/.bashrc
echo 'fi' >> ~/.bashrc
```

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

We can do the following manually:
```
plugins=(git history jsontools z zsh-syntax-highlighting zsh-autosuggestions)
ZSH_THEME="powerlevel10k/powerlevel10k"
```
Use history with ```hsi``` and jsontools with ```json_pp``` and [more](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jsontools)


# Add user bin to path
```
echo "path+='~/bin'" >> ~/.zshrc
echo "path+='~/.local/bin'" >> ~/.zshrc
```

# Replace ~/.p10k.sh with the file provided in this repository

Pretty straightforward


# Reload zsh and apply all changes using either:

```omz reload``` or ```exec zsh```


