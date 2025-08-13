powershell ```.\auto_clicker.ps1```

```shell
while ($true) {
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Mouse {
[DllImport("user32.dll", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);
public const int MOUSEEVENTF_LEFTDOWN = 0x02;
public const int MOUSEEVENTF_LEFTUP = 0x04;

        public static void Click() {
            mouse_event(MOUSEEVENTF_LEFTDOWN | MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
        }
    }
"@
[Mouse]::Click()
Start-Sleep -Seconds 60  # Aspetta 60 secondi
}
```

serve per click automatico senza diritti admin, coordinate del mouse quelle che ci sono

---

powershell anti lock

```shell
Add-Type -AssemblyName System.Windows.Forms ; while ($true) { [System.Windows.Forms.SendKeys]::SendWait("{SCROLLLOCK}") ; Start-Sleep -Seconds 240 }
```

---

## VPN

- fai partire come admin open vpn e connettiti
- fai partire come admin mypublicwifi
- firewall di windows spento (non è vero, va pure con il firewall up)

Connessione alla rete locale LAN 10.8.0.6 è quella giusta