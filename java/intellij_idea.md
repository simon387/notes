# IntelliJ IDEA General Notes

## .desktop file

```/usr/local/share/applications/jetbrains-idea.desktop```

```bash
[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA Ultimate Edition
#Icon=/opt/idea-IU-173.4548.28/bin/idea.png
Icon=/opt/idea-IU-173.4548.28/bin/idea.png
#Exec="/opt/idea-IU-173.4548.28/bin/idea.sh" %f
Exec="/opt/idea-IU-181.4203.550/bin/idea.sh" %f
Comment=The Drive to Develop
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-idea
```

---

## default common IntelliJ IDEA hotkeys under Gnome

(it's just a self memorization exercise)


| Hotkey                    | Function                 | Other function
| :------------------------ |:-------------------------| :-
| ```ctrl + y```            | delete line              |
| ```ctrl + n```            | open class               |
| ```ctrl + shift + n```    | open resource            |
| ```alt + #```             | open/show panel number # |
| ```ctrl + f```            | find in buffer           |
| ```ctrl + shift + f```    | find in files            |
| ```ctrl + alt + b```      | open implementation      |
| ```alt + F7```            | find usage               |
| ```alt + shift + arrow``` | move selected line(s)    |
| ```alt + shift + 8```     | evaluate code fragment   |
| ```ctrl + /```            | comment out              |
| ```ctrl + r```            | replace in buffer        |
| ```alt + v```             | run evaluate             |
| ```ctrl + F4```           | quit buffer              |
| ```shift + F6```          | refactory rename         |
| ```ctrl + d```            | show diff window         | duplicate line
| ```ctrl + alt + l```      | format code              |
| ```ctrl + shift + F9```   | hot class replacement during debug |
| ```alt + j```             | find next selected string |

---

## SVN login not working?

But in browser it works?

Turn this option to on:

```Settings -> Subversion -> Enable interactive mode```

Also I usually use a svn binary different from the one integrated in IntelliJ IDEA (if any)

For example i put it in this directory:

```C:\dev\svn\bin\svn.exe```

---
