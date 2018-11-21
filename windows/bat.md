# bat file general note

## @echo off 

```bat
@echo off
```

---

## if else

example:

```bat
if [%1]==[] (git commit -m "lazy") else (git commit -m "%1")
```

---

## read first parameter from command line

example:

```bat
if [%1]==[] (git commit -m "lazy") else (git commit -m "%1")
```

---

