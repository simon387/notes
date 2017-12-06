#include <File.au3>
Global $input_dir = "D:\Dark Age of Camelot\"
Global $avi_dir = "D:\outAVI\"
Global $output_dir = "D:\outDeploy\"
;Local $par =  "-vcodec mpeg4 -acodec ac3 -ar 48000 -ab 192k -ac 6 -sameq"
Global $par_mp4toAvi =  "-vcodec mpeg4 -acodec ac3 -ar 48000 -ab 192k -ac 6 -qscale 0"
Global $par_comp = "-c:v mpeg4 -vtag xvid -qscale:v 3 -c:a libmp3lame -qscale:a 4"
$par = "-vcodec libx264 -crf 20"
Global $ffmpeg = @scriptdir & '\ffmpeg.exe'

;main
;mp4toAvi()
comp()

Func mp4toAvi()
   Local $aFileList = _FileListToArray($input_dir, "*.mp4", 1)
   For $i = 1 To $aFileList[0]
	  Local $out_file = StringReplace($aFileList[$i], ".mp4", ".avi")
	  Local $par = '-i "' & $input_dir & $aFileList[$i] & '" ' & $par_mp4toAvi & ' "' & $avi_dir & $out_file & '"'
	  ConsoleWrite($par & @CRLF)
	  ShellExecuteWait($ffmpeg, $par, @scriptdir)
   Next
EndFunc

Func comp()
   Local $aFileList = _FileListToArray($avi_dir, "*.avi", 1)
   For $i = 1 To $aFileList[0]
	  Local $out_file = $aFileList[$i]
	  Local $par = '-i "' & $avi_dir & $aFileList[$i] & '" ' & $par_comp & ' "' & $output_dir & $out_file & '"'
	  ConsoleWrite($par & @CRLF)
	  ShellExecuteWait($ffmpeg, $par, @scriptdir)
   Next
EndFunc
