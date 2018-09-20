# Random notes on CSS

## Ones from [freeCodeCamp](https://medium.freecodecamp.org/css-naming-conventions-that-will-save-you-hours-of-debugging-35cea737d849)

+ Class naming convention:
  ```css
  .some-class {
    fontWeight: 10em
  }
  ```
+ BEM naming convention (stickMan example):
  ```css
  .stick-man__head {}
  .stick-man__arms {}
  .stick-man__feet {}
  .stick-man--blue {}
  .stick-man--red {}
  .stick-man__head--small {}
  .stick-man__head--big {}
  ```
+ Use js- class names
  ```html
  <div class="site-navigation js-site-navigation"></div>
  ```
  ```javascript
  const nav = document.querySelector('.js-site-navigation')
  ```
+ Don’t use data attributes
+ Write More CSS Comments

## Mine

+ add spaces in html with angular ```{{}}``` to prevent elements collapsing. e.g. ```<div>{{{client.id}}} </div>```

### Bootstrap tips

+ centering div inside col-xx-nn

```css
div {
  display: table;
  margin: auto;
}
```

### Making a scrollabe list (select-like)

```html
<div class="dropdown-menu-scroll">
  <div><div>
  <!-- ... -->
</div>
  
```

```css
.dropdown-menu-scroll {
  overflow-y: scroll;
  height: 1000%;
}
```

### Hiding css without display:none

```css
div {
  position: absolute; 
  left: -999em;
}
```


