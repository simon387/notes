# General Gradle Notes

+ [GOTO Liferay Notes](liferay.md)

## Gradle comments

+ comments in ```build.gradle``` are java like

---

## Gradle common errors

```
Execution failed for task ':initBundle'.
> Could not expand ZIP xxxxx
```

solution: ```rm -rf xxxxx``` and re-run the download task

```
“URI has an authority component”
```

solution: (on windows environment) the three slashes after ```file:``` fixed the issue

example: ```liferay.workspace.bundle.url=file:///C://dev//liferay-dxp-digital-enterprise-7.0-sp3_FOR_IDEA.zip```

---
