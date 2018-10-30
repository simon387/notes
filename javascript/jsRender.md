# jsRender

+ [home page](https://www.jsviews.com/)
+ [github](https://github.com/BorisMoore/jsrender)

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

example: *"if is the first index then ..."*

```html
{{if #index == 0}}...{{/fi}}
```

---
