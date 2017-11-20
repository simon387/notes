# infos about template and structure develompment in liferay

the main used template language is Velocity

## list variable access
```
#if (!$slideTitle.getSiblings().isEmpty())
 #foreach ($cur_slideTitle in $slideTitle.getSiblings())
 #end
#else
#end
```

## var set
```
#set ($c = 0)
```

# logic operations in expressions
```
&& || ! != ==
```

# checkbox access
```
$getterUtil.getBoolean($variabileCheckboxosa.getData())
```

# structure conventions
+ in documents, images, video, media, etc, always use object: "Documents and media"
+ use always field "alt" on mutlimedia contents
