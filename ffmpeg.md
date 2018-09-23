# ffmpeg

## facebook optimal video settings

```ffmpeg -i INPUTFILE -map 0:v -an -c:v dnxhd -pix_fmt yuv422p -trellis 0 -profile:v dnxhr_lb -y OUTPUTFILE.mov```

## facebook custom video settings

```ffmpeg -i input -c:v libx264 -crf 18 -preset slow -c:a copy output.mkv```

## stackoverflow

```ffmpeg -i input.avi -c:v libx264 -preset slow -crf 22 -c:a copy output.mkv```

## cut

from second "3" cutting 8 seconds (omitting -t will continue to the end)

(-t is the duration)

```ffmpeg -i movie.mp4 -ss 00:00:03 -t 00:00:08 -async 1 cut.mp4```

or

```ffmpeg -i movie.mp4 -ss 00:00:03 -t 00:00:08 -async 1 -strict -2 cut.mp4```

or (faster) (windows example with MINGW64)

```./ffmpeg.exe -ss 00:10:43 -i /c/Users/Simon/Desktop/GP011187.MP4 -t 00:03:59 -c copy cut.mp4```


## extract audio from video

```ffmpeg -i video.mp4 -b:a 192K -vn music.mp3```

## convert audio format

```ffmpeg -i input.wav -vn -ar 44100 -ac 2 -ab 192k -f mp3 output.mp3```

