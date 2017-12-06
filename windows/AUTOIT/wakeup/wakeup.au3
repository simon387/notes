#include <bass.au3>
#include <guiconstantsex.au3>

If @HOUR < 9 Then
	_Bass_Startup()
	_BASS_Init(0, -1, 44100, 0, '')
	_Bass_SetVolume(1)
	_BASS_Free()
	Run('C:\Program Files (x86)\VideoLAN\VLC\vlc.exe --volume=256 file.mp3', "", @SW_SHOW)
EndIf