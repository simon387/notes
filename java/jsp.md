# JSP General notes

+ [GOTO Liferay Notes](liferay.md)

## General Syntax

Single Java instruction or variable in the HTML context

```jsp
'<%=LanguageUtil.get(locale, "key-name")%>'
```

---

Java code block

```jsp
<%
  String s = "";
%>
```

---

Java code outside ```doGet()``` and ```doPost()```

```jsp
<%! code %>
```

The exclamation mark makes all the difference. Since it's outside any method, such code typically includes things like variable declarations and complete method declarations. For example:

```jsp
<%! public static MyType varbl;

public long countEm() {
  long retval = 0L;
  retval *= varbl.toLong();
  return retval;
}
%>
```

---

## pageContext

```pageContext``` is an implicit object

---

## Never do that!

Stupid comment -.-

```jsp
<% } else { //elsecomment %>
```

But IDE like eclipse doesn't recognize that as an error!
