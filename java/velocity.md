# Notes about template and structure develompment in liferay

The main Liferay used template language ~~is~~ was Velocity
+ [GOTO Liferay Notes](liferay.md)

---

## List variable access
```
#if (!$slideTitle.getSiblings().isEmpty())
 #foreach ($cur_slideTitle in $slideTitle.getSiblings())
 #end
#else
#end
```

---

## Var set
```
#set ($c = 0)
```

---

## Logic operations in expressions
```
&& || ! != ==
```

---

## Checkbox access
```
$getterUtil.getBoolean($variabileCheckboxosa.getData())
```

---

## Structure conventions
+ in documents, images, video, media, etc, always use object: "Documents and media"
+ use always field "alt" on mutlimedia contents

---
