# remote-installers
Just a repo with ways to install some common utils into remote environments without requiring root privileges.

### Setup console colors
Adds colors to b&w consoles. Should do this first so it doesn't interfere with conda activate and others.
```bash
echo 'export PS1="\[\e[1;31m\][\[\e[m\]\[\e[033;1;92m\]\u\[\e[m\]@\[\e[033;1;90m\]\h\[\e[m\] \[\e[033;1;94m\]\w\[\e[m\]\[\e[1;31m\]]\[\e[m\]\\$ "' >> ~/.bashrc
source ~/.bashrc
```

### Create bin
Creates some folders for putting programs in.
```bash
mkdir ~/software
mkdir ~/software/bin
```

### Add ~/software/bin to path
```bash
echo 'export PATH="~/software/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### Install unzip
For really restricted environments where unzip isn't available.

```bash
wget https://oss.oracle.com/el4/unzip/unzip.tar
tar xf unzip.tar
mv unzip ~/software/bin
rm unzip*
```

### Miniconda 3
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p ~/miniconda3
rm Miniconda3-latest-Linux-x86_64.sh
~/miniconda3/bin/conda init
echo 'conda activate base' >> ~/.bashrc
source ~/.bashrc
```

### git
Enables using a more recent version of git when inside conda's base env.

```
conda activate base
conda install git
```

### cheat

```bash
mkdir ~/software
mkdir ~/software/bin
wget https://github.com/cheat/cheat/releases/download/4.2.3/cheat-linux-amd64.gz
gzip -d cheat-linux-amd64
chmod +x cheat-linux-amd64
mv cheat-linux-amd64 $HOME/software/bin/cheat
rm cheat*
```

### rclone

```bash
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone-current-linux-amd64.zip
cp rclone-*-linux-amd64/rclone ~/software/bin
rm -r rclone-*-linux-amd64
rm rclone-current-linux-amd64.zip
```

### tldr
Installs tldr into the base conda environment, to avoid the npm requirement.

```bash
conda activate base
pip install tldr
```

Alternatively, if pip3 is available (python should be >= 3.6):

```bash
pip3 install tldr
echo 'export PATH="~/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### tldr color edit (npm ver.)
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

--------------------------------

# BONUS:

### Run a detached command using nohup, writing both stdout and stderr to the output:

```bash
nohup [command] [args]  > [logfile_name].out 2>&1 &
```
