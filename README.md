<div align="center">
  <img src="https://i.imgur.com/eQ4FLtV.png" width="64">
  <h1 align="center">License</h1>
  <p align="center">Choose your open source project license</p>
</div>

<br/>

<div align="center">
   <a href="https://github.com/linuxhubsubpixel/license/blob/master/LICENSE">
    <img src="https://img.shields.io/badge/License-GPL--3.0-blue.svg">
   </a>
</div>

<div align="center">
    <img  src="https://github.com/linuxhubsubpixel/license/raw/master/data/screenshot-1.png"> <br>
    <img  src="https://github.com/linuxhubsubpixel/license/raw/master/data/screenshot-2.png">
</div>

## Problems/New Features?
Open a new Issue [here](https://github.com/linuxhubsubpixel/license/issues).

## How to run
```bash
com.github.linuxhubsubpixel.license
```

## Known bugs
- Minimum delay during application start

## Installation

### From PPA
Configure PPA:
```bash
curl -s --compressed "https://linuxhubit.github.io/ppa/KEY.gpg" | sudo apt-key add -
sudo curl -s --compressed -o /etc/apt/sources.list.d/my_list_file.list "https://linuxhubit.github.io/ppa/my_list_file.list"
sudo apt update
```
then install:
```bash
sudo apt install com.github.linuxhubit.license
```

### From .deb package
Grab an updated release [here](https://github.com/linuxhubsubpixel/license/releases), then install:

```bash
sudo dpkg -i com.github.linuxhubsubpixel/license_*.deb
```

## Build
```bash
meson build --prefix=/usr
cd build
ninja
sudo ninja install
```