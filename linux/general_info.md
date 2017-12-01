# general info

Random linux infos collection (mainly from fedora/redhat/centosOS)

There are other software examples too, like git, ffmpeg, npm etc..

[Commands examples](https://github.com/simon387/notes/blob/master/linux/linux_cmd.md)

## run a graphic program from ssh

Sometime just works with 

```bash
export DISPLAY=:0
<cmd>
```

and then this can help

```bash
(setsid <cmd> &)
```

## favourite softwares

+ byobu
+ chrome
+ chrootkit
+ clamav clamtk
+ code (visual studio code)
+ feh
+ filezilla
+ fslint

  find duplicate files
+ gimp
+ htop
+ opera
+ rkhunter
+ stress
+ terminator
+ thunderbird
+ trash-cli
+ youtube-dl

## usefull paths

+ repository file conf ```/etc/yum.repos.d```
+ system info ```/proc/```
+ file host ```/etc/hosts```
+ applications data ```~/.local```
+ boxes images ```~/.local/share/gnome-boxes```
+ example of where to put aliass and startup scripts ```~/.bash_profile  ~/.bashrc```
+ where to put desktop entry files ```/usr/share/applications```
