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

```html
{{!-- <div> --}}
```

---
