# Regex General Notes

[Regex Cheat Sheet](docs/regex_cheat_sheet.pdf)

---

## Matching string not containing substring

```firstpartofstring((?!mysubstring).)*$```

Example this expression ```@liferay((?!language).)*$``` **DOES NOT** match this line:

```freemarker
<@liferay.language key="bla.com" />
```

---
