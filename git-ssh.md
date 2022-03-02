# Git SSH setup

For my workflow, usually I let VSCode handle Git authentication. However, SSH is a great alternative:

## Create key:

```
ssh-keygen -t rsa -b 4096 -C "email@domain.com"
```

In the prompt, set the location+name to be '~/.ssh/github'. This will generate two files: github (private key) and github.pub (public key) in the .ssh folder.

Now, add the contents of the github.pub file as a new key here: https://github.com/settings/keys 

## Config file:

Add the following to the ~/.ssh/config file:

```
Host github.com
        User git
        Hostname ssh.github.com
        Port 443
        IdentityFile ~/.ssh/github
```

## Permissions:

```
chmod 400 ~/.ssh/github
chmod 600 ~/.ssh/github
```

To test access, run the following:

```
ssh -vT git@github.com
```

