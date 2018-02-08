# random notes on css

## ones from [freeCodeCamp](https://medium.freecodecamp.org/css-naming-conventions-that-will-save-you-hours-of-debugging-35cea737d849)

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

## mine

+ add spaces in html with angular ```{{}}``` to prevent elements collapsing. e.g. ```<div>{{{client.id}}} </div>```

### bootstrap tips

+ centering div inside col-xx-nn

```css
div {
  display: table;
  margin: auto;
}
```
