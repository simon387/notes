# Raspberry Pi 400 — Hotspot WiFi con VPN Italia

Il Pi è collegato via **ethernet** al router spagnolo (`eth0`).
Si connette via OpenVPN al router italiano ASUS RT-AC88U (`tun0`).
Crea un hotspot WiFi (`wlan0`) che instrada tutto il traffico nella VPN.
**L'hotspot parte automaticamente solo se la VPN si connette con successo.**

Risultato: chi si connette all'hotspot naviga con un IP italiano.

```
[Dispositivi WiFi]
       ↓ wlan0 (192.168.50.1) — hotspot "it365"
 [Raspberry Pi 400]
       ↓ eth0
  [Router Spagna]
       ↓ Internet
  [Router Italia ASUS RT-AC88U]  ← tunnel OpenVPN UDP:1723 (tun0)
       ↓
   Internet (IP italiano)
```

---

## Specifiche del setup testato

+ **Hardware**: Raspberry Pi 400
+ **OS**: Raspberry Pi OS Trixie (Debian 13) — usa **NetworkManager**
+ **OpenVPN**: 2.6.14
+ **OpenSSL**: 3.5.6 (vedi sezione problemi noti)
+ **Router italiano**: ASUS RT-AC88U con OpenVPN server su UDP:1723
+ **SSID**: `it365` — password: configurabile
+ **Subnet AP**: `192.168.50.0/24` — Pi su `192.168.50.1`

---

## Prerequisiti

+ Raspberry Pi OS installato (Bullseye, Bookworm o Trixie)
+ File `.ovpn` del client VPN esportato dal router italiano
+ Connessione ethernet funzionante
+ Accesso SSH o terminale

---

## 1. Installa i pacchetti

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y openvpn hostapd dnsmasq iptables-persistent netfilter-persistent
```

Durante `iptables-persistent` rispondi **Sì** ad entrambe le domande.

---

## 2. Problema noto: certificati ASUS e OpenSSL 3.4+

> **Se usi un router ASUS, leggi questa sezione prima di continuare.**

Il server OpenVPN degli ASUS RT-AC88U genera certificati con un bug di encoding nell'estensione AKI (`AuthorityKeyIdentifier`): il campo `authorityCertSerialNumber` usa il tag ASN.1 `C2` (PRIVATE class) invece del corretto `82` (context-specific). OpenSSL **≥ 3.4** rifiuta questi certificati con:

```
OpenSSL: error:1100009E:X509 V3 routines::invalid certificate
Error reading extra certificate
```

### Soluzione: rigenerare i certificati dal pannello ASUS

1. Accedi al pannello admin del router: `http://192.168.1.1` o `https://router.asus.com`
2. Vai in **VPN → VPN Server → OpenVPN**
3. Clicca **Export** per scaricare un nuovo `.ovpn` (se il firmware è stato aggiornato, i nuovi certificati saranno corretti)
4. Oppure cerca l'opzione **Regenerate Certificate** o **Renew** e poi ri-esporta

