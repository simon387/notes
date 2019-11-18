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

## String comparison example

```velocity
#if ($page_url == "login")

#end
```

---

## Language key value

```velocity
#language ("powered-by")
```

---

## For with counter

```velocity
#foreach($entry in $entries)    
    <p>In for Loop count is : $velocityCount</p>     
#end
```

### Reverse foreach

```velocity
<ol style="list-style: decimal!important;">
    #set($c = $item.siblings.size())
    #foreach ($i in $item.siblings)
        #set($c = $c - 1)
        #set($sibling = $item.siblings.get($c))
        <li>$sibling.data</li>
    #end
</ol>
```

---

## For example

```velocity
<div class="prodotti-linee" id="cmsEditoriale">
    <img class="header-image" src="$headerImmagine.data">
    <h2 class="incipit-description">
        $headerTitolo.data
    </h2>
    <p>
        $headerTesto.data
    </p>
    <h2 class="cat-title">$categorieTesto.data</h2>
    <div class="prodlist">
        #foreach($item in $prodotto.getSiblings() )
            <div class="prod">
                <div class="prod-img">
                <a href="$item.link.getFriendlyUrl()">
                    <img src="$item.immagine.data">
                </a>
                </div>
                <div class="prod-title">
                    $item.titolo.data
                </div>
            </div>
        #end
    </div>
    <br clear="all">
</div>
```

---

## Check if variable is not used from model

```velocity
#if ($item.botton_right_img.getData() != "")
			 <img src="$item.botton_right_img.data" />
#end
```

---
