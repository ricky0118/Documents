# Install python version manager
Use pyenv as python version manager.
## Install Homebrew
Install [`Homebrew`](https://brew.sh) to download pyenv.
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install pyenv by Homebrew
```sh
brew install pyenv
```

## Setup the shell environment for pyenv
Add the following command to `.bashrc` to setup the PATH environment.
```sh
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
```

## Optional. Install and Setup pyenv-virtualenv
Install `pyenv-virtualenv` by Homebrew.
```sh
brew install pyenv-virtualenv
```
Add the following command in `.bashrc` file.
```sh
eval "$(pyenv virtualenv-init -)"
```

# Reference
1. [Pyenv page on Github](https://github.com/pyenv/pyenv#homebrew-in-macos)
2. [Pyenv-virtualenv page on Github](https://github.com/pyenv/pyenv-virtualenv)

