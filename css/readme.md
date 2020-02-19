# Random notes on CSS

+ [GOTO Liferay Notes](../java/liferay.md)

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

---

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

---

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

---

### Hiding css without display:none

Note: ```display:none``` has not opposites!

```css
div {
  position: absolute; 
  left: -999em;
}
```

---

### Basic STUPID selection

selecting an element by parent class and current class (NO WORRIES IF CLASSES IN MIDDLE)

```css
.outer-class .current-class {
}
```

both classes at the same time

```css
.a.b {
}
```

not having a class

```css
:not(.clazzz) {
}
```

---

## Mobile vs Desktop

### Show content on mobile devices

```html
<div class="mobileShow">TEXT OR IMAGE FOR MOBILE HERE</div>
```

```css
<style type="text/css">
  .mobileShow {display: none;}

  /* Smartphone Portrait and Landscape */
  @media only screen 
    and (min-device-width : 320px)
    and (max-device-width : 480px){
      .mobileShow {display: inline;}
  }
</style>
```

---

### Hide content on mobile devices

```html
<div class="mobileHide"> TEXT OR IMAGE NOT FOR MOBILE HERE </div>
```

```css
<style type="text/css">
  .mobileHide { display: inline; }

  /* Smartphone Portrait and Landscape */
  @media only screen 
    and (min-device-width : 320px)
    and (max-device-width : 480px){
     .mobileHide { display: none;}
  }
</style>
```

---

## scss

1. install sass
2. run ```sass --watch assets/scss/app.scss:assets/css/app.css``` (example of path)

```
[scelia@job Project_folder]$ tree
.
├── assets
│   ├── css
│   │   ├── app.css
│   │   ├── app.css.map
│   │   └── modules
│   ├── fonts
│   ├── images
│   │   ├── phone.svg
│   │   ├── Wind-Turbine-front@2x.png
│   │   ├── Wind-Turbine-left@2x.png
│   │   └── Wind-Turbine-right@2x.png
│   ├── js
│   │   ├── app
│   │   │   └── app.js
│   │   └── lib
│   └── scss
│       ├── app.scss
│       └── modules
├── company-dashboard-2-1.html
├── css
│   ├── app.css
│   ├── app.css.map
│   └── index.css
└── oldo_main.html

11 directories, 15 files
[scelia@job Project_folder]$ 
```

---

## position bottom-right example of a button

example bootstrap-less

```html
<div className="form-group col-md-6 " >
    <div className="btn-container">
        <button className="btn btn-primary" >
            <p>Save</p>
        </button>
    </div>
</div>
```

```css
.btn-container {
    position: absolute;
    bottom: 0;
    right: 0;
}
```

