## 👋 Welcome to zellij 🚀  

 Install configurations for zellij  
  
  
### Requires scripts to be installed

```shell
sudo bash -c "$(curl -q -LSsf "https://github.com/dfmgr/installer/raw/main/install.sh")" && sudo dfmgr install installer
```

OR

### Automatic install/update  

```shell
dfmgr update zellij
```
  
### requirements  
  
#### Debian based

```shell
apt install zellij
```  

#### Fedora Based

```shell
yum install zellij
```  

#### Arch Based

```shell
pacman -S zellij
```  

#### MacOS  

```shell
brew install zellij
```
  
#### Manual install  

```shell
APPDIR="$HOME/.local/share/CasjaysDev/dfmgr/zellij"
mv -fv "$HOME/.config/zellij" "$HOME/.config/zellij.bak"
git clone https://github.com/dfmgr/zellij "$APPDIR"
cp -Rfv "$APPDIR/etc/." "$HOME/.config/zellij/"
[ -d "$APPDIR/bin" ] && cp -Rfv "$APPDIR/bin/." "$HOME/.local/bin/"
```

## Author  

⛵ dfmgr: [Github](https://github.com/dfmgr) ⛵  
🤖 casjay: [Github](https://github.com/casjay) 🤖  

## Links

<p align=center>
   <a href="https://travis-ci.com/github/dfmgr/zellij" target="_blank" rel="noopener noreferrer">
     <img src="https://travis-ci.com/dfmgr/zellij.svg?branch=master" alt="Build Status"></a><br />
  <a href="https://wiki.archlinux.org/index.php/zellij" target="_blank" rel="noopener noreferrer">zellij wiki</a>  |  
  <a href="zellij" target="_blank" rel="noopener noreferrer">zellij site</a>
</p>  
