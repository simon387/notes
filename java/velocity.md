# info utili per la creazione e modifica template e strutture in liferay

linguaggio più scelto per i template è Velocity

## accesso a variabile ripetibile (lista) e alle sue sottovariabili
```
#if (!$slideTitle.getSiblings().isEmpty())
 #foreach ($cur_slideTitle in $slideTitle.getSiblings())
 #end
#else
#end
```

## set variabili
```
#set ($c = 0)
```

# operatori logici in espressioni
```
&& || ! != ==
```

# accesso a checkbox
```
$getterUtil.getBoolean($variabileCheckboxosa.getData())
```

# convenzioni strutture
+ per documenti, immagini, video, media ecc usare sempre "Documents and media" come oggetto.
+ per contenuti multimediali, mettere sempre un campo "alt"
