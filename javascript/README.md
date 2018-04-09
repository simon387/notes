# general info on js

## style on logs

```javascript
console.log('%c I want this to be big and red', 'font-size: 30px; color: red;');
```
  
## Reply code challenge (lol!)

```solution.html```

```html
<script>setInterval(()=>document.body.style.backgroundColor='#'+(0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6),128)</script>
```

## timeout

```javascript
setTimeout(() => {
  //
}, 1000);
```

## range mapping 

```javascript
Number.prototype.map = function (in_min, in_max, out_min, out_max) {
  return (this - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

var num = 5;
console.log(num.map(0, 10, -50, 50)); // 0
console.log(num.map(-20, 0, -100, 100)); // 150
```

