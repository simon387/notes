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
