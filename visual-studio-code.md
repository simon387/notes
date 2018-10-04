# visual studio code tips

## chrome debug extension

```"userDataDir": false,```

---

## find all default keybinding

<kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>L</kbd>

---

## Open Command Palette default keybinding

<kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>P</kbd>

---

## my settings

```json
{
	"editor.renderWhitespace": "boundary",
	"editor.insertSpaces": false,
	"editor.rulers": [
		80
	],
	"editor.detectIndentation": false,
	"editor.mouseWheelZoom": true,
	/*"editor.wrappingColumn": -1,*/
	"editor.minimap.enabled": true,
	"terminal.integrated.scrollback": 8192,
	// "window.zoomLevel": 0,
	"workbench.statusBar.visible": true,
	// "window.menuBarVisibility": "toggle",
	"extensions.ignoreRecommendations": true,
	"window.title": "${dirty}${activeEditorLong}${separator}${folderName}${separator}${appName}",
	"files.autoSave": "afterDelay",
	// "terminal.integrated.fontSize": 13,
	"window.zoomLevel": 0,
	"workbench.editor.tabSizing": "shrink",
	/* shellcheck custom fedora26 settings */
	"shellcheck.enable": true,
	"shellcheck.run": "onType",
	"shellcheck.executablePath": "shellcheck",
	"shellcheck.exclude": [
		"SC2140", /* gli a capi con / */
		"SC2039", /* echo con flag */
		"SC1003", /* escape giusto! */
		"SC2086", /* è una funzione, non una variabile da quotare */
		"SC2181", /* non voglio fare una if tuttappiccicata */
		"SC2006", /* mi fa sbagliare i quote!*/
	],
	"shellcheck.customArgs": [],
	"files.associations": {
		"*.jsp": "jsp"
	},
	"javascript.implicitProjectConfig.experimentalDecorators": true,
	"workbench.startupEditor": "newUntitledFile",
	"vsicons.projectDetection.autoReload": true,
	"workbench.colorTheme": "Darcula Theme from IntelliJ",
	"[html]": {
		"editor.tabSize": 2
	},
	"editor.wordBasedSuggestions": false
	//
}
```

### Log Viewer Settings

Example on windows:

```json
"logViewer.watch": [
        {
            "title": "C:\\dev\\lenovo.log",
            "pattern": "C:\\dev\\lenovo.log"
        }
    ]
```

---

## Hotkeys on Windows (trick)

For better usage, remember to disable the useless *HD Intel* software (from tray icon)

---
