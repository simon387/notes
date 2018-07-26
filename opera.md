# opera browswer

## how to fix ffmpeg not rendering Encode/H.264 gif / videos

on linux fedora 28:

```bash
git clone https://github.com/iteufel/nwjs-ffmpeg-prebuilt.git
```

```bash
cd nwjs-ffmpeg-prebuilt/
```

```bash
sudo python build_ffmpeg.py --target_arch=x64
```

locate and replace ```libffmpeg.so``` for opera and/or other softwares

```bash
locate libffmpeg.so
sudo cp /home/scelia/dev/nwjs-ffmpeg-prebuilt/build/src/out/nw/lib/libffmpeg.so /usr/lib64/opera/libffmpeg.so
```

## fix icon on Fedora + Gnome

```bash
sudo vim /usr/share/applications/opera.desktop
```

```
[Desktop Entry]
Version=1.0
Name=Opera
GenericName=Web browser
Comment=Fast and secure web browser
TryExec=opera
Exec=opera %U
Terminal=false
Icon=/home/scelia/Pictures/opera_favicon.ico
```