Se il firmware è vecchio e i nuovi certificati hanno ancora il bug, considera:
+ Aggiornare il firmware ASUS (l'ultimo disponibile per RT-AC88U)
+ Installare **Asuswrt-Merlin** (firmware alternativo che supporta anche WireGuard)
+ Usare **WireGuard** invece di OpenVPN (nessun problema di certificati)

### Verifica rapida del certificato

```bash
openssl verify -CAfile ca.crt client.crt
```

Se risponde `client.crt: OK` il certificato è valido. Se risponde `invalid certificate` hai il bug ASUS.

---

## 3. File di configurazione OpenVPN

Crea la cartella e separa il contenuto del `.ovpn` in file distinti:

```bash
sudo mkdir -p /etc/openvpn/client
```

Estrai il blocco `<ca>...</ca>` dal `.ovpn` e salva in `/etc/openvpn/client/ca.crt`:

```bash
sudo nano /etc/openvpn/client/ca.crt
# incolla il contenuto tra <ca> e </ca> (incluse le righe -----BEGIN/END-----)
```

Stesso per il certificato client (`<cert>`) in `client.crt` e la chiave (`<key>`) in `client.key`:

```bash
sudo nano /etc/openvpn/client/client.crt
sudo nano /etc/openvpn/client/client.key
sudo chmod 600 /etc/openvpn/client/client.key
```

Crea il file con le credenziali VPN:

```bash
sudo nano /etc/openvpn/client/auth.txt
# prima riga: username
# seconda riga: password
sudo chmod 600 /etc/openvpn/client/auth.txt
```

Crea la configurazione principale `/etc/openvpn/client/italia.conf`:

```
client
dev tun
proto udp
remote simonecelia.ddns.net 1723
float
nobind
keepalive 10 60
resolv-retry infinite

ca /etc/openvpn/client/ca.crt
cert /etc/openvpn/client/client.crt
key /etc/openvpn/client/client.key
auth-user-pass /etc/openvpn/client/auth.txt

auth SHA1
cipher AES-128-CBC
comp-lzo yes
allow-compression yes
data-ciphers AES-128-CBC:AES-256-GCM:AES-128-GCM
tls-cert-profile insecure

script-security 2
up /etc/openvpn/client/up.sh
down /etc/openvpn/client/down.sh
down-pre

persist-key
persist-tun
verb 3
```

> **Note sulle opzioni**:
> + `comp-lzo yes` + `allow-compression yes` — necessario per OpenVPN 2.6+ con server ASUS vecchi
> + `data-ciphers` — permette al client moderno di usare il cipher del server
> + `tls-cert-profile insecure` — necessario per certificati ASUS con chiavi RSA 1024-bit
> + `script-security 2` — permette di eseguire gli script `up`/`down`

---

## 4. Script up.sh — avvia l'AP quando la VPN si connette

Crea `/etc/openvpn/client/up.sh`:

```bash
sudo nano /etc/openvpn/client/up.sh
```

```bash
#!/bin/bash
# Chiamato da OpenVPN quando il tunnel è attivo

logger -t vpn-up "VPN connessa su $dev, IP: $ifconfig_local"

# IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Pulisci eventuali regole vecchie
iptables -t nat -D POSTROUTING -o tun0 -j MASQUERADE 2>/dev/null || true
iptables -D FORWARD -i wlan0 -o tun0 -j ACCEPT 2>/dev/null || true
iptables -D FORWARD -i tun0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT 2>/dev/null || true

# NAT: il traffico da wlan0 esce da tun0 (VPN italiana)
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
iptables -A FORWARD -i wlan0 -o tun0 -j ACCEPT
iptables -A FORWARD -i tun0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT

logger -t vpn-up "NAT wlan0 -> tun0 configurato"

# Avvia access point e DHCP
systemctl start hostapd
systemctl start dnsmasq

logger -t vpn-up "Access Point it365 attivo"
```

```bash
sudo chmod 755 /etc/openvpn/client/up.sh
```

---

## 5. Script down.sh — ferma l'AP quando la VPN cade

Crea `/etc/openvpn/client/down.sh`:

```bash
sudo nano /etc/openvpn/client/down.sh
```

```bash
#!/bin/bash
# Chiamato da OpenVPN quando il tunnel cade

logger -t vpn-down "VPN disconnessa, fermo l'Access Point"

systemctl stop dnsmasq 2>/dev/null || true
systemctl stop hostapd 2>/dev/null || true

iptables -t nat -D POSTROUTING -o tun0 -j MASQUERADE 2>/dev/null || true
iptables -D FORWARD -i wlan0 -o tun0 -j ACCEPT 2>/dev/null || true
iptables -D FORWARD -i tun0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT 2>/dev/null || true

logger -t vpn-down "Access Point fermato"
```

```bash
sudo chmod 755 /etc/openvpn/client/down.sh
```

---

## 6. Configura l'access point (hostapd)

```bash
sudo nano /etc/hostapd/hostapd.conf
```

```
interface=wlan0
driver=nl80211
ssid=it365
hw_mode=g
channel=6
wmm_enabled=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=LatuaPassword
wpa_key_mgmt=WPA-PSK
rsn_pairwise=CCMP
```

Su **Raspberry Pi OS Trixie** (Debian 13) non serve modificare `/etc/default/hostapd`.

---

## 7. Configura DHCP per i client WiFi (dnsmasq)

```bash
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
sudo nano /etc/dnsmasq.conf
```

```
interface=wlan0
dhcp-range=192.168.50.2,192.168.50.50,255.255.255.0,24h
domain=local
address=/gw.local/192.168.50.1
```

---

## 8. IP statico su wlan0 al boot

Su **Trixie con NetworkManager**, impedisci a NM di gestire wlan0 (altrimenti sovrascrive l'IP):

```bash
sudo nano /etc/NetworkManager/conf.d/99-unmanaged-wlan0.conf
```

```
[keyfile]
unmanaged-devices=interface-name:wlan0
```

Crea un servizio systemd che assegna l'IP a wlan0 prima di tutto:

```bash
sudo nano /etc/systemd/system/wlan0-setup.service
```

```
[Unit]
Description=IP statico su wlan0 per hotspot
After=network.target
Before=openvpn-client@italia.service

[Service]
Type=oneshot
ExecStart=/sbin/ip addr add 192.168.50.1/24 dev wlan0
ExecStart=/sbin/ip link set wlan0 up
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl daemon-reload
sudo systemctl enable wlan0-setup.service
```

---

## 9. Avvio automatico al boot

`hostapd` e `dnsmasq` vengono gestiti dagli script VPN, **non** si avviano da soli:

```bash
sudo systemctl disable hostapd
sudo systemctl disable dnsmasq
```

Solo la VPN parte automaticamente:

```bash
sudo systemctl enable openvpn-client@italia
```

Riavvia:

```bash
sudo reboot
```

Sequenza al boot:
1. `wlan0-setup` assegna `192.168.50.1` a `wlan0`
2. `openvpn-client@italia` tenta la connessione VPN
3. Se la VPN si connette → `up.sh` avvia hostapd e dnsmasq
4. L'hotspot `it365` diventa visibile e naviga con IP italiano

---

## Verifica

```bash
# IP pubblico del Pi (deve essere italiano)
curl -s https://api.ipify.org && echo

# Stato VPN
sudo systemctl status openvpn-client@italia

# Interfaccia VPN attiva
ip addr show tun0

# Log VPN in tempo reale
sudo journalctl -u openvpn-client@italia -f
```

Da un dispositivo connesso all'hotspot, visita `https://ifconfig.me` — deve mostrare un IP italiano.

---

## Comandi utili

```bash
# Riavvia VPN (e di conseguenza l'hotspot)
sudo systemctl restart openvpn-client@italia

# Avvia/ferma manualmente l'AP
sudo systemctl start hostapd dnsmasq
sudo systemctl stop hostapd dnsmasq

# Vedi regole NAT attive
sudo iptables -t nat -L -n -v

# Log degli script up/down
sudo journalctl -t vpn-up -t vpn-down --since "1 hour ago"
```

---

## Diagnostica rapida — WiFi non visibile al boot

Esegui in ordine, ogni comando ti dice dove si è fermato:

```bash
# 1. La VPN si è connessa?
sudo systemctl status openvpn-client@italia --no-pager

# 2. Errori VPN (ultimi 50 log)
sudo journalctl -u openvpn-client@italia -n 50 --no-pager

# 3. Il tunnel tun0 esiste?
ip addr show tun0

# 4. wlan0 ha l'IP statico?
ip addr show wlan0

# 5. Il servizio wlan0-setup è partito?
sudo systemctl status wlan0-setup --no-pager

# 6. hostapd e dnsmasq sono attivi?
sudo systemctl status hostapd --no-pager
sudo systemctl status dnsmasq --no-pager

# 7. Lo script up.sh è stato chiamato?
sudo journalctl -t vpn-up --since "1 hour ago" --no-pager

# 8. WiFi bloccato da rfkill?
rfkill list
```

**Interpretazione rapida:**
+ VPN `failed` o `activating` → la VPN non si connette → l'AP non parte mai (guarda log al punto 2)
+ `tun0` non esiste → VPN non connessa
+ `wlan0` senza IP → `wlan0-setup` non ha girato
+ `hostapd` `inactive` + nessun log `vpn-up` → lo script `up.sh` non è stato chiamato
+ `rfkill` mostra `blocked` → esegui `rfkill unblock wifi` poi riavvia hostapd

---

## Troubleshooting

+ **`Error reading extra certificate` nei log VPN** — bug certificati ASUS (vedi sezione 2). Rigenerare i certificati dal pannello ASUS.

+ **hostapd non parte** — WiFi bloccato da rfkill:

  ```bash
  rfkill list
  rfkill unblock wifi
  ```

+ **wlan0 non ha IP** — controlla che `wlan0-setup.service` sia attivo:

  ```bash
  sudo systemctl status wlan0-setup
  sudo ip addr add 192.168.50.1/24 dev wlan0  # manuale
  ```

+ **Traffico non instradato nella VPN** — controlla IP forwarding e iptables:

  ```bash
  cat /proc/sys/net/ipv4/ip_forward   # deve essere 1
  sudo iptables -t nat -L POSTROUTING -n -v
  sudo iptables -L FORWARD -n -v
  ```

+ **IP pubblico spagnolo invece che italiano** — il traffico non passa dalla VPN. Verifica che `tun0` esista e che le regole iptables puntino a `tun0`:

  ```bash
  ip route show default   # deve passare da tun0 o avere route per il server VPN
  ```

  Aggiungi nel `.ovpn` se manca: `redirect-gateway def1 bypass-dhcp`

+ **DNS leak** — i client potrebbero usare il DNS del router spagnolo. Per forzare DNS italiani, aggiungi in `dnsmasq.conf`:

  ```
  server=8.8.8.8
  server=1.1.1.1
  ```
