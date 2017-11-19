# linux_cmd

Random linux common cmd collection (mainly from fedora/redhat/centosOS)

There are other software examples too, like git, ffmpeg, npm etc..

+ alias (then . ~/.bashrc)

  ```bash
  alias liferay_see_log='tail -f /opt/liferay/liferay/tomcat-7.0.42/logs/catalina.out'
  ```

+ awk es.

  ```bash
  awk '/Created Record entitoso/{print "insert into _TABLE (DATA_ORA, USERNAME, TIPO_UTENTE, NUM_STELLE, TESTO, VERSIONE_APP, PIATTAFORMA,VERSIONE_SO, BRAND, MODELLO_DISPOSITIVO, CODICE_FISCALE) values ('\''" substr($11, 12, length($11)) " " substr($12, 0, length($12)-1) "'\'', '\''" substr($13, 10, length($13)-10) "'\'', '\''" substr($14, 12, length($14)-12) "'\'', " substr($15, 11, 11) " '\''"substr($16, 7, length($16)-7) "'\'', '\''" substr($17, 13, length($17)-13) "'\'', '\''" substr($18, 13, length($18)-13) "'\'', '\''"  substr($19, 12, length($19)-12) "'\'', '\''" substr($20, 7, length($20)-7) "'\'', '\''" substr($21, 20, length($21)-20) "'\'', '\''" substr($22, 15, length($22)-15) "'\'');"}' /var/log/tomcat/app/app-controller.log* > insert.sql
  ```

  ```awk 'sub("$", "\r")' linux_guida_setup_conf_6.1.txt >  win_guida_setup_conf_6.1.txt```

+ remove path from filename

  ```$(basename $filename)```

+ ```cat /proc/cpuinfo | grep processor | wc -l```

+ ```chown user:group file.lol```

+ ```chmod 777 file.lol```

+ ```clear```

+ ```cd```

+ curl es.

  ```bash
  curl -H "Content-Type: application/json" -X POST -d '{"message":"Hai appena ricevuto un accredito di 0.11â‚¬ da Asd Com","appVersion":"1.0","recipients":{"userId":"asd@com.com","vibration":"true","popup":"true","sendFeedback":"never"},"fields":[{"key":"notTypeCode","value":"01"},{"key":"idPN","value":"262"}]}' http://asd/com
  ```

+ ```date```

+ file system disk space

  ```df -H```

+ ```diff```

+ dnf

  ```bash
  dnf clean all
  dnf update -y
  dnf install <name>
  dnf search <name>
  dnf list installed
  ```

+ dir dimension

  ```du -sh <dir>```

+ du es.

  ```du --max-depth=1 -h .```

+ ```echo hello```
  
+ ```exit 0```

+ video conversion

  ```bash
  ffmpeg -i filename.mkv -c:v copy -c:a copy output.avi
  ffmpeg -i input.mkv  output.avi
  ```

+ video rotation, 90 clockwise

  ```bash
  ffmpeg -i in.mp4 -vf "transpose=1" out.mp4
  ```

+ vpn with forticlient es.

  ```bash
  /opt/forticlientsslvpn/64bit/forticlientsslvpn_cli --server $server:$port --vpnuser $user
  ```

+ check if file exists

  ```bash
  if [ ! -f $SCRIPT_DETACH ]; then
  ```

+ ```ifconfig```

+ custom git bash macro inside .bashrc:

  ```bash
  function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
  }
  ```

+ git

  ```bash
  git add .
  git commit -m "msg"
  git push
  git clone <repo>
  git pull
  git fetch
  git status
  git reflog
  git reset --hard origin/master
  git branch
  git diff HEAD file
  ```

+ ```grep "LOGIN_TOUCH" monitor.log.2017-04-10 | grep "AUTHENTI" | grep "KO" | grep -oP '((?=\[KO - ).*(?=Sid))'```

+ ```grep "LOGIN_TOUCH" monitor.log.2017-04-11 | grep "AUTHENTI" | grep "OK" | wc -l```

+ ```history```

+ fedora see logs
  ```bash
  journalctl -f
  ```

+ ```kill -9 <pid>```

+ java thread dump (see [output example](java_thread_dump_example))

  ```bash
  kill -3 <pid>
  ```

+ ```less```

+ variable increment

  ```let "var++"```

+ ```ll -Slhr```

+ ```locate <filename>```

+ ```mkdir```

+ ```mysql -u root -p cc_liferay62 < HOME_DIR/cc_liferay.dump.sql/data```

+ ```nano```

+ ```nautilus```

+ ```npm update```

+ ```printf "\033c"```

+ ```ps aux | grep java```

+ thread count (processes inside a JVM)

  ```ps huH p <pid> | wc -l```

+ ```pwd```

+ ```rkhunter --check```

+ ```rm -rf /opt/liferay/liferay-portal-6.2-ce-ga2/tomcat-7.0.42/webapps/mkinder-ext/```

+ routing es.

  ```bash
  route del default
  route add -net 10.10.0.0 netmask 255.255.0.0 dev ppp0
  route add -net 172.26.251.0 netmask 255.255.255.0 dev ppp0
  ```

+ ```sed -n '/inizio/,/fine/p' file.lol```

+ ```systemd-analyze blame```

+ ```lm-sensors sensors ```

+ ```service httpd restart```

+ ```shutdown -h now```

+ ```systemctl stop mariadb.service```

+ ```ssh -i /home/user/az1/az2/az3/chiavi/pem/az2.key.pem asd@999.38.135.146```

+ command with timeout

  ```bash
  (timeout 5 ./code-c || : ) | tail
  ```

+ tunnel

  ```bash
  ssh -f user@server.com -L 12345:other_server.com:8011 -N
  ```

+ ```ping <url>```

+ scp (add -r for directories)

  ```bash
  scp remote_user@remote_host:/path/to/remote/file /path/to/local/file
  scp /path/to/local/file remote_user@remote_host:/path/to/remote/file
  ```

+ ```sleep 2s```

+ ```sshpass -p $password ssh -o StrictHostKeyCHecking=no "$user@$serverName$serverType$nodeNumber.$domain"```

+ ```stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout 100s```

+ ```sudo -i -u liferay```

+ ```sudo -l```

+ ```svn co --username user https://asd/trunk/lf_layout/Column4-layouttpl```

+ ```svn list -R -v file:///subversion/repository | grep filename```

+ ```svn switch --relocate https://pathOldPrj https://pathNewPrj /home/scelia/thinkopen/open_reply/prj```

+ ```tail -f /opt/liferay/liferay/tomcat-7.0.42/logs/catalina.out```

+ tail until string is found

  ```bash
  ( tail -f -n0 "$CATALINA_OUT" & ) | grep -iq "INFO:\ Server\ startup\ in"
  ```

+ ```top```

+ ```touch <file>```

+ ```tree```

+ kernel version

  ```uname -r```

+ ```uptime```

+ vim

  ```bash
  vi /etc/hosts
  :set nu
  dd
  yy
  p
  /\cstring
  ```

+ ```wget <url>```

+ ```whereis <filename>```

+ download video and conversion

  ```bash
  youtube-dl --recode-video mp4 https://www.youtube.com/watch?v=yVpbFMhOAwE
  ```

+ download and extract audio with conversion

  ```bash
  youtube-dl -x --audio-format flac https://www.youtube.com/watch?v=yVpbFMhOAwE
  ```

+ string trim

  ```echo "   lol  " | xargs```

+ bash string variable length

  ```stringLength=${#stringVar}```

+ ```!<cmd>```
