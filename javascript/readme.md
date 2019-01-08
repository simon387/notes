# General notes on Javascript

+ [GOTO Liferay Notes](../java/liferay.md)
+ [Angular Notes](angular/readme.md)
+ [React Notes](react/readme.md)
+ [jsRender Notes](jsRender.md)

## Edge and IE Dev Tools Tricks

+ <kbd>F12</kbd> : toggle the Dev Tools

---

## Escape!

**Inside Strings**

```'``` becomes ```\x27```

```"``` becomes ```\x22```

---

## Style on logs

```javascript
console.log('%c I want this to be big and red', 'font-size: 30px; color: red;');
```

---

## Reply code challenge (lol!)

```solution.html```

```html
<script>setInterval(()=>document.body.style.backgroundColor='#'+(0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6),128)</script>
```

---

## Timeout

Call the function after n ms

```javascript
setTimeout(() => {
  //
}, 1000);
```

---

## Interval

Call the function every n ms

```javascript
window.setInterval(function(){
  /// call your function here
}, 5000);
```

---

## Range mapping

```javascript
Number.prototype.map = function (in_min, in_max, out_min, out_max) {
  return (this - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

var num = 5;
console.log(num.map(0, 10, -50, 50)); // 0
console.log(num.map(-20, 0, -100, 100)); // 150
```

---

## Replace element types

example by id, but works even by class

```javascript
replaceElem('h2', 'h1', '#test');

function replaceElem(oldElem, newElem, ctx) {
  oldElems = $(oldElem, ctx);
  //
  $.each(oldElems, function(idx, el) {
    var outerHTML, newOuterHTML, regexOpeningTag, regexClosingTag, tagName;
    // create RegExp dynamically for opening and closing tags
    tagName = $(el).get(0).tagName;
    regexOpeningTag = new RegExp('^<' + tagName, 'i'); 
    regexClosingTag = new RegExp(tagName + '>$', 'i');
    // fetch the outer elem with vanilla JS,
    outerHTML = el.outerHTML;
    // start replacing opening tag
    newOuterHTML = outerHTML.replace(regexOpeningTag, '<' + newElem);
    // continue replacing closing tag
    newOuterHTML = newOuterHTML.replace(regexClosingTag, newElem + '>');
    // replace the old elem with the new elem-string
    $(el).replaceWith(newOuterHTML);
  });

}
```

```css
h1 {
  color: white;
  background-color: blue;
  position: relative;
}

h1:before {
  content: 'this is h1';
  position: absolute;
  top: 0;
  left: 50%;
  font-size: 5px;
  background-color: black;
  color: yellow;
}
```

```html
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<div id="test">
  <h2>Foo</h2>
  <h2>Bar</h2>
</div>
```

---

## How to intercept DOM modification

Example of listening an "element injection"

```javascript
var tagContainer = document.querySelector("#<portlet:namespace />searchTokensContent");
tagContainer.addEventListener("DOMNodeInserted", function (ev) {
    console.log("EVENT TOKEN ADDED INTERCEPTED");

}, false);
```

---

## IE incompatibilities

+ Use ```myString.indexOf("otherString") > -1``` instead of ```myString.includes("otherString")```

+ ```new URL()``` not working! 

```javascript
var url_obj = new URL(url_string); //NOT WORKING IN IE
var sv = url_obj.searchParams.get("sv");
```

Use something like this:

```javascript
var api = getQueryString('api');

function getQueryString() {
    var key = false, res = {}, itm = null;
    // get the query string without the ?
    var qs = location.search.substring(1);
    // check for the key as an argument
    if (arguments.length > 0 && arguments[0].length > 1)
        key = arguments[0];
    // make a regex pattern to grab key/value
    var pattern = /([^&=]+)=([^&]*)/g;
    // loop the items in the query string, either
    // find a match to the argument, or build an object
    // with key/value pairs
    while (itm = pattern.exec(qs)) {
        if (key !== false && decodeURIComponent(itm[1]) === key)
            return decodeURIComponent(itm[2]);
        else if (key === false)
            res[decodeURIComponent(itm[1])] = decodeURIComponent(itm[2]);
    }

    return key === false ? res : null;
}
```

---

## Random usage of DOM modification

```javascript
function a() {
    /* get all nodes by class and not having the flag class
     * cycling:
     * 	adding class to flag it off 
     *	add the span
     */
    var elements = document.getElementsByClassName("random-class");
    var i;
    for (i = 0; i < elements.length; i++) {
        if (elements[i].classList.contains("random-class-elaborated")) {
            //do nothing
        } else {
            elements[i].classList.add("random-class-elaborated");
            var newSpan = document.createElement("span");
            newSpan.style.textIndent = '-1000px';
            newSpan.style.position = 'absolute';
            newSpan.style.left = '-999em';
            newSpan.appendChild(document.createTextNode('Tag:'));
            elements[i].insertBefore(newSpan, elements[i].firstChild);
        }
    }
}

function b() {
    var elements = document.getElementsByClassName('random-class');
    var i;
    for (i = 0; i < elements.length; i++) {
        var tagName = elements[i].parentElement.children[1].textContent;
        elements[i].title = 'title ' + tagName;
    }
}
```

