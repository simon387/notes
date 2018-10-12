# general info

Random linux infos collection (mainly from fedora/redhat/centosOS)

There are other software examples too, like git, ffmpeg, npm etc..

[Commands examples](https://github.com/simon387/notes/blob/master/linux/linux_cmd.md)

---

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

---

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

---

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

---

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

---

## example: increasing /home space in a lvm setup

hot one! with out reboot
1. ```vgdisplay```
1. ```lvdisplay```
1. ```lvextend -L +20G /dev/fedora/home```
1. ```resize2fs /dev/fedora/home```

example of gparted error while attemping the resize (wrong method!!)

```
lvm pvresize -v  --setphysicalvolumesize 187342848K '/dev/sdb5'

<i>    Wiping internal VG cache<br />    Wiping cache of LVM-capable devices<br />    Cache: Duplicate VG name fedora: Prefer existing qHFC6M-2tRL-4D5N-YV7g-cZen-rINx-n1qQjh vs new 228Bll-51D5-tGPp-AWKz-veLv-0Zne-ScEZIj<br />    Cache: Duplicate VG name fedora: Prefer existing 228Bll-51D5-tGPp-AWKz-veLv-0Zne-ScEZIj vs new qHFC6M-2tRL-4D5N-YV7g-cZen-rINx-n1qQjh<br />    Archiving volume group &quot;fedora&quot; metadata (seqno 22).<br />/dev/sdb5: Requested size 178,66 GiB is less than real size 236,47 GiB. Proceed?  [y/n]: [n]<br />  Physical Volume /dev/sdb5 not resized.<br /></i>
```

---

## how to know if wayland session is on

+ ```loginctl show-session <YOUR_NUMBER> -p Type```
+ get number from ```loginctl```

---

## connecting to a "pulse secure" VPN

example:

```sudo openconnect --juniper -u=user -p=password -P proxy:port -v https://sslvpn.xxx```

---

## random numbers

```bash
while true; do shuf -i1-100 -n1; sleep 1; done
```

---

## yum/dnf rollback

```bash
> sudo dnf history list | head -6                  # Show last 3 installs/updates

ID     | Command line             | Date a | Action | Altere
-------------------------------------------------------------------------------
   160 | install bleachbit        | 2015-12-29 11:38 | Install        |    1   
   159 | update                   | 2015-12-29 10:10 | Update         |    9   
   158 | update                   | 2015-12-27 10:08 | E, U           |    5   

> sudo dnf history undo 160                        # Undo / roll-back install of bleachbit
```

---

## virtual terminal change

<kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>F1</kbd> / <kbd>F7</kbd>

---

## VirtualBox error rc=-1912

1. remove virtualbox
2. remove all virtualbox entries from ```dnf search virtualbox```
3. download and install new virtualbox from oracle site, do not use npm

---

## installing and using oracle database on a virtual machine

example:

1. install virtualbox
2. install oracle linux 6.7 64bit as virtual machine (partition size >= 32G, swap parition >= 2G)
3. install on the VM oracle database express (XE)
4. configure it, install openjdk 1.8
5. install guest additions, kernel headers, gcc, make, perl, ecc
6. set connection of the vm : adapter : bridge
7. ssh tunnel : ```ssh -L 1521:localhost:1521 <ip_of_the_vm>```
8. now yuo can access from the host machine

---

### sqlplus

```connect SYSTEM/password@XE```

---

## setup ssh access with ssh key authentication

+ create key pair on the "server"

```bash
[fedora@server ~]$ ssh-keygen -t rsa
# use a passphrase
[fedora@server ~]$ mv ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys 
[fedora@server ~]$ chmod 600 ~/.ssh/authorized_keys 
```

+ transfer the secret key created on the Server to a Client

```bash
[fedora@client ~]$ mkdir ~/.ssh 
[fedora@client ~]$ chmod 700 ~/.ssh
# copy the secret key to local ssh directory
[fedora@client ~]$ scp fedora@10.0.0.30:/home/fedora/.ssh/id_rsa ~/.ssh/ 
```

+ now you can login

```bash
[fedora@client ~]$ ssh -i ~/.ssh/id_rsa fedora@10.0.0.30 
Enter passphrase for key '/home/fedora/.ssh/id_rsa':   # passphrase
Last login: Wed Dec 10 22:23:46 2042 from localhost 
[fedora@server ~]$   # just logined
```

+ If you set "PasswordAuthentication" no, it's more secure

```bash
[root@client ~]# vi /etc/ssh/sshd_config
# line 79: turn to "no"
PasswordAuthentication no
```

+ login without specify the key (session)

```bash
$ ssh-add ~/.ssh/id_rsa_key
```

+ to remove a passphrase ```ssh-keygen -p``` (quickest login)

---

## Random Kali Notes

1. scaricare la iso
2. inserire usb
3. ```sudo fdisk -l```
   + ```umount /dev/sdX```
   + ```parted /dev/sdX```
   + ```mklabel gpt```
4. ```dd if=kali-linux-2017.1-amd64.iso of=/dev/sdb bs=512k```

+ root toor
+ ```service stop wicd```
+ ```service start wicd```

1. ```airmon-ng```
2. ```airmon-ng start wlan0```
3. ```airodump-ng wlan0mon```
4. ```airodump-ng -c 00 --bssid 00:ff -w /root/Desktop/ wlan0mon```

---
