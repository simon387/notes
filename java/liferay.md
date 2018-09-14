# liferay (MAINLY LIFERAY 7) note

## Intellij IDEA / other IDE trick

with this line

```jsp
<%@ page contentType="text/javascript" %>
```

you can have syntax highlight inside JSP

## liferay-ide (eclipse based)

deploy issues? you need to manually add ```liferay.workspace.home.dir=``` in ```gradle.properties```

### importing modules from project

right click somewhere inside the project and import recursively all the modules as gradle projects

### theme management

+ there is no ```diff``` directory like liferay 6.x

using gradle tasks!

+ if you don't find the task: maybe you need to import the module as project, then you can find it in the gradle task window

#### (hot) deploy

If the IDE doesn't publish it automatically (maybe the theme module is not in the add/remove server list):

1. always task clean
2. build the war
3. usually you can find the war file in ```...\PROJECT_NAME\themes\THEME_NAME\build\libs\```
4. put it in the ```deploy``` directory

## liferay modules (old plugins) installation location

```......./bundles/osgi/modules```

## how to debug javascript

1. add to the url ```?js_fast_load=0&css_fast_load=0&strip=0```
2. if any (js)error will appear, you can see the code line in the browser console
3. add breakpoint on that line

## how to add custom functions in javascript aui context

inside a jsp file

```javascript
<aui:script>
Liferay.provide(window, 'functionNameExample', 
  function(variable1, variable2, variable3, ...) {
    var A = AUI();
    ...
  },
['aui-base']
);
</aui:script>
```

## jsp's with aui and similar

### redirect button examlple

```jsp
<portlet:renderURL var="force_back">
	<portlet:param name="mvcPath" value="/html/blabla/view.jsp"/>
</portlet:renderURL>

<aui:form action="<%= blablaURL %>" method="post" name="nameBla" >
	<aui:button-row>
		<aui:button href="<%= force_back %>" type="cancel" />
	</aui:button-row>
</aui:form>
```

### There is no if-else, just if

```jsp
<c:if test="${user.age ge 40}">
	You are over the hill.
</c:if>
```

and the choose element

```jsp
<c:choose>
	<c:when test="${a boolean expr}">
		do something
	</c:when>
	<c:when test="${another boolean expr}">
		do something else
	</c:when>
	<c:otherwise>
		do this when nothing else is true
	</c:otherwise>
</c:choose>
```

## language.properties

### properties with parameters

in jsp:

```jsp
<liferay-ui:message key="welcome-x" arguments="<%= user.getScreenName() %>" />
```

properties file

```properties
welcome-x=Welcome{0}!
```

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

pay caution! don't kill this process or type ```exit``` ! will kill the Tomcat! use the ```disconnect``` command!

### show bundles

```lb | grep Liferay```


### stop bundle

```stop $bundleId```

very different from ```unistall``` !!

### start bundle

```start $bundleId```

NOTE: even if you re-deploy it, it is always in the stop(Resolved) state!

## liferay startup errors

+ remember to set ```liferay.home``` in ```portal-setup-wizard.properties```
+ delete ```/osgi/state```
+ change if needed database connection info in ```/tomcat/conf/context.xml```
+ increase if needed ```-Xmx``` and ```-XX:MaxPermSize=``` inside ```tomcat/bin/setenv.*```
+ !! dunno why changing log levels in ```logging.properties``` solved a startup freezing on loading spring context !!

## localhost only environment tricks

+ inside ```portal-ext.properties``` set ```module.framework.properties.lpkg.index.validator.enabled=false``` to decrease startup time

## patching tool

+ only available on EE

1. download the .zip
2. copy it under ```/[liferay_directory]/patching-tool/patches/```
3. delete old zips if presents
4. STOP THE SERVER
5. run ```patching-tool install```
6. if all right start the server, otherwise fix things :(
7. even if the procedure worked, liferay will never start up again correctly
8. redeploy and fix things?

## gradle

+ comments in ```build.gradle``` are java like

## deploy

put jars under ```/deploy/``` dir

## css

### targetting browsers

```css
.ie .example {
}
.firefox .example {
}
/* EDGE ONLY */
@supports (-ms-ime-align: auto) {
  .example {
  }
}
```

### getting img from theme

from jsp:

```jsp
<img src="<%= themeDisplay.getPathThemeImages() %>/img.png" />
```

## Application Display Template (ADT)

+ database table: ```ddmtemplate```
  + after editing one row, I had to restart liferay to see the effect (lol)

## bugs / errors

Sometime they are not related to liferay, but I put them here anyway because I suppose they are pretty common in a LF environment!

### Could not resolve module

```
2018-09-05 16:17:35.292 ERROR [Framework Event Dispatcher: Equinox Container: d0fb4625-27b1-0018-117c-b64379ebebfd][XXX:97] FrameworkEvent ERROR 
org.osgi.framework.BundleException: Could not resolve module: XXX [84]_  Unresolved requirement: Import-Package: com.liferay.faces.portal.context_ [Sanitized]
	at org.eclipse.osgi.container.Module.start(Module.java:429)
	at org.eclipse.osgi.container.ModuleContainer$ContainerStartLevel.incStartLevel(ModuleContainer.java:1582)
	at org.eclipse.osgi.container.ModuleContainer$ContainerStartLevel.incStartLevel(ModuleContainer.java:1562)
	at org.eclipse.osgi.container.ModuleContainer$ContainerStartLevel.doContainerStartLevel(ModuleContainer.java:1533)
	at org.eclipse.osgi.container.ModuleContainer$ContainerStartLevel.dispatchEvent(ModuleContainer.java:1476)
	at org.eclipse.osgi.container.ModuleContainer$ContainerStartLevel.dispatchEvent(ModuleContainer.java:1)
	at org.eclipse.osgi.framework.eventmgr.EventManager.dispatchEvent(EventManager.java:230)
	at org.eclipse.osgi.framework.eventmgr.EventManager$EventThread.run(EventManager.java:340)
```

was a fake error, inside the ```osgi/war``` folder there was the XXX.war, it was deprecated and not used in the environment

gogo shell helpfull command:

```g! packages com.liferay.faces.portal.context_```

result:

```No exported packages```

### Html elements not working properly inside the portal

you got some javascript errors, check the browser javascript console!

### No tag "" defined in tag library imported with prefix "portlet"

add in jsp 

```jsp
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
```