---

## jQuery & CO

### [jquery-nice-select](https://github.com/hernansartorio/jquery-nice-select)

Note: when you select items from the *fake* ```<select>``` the *real* one is not updated with the ```selected``` attribute!

**NEVER USE THIS PLUGIN PLEAZE**

---

### Partial id selection example

```javascript
$("div[id^=sub-stringa-prefissa-croccantina-]").remove();
```

---

### Cloning and appending example

+ cloning is a deep one
+ append to the bottom

```javascript
$("#id").clone().appendTo("#otherID");
```

---

### Appending as first element

```javascript
$("#target").prepend($("#readFrom").clone());
```

---

### Just inserting html in an element

```javascript
$("#myElement").append('<label>Casa</label>');
```

---

## Another way to debug

This will trigger the browser's debugger

Just write ```debugger``` in the js code

---

## Get bootstrap version in javascript console

```javascript
$.fn.tooltip.Constructor.VERSION
```

---

## GetURLParameter example

```javascript
function getURLParameter(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) {
            return sParameterName[1];
        }
    }
}​

//example of usage:
var tech = getURLParameter('technology');
```

---

## Select option value by its text

```javascript
$('#mySelect option:contains(' + value + ')').each(function(){
    if ($(this).text() == value) {
        $(this).attr('selected', 'selected');
        return false;
    }
    return true;
});
```

---

## Link with ```href="javascript:void(0)"```

```html
<a href="javascript:void(0)"></a>
```

Does nothing and doesn't reload the page.

---

## Intercept browser's back button example

**NOTE: THIS EXAMPLE WILL FIRE A JS STACKOVERFLOW WHEN CLICKIN ON AN ```<a>``` WITH ```href='#'```**

```javascript
(function() {
  if (window.history && window.history.pushState) {
    $(window).on('popstate', function() {
      event.stopPropagation();
      alert('Back button was pressed.');
    });
  }
})();
```

For example, force reloading after that event:

```javascript
(function() {
  if (window.history && window.history.pushState) {
    $(window).on('popstate', function(event) {
      event.stopPropagation();
      window.location.href = window.location.href;
    });
  }
})();
```

---

## Read url parameter

```javascript
var url_string = "http://www.example.com/t.html?a=1&b=3&c=m2-m3-m4-m5"; //window.location.href
var url = new URL(url_string);
var c = url.searchParams.get("c");
console.log(c);
```

---

## Counting match in string

```javascript
var slashCount = (pathName.match(/\//g) || []).length;
```

---

## Online Minifier (.min)

Use this site!

[javascript-minifier.com](https://javascript-minifier.com/)

---

## Click by js

```javascript
document.getElementById('yourLinkID').click();
```

---

## Intercepting windows resize by device switch

Note: does not work on window resize by mouse.

```javascript
$(window).on('orientationchange', function(event) {
    location.reload();
});
```

---

## Dynamic href

```javascript
<a href="javascript:void()" onclick="return myMethod('test');">
```

---

## Arrays checks

```javascript
var isEmptyArray = function(arr) {
    return (arr || []).length === 0;
}

var arr1 = [1, 2, 3];
var arr2 = [];
var arr3 = undefined;

console.log(isEmptyArray(arr1));  // false
console.log(isEmptyArray(arr2));  // true
console.log(isEmptyArray(arr3));  // true
```

---

## Change url without refresh

(only the "last part")

```javascript
window.history.replaceState({}, document.title, "/" + "my-new-url.html");
```

---

## Remove query parameter from string url

```javascript
function removeParam(key, sourceURL) {
    var rtn = sourceURL.split("?")[0],
        param,
        params_arr = [],
        queryString = (sourceURL.indexOf("?") !== -1) ? sourceURL.split("?")[1] : "";
    if (queryString !== "") {
        params_arr = queryString.split("&");
        for (var i = params_arr.length - 1; i >= 0; i -= 1) {
            param = params_arr[i].split("=")[0];
            if (param === key) {
                params_arr.splice(i, 1);
            }
        }
        rtn = rtn + "?" + params_arr.join("&");
    }
    return rtn;
}
```

---

## Function on element sub tree change

It's bad design and deprecated but... whatever!

```javascript
$('#elementId').bind("DOMSubtreeModified", function(){
   myFunction();
});
```
