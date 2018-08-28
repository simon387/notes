# liferay (MAINLY LIFERAY 7) note

## Intellij IDEA / other IDE trick

with this line

```jsp
<%@ page contentType="text/javascript" %>
```

you can have syntax highlight inside JSP

## liferay-ide (eclipse based)

deploy issues? you need to manually add ```liferay.workspace.home.dir=``` in ```gradle.properties```

## liferay module (old plugin) installation location

```......./bundles/osgi/modules```

## gradle common errors

```
Execution failed for task ':initBundle'.
> Could not expand ZIP xxxxx
```

solution: ```rm -rf xxxxx``` and re-run the download task

