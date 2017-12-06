#include <ie.au3>
$oIE = _IECreate ("/")
$oForm = _IEFormGetObjByName ($oIE, "form id or name")
$oQuery1 = _IEFormElementGetObjByName ($oForm, "uname textfield id or name")
$oQuery2 = _IEFormElementGetObjByName ($oForm, "pwd text field id or name")
$uname="Yourusername"
$pwd="yourpassword"
_IEFormElementSetValue ($oQuery1,$uname)
_IEFormElementSetValue ($oQuery2,$pwd)
$oButton=_IEGetObjById($oIE,"")
_IEAction ($oButton, "click")
_IELoadWait($oIE,0)