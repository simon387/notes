# Freemarker

[official site](https://freemarker.apache.org)

+ [GOTO Liferay Notes](https://github.com/simon387/notes/blob/master/java/liferay.md)

## interpolation

```freemarker
${...}
```

## Comments

```freemarker
<#-- this is a comment, won't get into the output -->
```

## If else

```freemarker
<#if animals.python.price < animals.elephant.price>
  Pythons are cheaper than elephants today.
<#else>
  Pythons are not cheaper than elephants today.
</#if>
```

## List

```freemarker
<p>WE have these anaimals:
<table border=1>
  <#list animals as animal>
    <tr><td>${animal.name}<td>${animal.price} Euros
  </#list>
</table>
```

separator in list (e.g. by comma)

```freemarker
<p>Fruits: <#list misc.fruits as fruit>${fruit}<#sep>, </#list>
```

with else statement

```freemarker
<p>Fruits: <#list misc.fruits as fruit>${fruit}<#sep>, <#else>None</#list>

```

## Include directive

```freemarker
<html>
<head>
  <title>Test page</title>
</head>
<body>
  <h1>Test page</h1>
  <p>Blah blah...
  <#include "/copyright_footer.html">
</body>
</html
```

## Built-ins

+ ```user?upper_case```
+ ```animal.name?cap_first```
+ ```user?length```
+ ```animals?size```
+ ```inside <#list animals as animal></#list>```
  + ```animal?index``` 0-based index
  + ```animal?counter``` 1-based index
  + ```animal?item_parity``` return String "odd" or "even" (e.g.: ```<td class="${animal?item_parity}Row">```)
+ ```animal.isProtected?string("Y", "N")``` return "Y" or "N" depending on boolean value
+ ```animal?item_cycle('lightRow', 'darkRow')``` more specific of ```item_parity```
+ ```fruit?join(", ")``` converts list to String with separator

## Dealing with missing variables

```freemarker
<h1>Welcome ${user!"visitor"}!</h1>
```

```freemarker
<#if user??><h1>Welcome ${user}!</h1></#if>
```

## Preventing auto-escaping

```freemarker
${value?no_esc}
```
