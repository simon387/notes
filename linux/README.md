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
+ chkrootkit
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
+ wondershaper
+ youtube-dl

## usefull paths

+ repository file conf ```/etc/yum.repos.d```
+ system info ```/proc/```
+ file host ```/etc/hosts```
+ applications data ```~/.local```
+ boxes images ```~/.local/share/gnome-boxes```
+ example of where to put aliass and startup scripts ```~/.bash_profile  ~/.bashrc```
+ where to put desktop entry files ```/usr/share/applications```

  es:
  ```bash
  [Desktop Entry]
  Name=intellij
  Exec=sh /opt/idea-IC-173.3727.127/bin/idea.sh
  Terminal=false
  Type=Application
  Categories=GTK;GNOME;Utility;
  Icon=/opt/idea-IC-173.3727.127/bin/idea.png
  ```
## example of one way to develop gnome application with javascript!

1. dnf install glade
1. dnf install gjs
1. create a window with glade and save in on a ```helloworld.glade```
1. create a new file
  ```javascript
  #!/usr/bin/gjs
  
  const Lang = imports.lang;
  const Gtk = imports.gi.Gtk;
  
  const HelloWorld = new Lang.Class({
      Name: 'HelloWorld',
  
      _init: function() {
          this.application = new Gtk.Application();
          this.application.connect('activate', Lang.bind(this, this._onActivate));
          this.application.connect('startup', Lang.bind(this, this._onStartup));
      },
  
      _onActivate: function(){
          this._window.show_all();
      },
  
      _onStartup: function() {
          let builder = new Gtk.Builder();
          builder.add_from_file('helloworld.glade');
          this._window = builder.get_object('window1');
          this.application.add_window(this._window);
      }
  });
  
  let app = new HelloWorld();
  app.application.run(ARGV);
  ```
5. save it ```hellowordl.js```
5. make it executable ```chmod +x helloworld.js```
5. run it ```./helloworld.js```
