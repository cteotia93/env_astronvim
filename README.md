# env_astronvim
This repository contains configuration for neovim coupled with astronvim. 

# Setup on windows environment 

## font management:
The default windows fonts isn't supported in neovim, icons don't appear like they should along with other issues. 
Install one of the fonts available as part of  [nerd-font](https://www.nerdfonts.com/font-downloads) and configure your terminal to use that font once available.

## Installation of nvim

Download the latest version [nvim-win64.msi/zip](https://github.com/neovim/neovim/releases)
Install nvim in a repository of your username for instance: C:\Users\cteotia\Neovim
Specifically in windows, Main installation of nvim goes into admin's account, can be referred from other accounts as well. Load nvim command works like a charm :>

## Installation of astronvim

Refer to [astronvim](https://docs.astronvim.com/) page for astronvim project inclusion:

We need to backup the existing data: 

Move existing nvim and nvim-data folders to nvim.bak and nvim-data.bak for nvim and nvim-data folders respectively:

```powershell
mv $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
mv $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

Now, once the backup is available, we need to get the astronvim configuration template locally in admin's localappdata folder:

```powershell
git clone --depth=1 https://github.com/Astronvim/template $env:LOCALAPPDATA\nvim

```
Existing configuration can be moved to other user's directory as well. 
That way the user would be able to load the astronvim configs of its account 
Folders to move are $env:LOCALAPPDATA\local\nvim and $env:LOCALAPPDATA\local\nvim-data

```powershell
mv $env:LOCALAPPDATA\nvim C:\Users\user-abc\appdata\local\nvim
mv $env:LOCALAPPDATA\nvim-data C:\Users\user-abc\appdata\local\nvim-data
```

After moving nvim, nvim-data to your user account's appdata folder (user-abc\appdata\local), load the terminal for that user and type nvim from your desired location, bam!, your neovim and astronvim folders are loaded.
NOTE: The Neovim installation should stay at the elevated account location, defer from moving it out to a specific folder.

Remove the git reference to setup your's later to load custom configs from remote.
```powershell
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
```

## Installation of git:

Download Git [exe](https://git-scm.com/downloads) and install git, preferably in C:\git to avoid any conflicts.

## Installing Supporting tools used by LSP

### Installing python and npm in Windows
Open nvim, which should load astronvim configurations automatically.
To install LSP tools and Linters, we need supporting tools: python and npm
npm comes bundled with node.js. So, installing [node.js](https://nodejs.org/en) automatically installs the npm as it includes npm install by default. 
node.js validation commands are as follows:
```powershell
# check node and npm versions
node -v
npm -v
# upgrade npm - if necessary
npm install -g npm
```

Scripted method to install npm is using the chocolaty npm installation using powershell [link](https://vocon-it.com/2019/11/19/install-npm-using-chocolatey-on-windows/)
NOTE: You need to set execution policy to AllSigned in order to run the npm chocolatey installation using powershell.

Install [python](https://www.python.org/downloads/windows/) after downloading the latest supported release.

### Installation of LSP's:

1) Installing linters using mason directly:

Inside astronvim, type ":Mason"
1- All, 2-LSP, 3-DAP, 4-Linter, 5-Formatter
2 -> ansible-language-server
4-> yamllint, codespell
5-> blackd-client, jq
init.nvim: custom configuration(if any)
lua/plugins/plugin.lua: to install plugins using lua config files

2) Create own user configuration:
Clone astronvim template to user dir:
```shell
git clone https://github.com/AstroNvim/template ~/.config/nvim/lua/{user}
```

Manually edit the configuration from init.lua:
```bash
mkdir ~/.config/nvim/lua/{user}
touch ~/.config/nvim/lua/{user}/init.lua
return {
  plugins = {
    init = {
      -- Example plugin
      { "tpope/vim-sleuth" },
    },
  },
}
```

3) If you want to load the configs with init.lua plugins

mason.lua automation:
-- ~/.config/nvim/lua/user/mason.lua
return {
  ensure_installed = {
    "lua-language-server",
    "yaml-language-server",
    "bash-language-server",
    "pyright",
    "black",
    "prettier",
    "stylua",
    "yamllint",
  },
}
:Lazy Sync
:MasonInstallAll
:AstroUpdate

# Installation in debian:

## font management: 
When configuring in ssh tools like putty, we need to manage fonts separately. To manage fonts follow below instructions:
Default windows fonts support is absent in neovim, icons don't appear like they should along with other issues. 
Install [nerd-font](https://www.nerdfonts.com/font-downloads) and configure your terminal to use that font once available.

## Dependencies installation:
Dependency installation before installing neovim:
```bash
sudo apt update
sudo apt install -y \
curl git wget unzip \
build-essential cmake ninja-build \
ripgrep fd-find \
python3 python3-pip \
nodejs npm
sudo apt install ninja-build gettext cmake unzip curl build-essential
```

## Neovim installation:
Installation commands:
```bash
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
nvim --version
```

Move existing configuration to nvim.bak:
```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null
mv ~/.local/state/nvim ~/.local/state/nvim.bak 2>/dev/null
mv ~/.cache/nvim ~/.cache/nvim.bak 2>/dev/null
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim
```
Typing nvim should load the configurations automatically

## Installing Supporting tools used by LSP

### Installing python and npm in Debian
Open nvim, which should load astronvim configurations automatically.
To install LSP tools and Linters, we need supporting tools: python and npm
npm comes bundled with node.js. So, installing [node.js](https://nodejs.org/en) automatically installs the npm as it includes npm install by default. 
node.js validation commands are as follows:
```shell
# Installing using curl as we need to manage multiple versions:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install --lts
nvm use --lts
# check node and npm versions
node -v
npm -v
# upgrade npm - if necessary
npm install -g npm
```
Install [python](https://www.python.org/downloads/debian) after downloading the latest supported release.
1. Install dependencies
```shell
sudo apt update
sudo apt install -y \
  python3 \
  python3-pip \
  python3-venv \
  python3-dev \
  build-essential \
  libssl-dev \
  libffi-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  zlib1g-dev \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  curl \
  git
```
2. Check Installed Version
```bash
python3 --version
pip3 --version
```
3. Use venv for Project Isolation
```bash
python3 -m venv .venv
source .venv/bin/activate
```
4. Install project specific packages
```bash
pip install black flake8 isort pytest
```

### Installation of LSP's:

1) Installing linters using mason directly:

Inside astronvim, type ":Mason"
1- All, 2-LSP, 3-DAP, 4-Linter, 5-Formatter
2 -> ansible-language-server
4-> yamllint, codespell
5-> blackd-client, jq
init.nvim: custom configuration(if any)
lua/plugins/plugin.lua: to install plugins using lua config files

2) Create own user configuration:
clone astronvim template to user dir:
git clone https://github.com/AstroNvim/template ~/.config/nvim/lua/{user}
do it manually:
mkdir ~/.config/nvim/lua/{user}
touch ~/.config/nvim/lua/{user}/init.lua
minimal init.config:
return {
  plugins = {
    init = {
      -- Example plugin
      { "tpope/vim-sleuth" },
    },
  },
}

3) If you want to load the configs with init.lua plugins

mason.lua automation:
-- ~/.config/nvim/lua/user/mason.lua
return {
  ensure_installed = {
    "lua-language-server",
    "yaml-language-server",
    "bash-language-server",
    "pyright",
    "black",
    "prettier",
    "stylua",
    "yamllint",
  },
}
:Lazy Sync
:MasonInstallAll
:AstroUpdate
