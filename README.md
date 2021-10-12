# remote-installers
Just a repo with ways to install some common utils into remote environments without using sudo.


# Create bin
```bash
mkdir ~/software
mkdir ~/software/bin
```

# Add ~/software/bin to path
```bash
echo 'export PATH="~/software/bin:$PATH"' >> ~/.bashrc
```

# Setup console colors
```bash
echo 'export PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "' >> ~/.bashrc
```

# Install unzip
```bash
wget https://oss.oracle.com/el4/unzip/unzip.tar
tar xf unzip.tar
mv unzip ~/software/bin
rm unzip*
```

# Miniconda 3
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p ~/miniconda3
rm Miniconda3-latest-Linux-x86_64.sh
~/miniconda3/bin/conda init

```

# git
Enables using a more recent version of git when inside conda's base env.
```
conda activate base
conda install git
```

# cheat
```bash
mkdir ~/software
mkdir ~/software/bin
wget https://github.com/cheat/cheat/releases/download/4.2.3/cheat-linux-amd64.gz
gzip -d cheat-linux-amd64
chmod +x cheat-linux-amd64
mv cheat-linux-amd64 $HOME/software/bin/cheat
rm cheat*
```

# rclone

```bash
cd ~
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone-current-linux-amd64.zip
cp rclone-*-linux-amd64/rclone ~/software/bin
rm -r rclone-*-linux-amd64
rm rclone-current-linux-amd64.zip
```

# tldr
Installs tldr into the base conda environment, to avoid the npm requirement.

```bash

conda activate base
pip install tldr
```

# tldr color edit (npm ver.)
This works only for tldr installed through npm.

```bash
echo '{
  "themes": {
    "ocean": {
      "commandName": "bold, redBright",
      "mainDescription": "bold, cyanBright",
      "exampleDescription": "blueBright",
      "exampleCode": "yellowBright",
      "exampleToken":"white"
    },
    "red": {
      "commandName": "bold, red",
      "mainDescription": "underline",
      "exampleDescription": "yellow",
      "exampleCode": "underline, green",
      "exampleToken": ""
    }
  },
  "theme": "ocean"
}' > ~/.tldrrc
```
