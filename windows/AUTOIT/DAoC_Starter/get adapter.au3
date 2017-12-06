Global Const $EDS_RAWMODE = 0x2

Dim $DEVMODE, $DllRet, $enum = 0

$DEVMODE = DllStructCreate("char dmDeviceName[32];ushort dmSpecVersion;ushort dmDriverVersion;short dmSize;" & _
                           "ushort dmDriverExtra;dword dmFields;short dmOrientation;short dmPaperSize;short dmPaperLength;" & _
                           "short dmPaperWidth;short dmScale;short dmCopies;short dmDefaultSource;short dmPrintQuality;" & _
                           "short dmColor;short dmDuplex;short dmYResolution;short dmTTOption;short dmCollate;" & _
                           "byte dmFormName[32];dword dmBitsPerPel;int dmPelsWidth;dword dmPelsHeight;" & _
                           "dword dmDisplayFlags;dword dmDisplayFrequency")

DllStructSetData($DEVMODE, "dmSize", DllStructGetSize($DEVMODE))

Do
    $DllRet = DllCall("user32.dll", "int", "EnumDisplaySettingsEx", "ptr", 0, "dword", $enum, _
                      "ptr", DllStructGetPtr($DEVMODE), "dword", 0)
    $DllRet = $DllRet[0]

    $enum += 1

     ConsoleWrite("Width = " & DllStructGetData($DEVMODE, "dmPelsWidth") & " " & _
                  "Height = " & DllStructGetData($DEVMODE, "dmPelsHeight") & " " & _
                  "Bits = " & DllStructGetData($DEVMODE, "dmBitsPerPel") & " " & _
                  "Frequency = " & DllStructGetData($DEVMODE, "dmDisplayFrequency") & @LF)
Until $DllRet = 0

$DEVMODE = 0