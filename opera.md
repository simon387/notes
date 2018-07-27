# opera browser

## how to fix ffmpeg not rendering Encode/H.264 gif / videos

on linux fedora 28:

1. cloning this repo

```bash
git clone https://github.com/iteufel/nwjs-ffmpeg-prebuilt.git
```

2. compiling it 

```bash
cd nwjs-ffmpeg-prebuilt/
```

```bash
sudo python build_ffmpeg.py --target_arch=x64
```

(or you can find already compiled ones here: [https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases](https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases))

3. locate and replace ```libffmpeg.so``` for opera and/or other softwares

```bash
locate libffmpeg.so
sudo cp /home/scelia/dev/nwjs-ffmpeg-prebuilt/build/src/out/nw/lib/libffmpeg.so /usr/lib64/opera/libffmpeg.so
```

## how to fix icon on Fedora + Gnome

```bash
sudo vim /usr/share/applications/opera.desktop
```

![alt text](https://github.com/simon387/notes/raw/master/assets/kisspng-opera-mobile-computer-icons-web-browser-opera-ico-5ab1b5040a1ba9.5062036715215956520414.png "piccolina!")

```ini
[Desktop Entry]
Version=1.0
Name=Opera
GenericName=Web browser
Comment=Fast and secure web browser
TryExec=opera
Exec=opera %U
Terminal=false
Icon=/home/scelia/Pictures/kisspng-opera-mobile-computer-icons-web-browser-opera-ico-5ab1b5040a1ba9.5062036715215956520414.png
```
