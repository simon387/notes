# react random notes

## hello react

```html
<!DOCTYPE html>
<html>
<head lang="en">
 <meta charset="UTF-8">
 <title>Hello React</title>
 <script src="https://fb.me/react-with-addons-0.14.0.js">
 </script>
 <script src="https://fb.me/react-dom-0.14.0.js">
 </script>
</head>
<body>
 <script>
  var HelloReact = React.createClass({
   render: function() {
    return React.DOM.h1(null, 'Hello React');
   }
  });
  ReactDOM.render(React.createElement(HelloReact), document.body);
 </script>
</body>
</html>
```

## random notes

+ two includes:
  ```html
  <script src="https://fb.me/react-with-addons-0.14.0.js"></script>
  <script src="https://fb.me/react-dom-0.14.0.js"></script>
  ```
+ JSX ```<script src="http://fb.me/JSXTransformer-0.13.1.js"></script>```
  
  allows up to write ```return <h1>kek</h1>```

  ```<script type="text/jsx">```


