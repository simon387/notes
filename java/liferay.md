# liferay (MAINLY LIFERAY 7) note

## Intellij IDEA / other IDE trick

with this line

```jsp
<%@ page contentType="text/javascript" %>
```

you can have syntax highlight inside JSP

## liferay-ide (eclipse based)

deploy issues? you need to manually add ```liferay.workspace.home.dir=``` in ```gradle.properties```

## liferay modules (old plugins) installation location

```......./bundles/osgi/modules```

## gradle common errors

```
Execution failed for task ':initBundle'.
> Could not expand ZIP xxxxx
```

solution: ```rm -rf xxxxx``` and re-run the download task

## gogo shell

### access

example

```telnet localhost 11311```

### show bundles

```lb | grep Liferay```


### stop bundle

```stop $bundleId```

### start bundle

```start $bundleId```

NOTE: even if you re-deploy it, it is always in the stop(Resolved) state!

