# general info on js

## comment on logs

```javascript
console.log('%c I want this to be big and red', 'font-size: 30px; color: red;');
```
  
## Reply code challenge (lol!)

```solution.html```

```html
<script>setInterval(() => {document.body.style.backgroundColor = '#' + (0x1000000 + (Math.random()) * 0xffffff).toString(16).substr(1, 6)}, 128)</script>
```
