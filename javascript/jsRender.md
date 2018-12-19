# jsRender

+ [home page](https://www.jsviews.com/)
+ [github](https://github.com/BorisMoore/jsrender)
+ [Go back to Javascript Notes](readme.md)

---

## access variable

```html
<div>
   <em>Name:</em> {{:name}}
   {{if showNickname && nickname}}
      (Goes by <em>{{:nickname}}</em>)
   {{/if}}
</div>
```

<br>

### access parent variable

Example:

```html
onclick="showCallMeModal({{:#parent.parent.data.parentVariableName}})"
```

<br>

### access sub variable

Dot.notation!

---

## if statement

```html
<script id="personTmpl" type="text/x-jsrender">
  {{if nickname}}
    Nickname: {{:nickname}}
  {{else name}}
    Name: {{:name}}
  {{else}}
    No name provided
  {{/if}}
</script>
```

---

## comment

They are multi-line!

```html
{{!-- <div> 
      </div>
--}}
```

---

## for statement

```{{:index}}``` contain the index number

```html
{{for myArray}}
  ...
  {{:#index}}
  ...
{{/for}}
```

---

example: *"if is the first index then ..."*

```html
{{if #index == 0}}...{{/fi}}
```

---

**VERY VERY IMPORTANT**

**VARIABLES INSIDE FOR HAVE THEY OWN CONTEXT**

**SO IF YOU WANT TO ACCESS A VARIABLE OUTSIDE THE FOR, YOU HAVE TO USE THIS SYNTAX**

```html
{{for items}}
   {{if #parent.parent.data.variableOutsideTheFor)}}{{:#index}}{{/if}}
{{/for}}
```

---

### VERY IMPORTANT

**VERY VERY IMPORTANT**

**SAME THINGS FOR EVERY CODE BLOCK, IF BLOCK TOO!!!**

---

## script inside the script!

Use this kind of trick:

```javascript
{{:"<"}}script>
    alert('1');
{{:"<"}}/script>
```

---

## common errors and mistakes

+ variable undefined even if you know it exists? take a look to the ```parent``` notation [here](###-VERY-IMPORTANT)

---
