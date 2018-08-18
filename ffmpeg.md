# ffmpeg

## facebook optimal video settings

```ffmpeg -i INPUTFILE -map 0:v -an -c:v dnxhd -pix_fmt yuv422p -trellis 0 -profile:v dnxhr_lb -y OUTPUTFILE.mov```

## facebook custom video settings

```ffmpeg -i input -c:v libx264 -crf 18 -preset slow -c:a copy output.mkv```
