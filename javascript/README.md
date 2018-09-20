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

## ARIA

ARIA (Accessible Rich Internet Applications)

Hide the element only for the screen reader

```html
<div aria-hidden=true></div>
``` 

Hide the element for everyone

```html
<div hidden>you can't see this</div>
```

## replace element types

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

## how to intercept DOM modification

Example of listening an "element injection"

```javascript
var tagContainer = document.querySelector("#<portlet:namespace />searchTokensContent");
tagContainer.addEventListener("DOMNodeInserted", function (ev) {
	console.log("EVENT TOKEN ADDED INTERCEPTED");
	
}, false);
```

## IE incompatibilities

+ Use ```myString.indexOf("otherString") > -1``` instead of ```myString.includes("otherString")```

## random usage of DOM modification

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

