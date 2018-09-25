# Liferay (MAINLY LIFERAY 7 DXP) notes

But not only Liferay infos, I put here even some random web dev tricks learned in my Spain experience

+ [General Javascript Notes](https://github.com/simon387/notes/blob/master/javascript/README.md)
+ [General CSS Notes](https://github.com/simon387/notes/blob/master/css/README.md)
+ [General HTML Notes](https://github.com/simon387/notes/blob/master/HTML.md)
+ [General Java Notes](https://github.com/simon387/notes/blob/master/java/README.md)
+ [General Freemarker Notes](https://github.com/simon387/notes/blob/master/java/freemarker.md)
+ [General Velocity Notes](https://github.com/simon387/notes/blob/master/java/velocity.md)
+ [General MySql Notes](https://github.com/simon387/notes/blob/master/sql/mysql.md)

## Intellij IDEA / other IDE trick

with this line

```jsp
<%@ page contentType="text/javascript" %>
```

you can have syntax highlight inside JSP

## Liferay-ide (eclipse based)

+ deploy issues? you need to manually add ```liferay.workspace.home.dir=``` in ```gradle.properties```
+ importing new mavent project **from source** (no vcs? bad!): copy it inside the workspace **before** importing

### Importing modules from project

right click somewhere inside the project and import recursively all the modules as gradle projects

### Theme management

+ there is no ```diff``` directory like Liferay 6.x

using gradle tasks!

+ if you don't find the task: maybe you need to import the module as project, then you can find it in the gradle task window

Files ```*.ftl``` are freemarkers template!

#### (Hot) Deploy

If the IDE doesn't publish it automatically (maybe the theme module is not in the add/remove server list):

1. always task clean
2. build the war
3. usually you can find the war file in ```...\PROJECT_NAME\themes\THEME_NAME\build\libs\```
4. put it in the ```deploy``` directory

## Liferay modules (old plugins) installation location

```......./bundles/osgi/modules```

## How to debug javascript

1. add to the url ```?js_fast_load=0&css_fast_load=0&strip=0```
2. if any (js)error will appear, you can see the code line in the browser console
3. add breakpoint on that line

## Java side logging

Add a private static SLF4J Logger field.

```java
private static Logger _logger;
```

Instantiate the logger.

```java
_logger = LoggerFactory.getLogger(this.getClass().getName());
```

Throughout your class, log messages where noteworthy things happen.

For example,

```java
_logger.debug("...");
_logger.warn("...");
_logger.error("...");
```


## How to add custom functions in javascript aui context

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

## Jsp's with aui and similar

### Redirect button examlple

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

### Core jsp with parameter example

jsp core one (its an example): ```\webapps\ROOT\html\taglib\aui\fieldset\start.jsp```

inside ```<%@ include file="/html/taglib/taglib-init.jsp" %>```

you can find the variables initialization

for example: ```java.lang.String label = GetterUtil.getString((java.lang.String)request.getAttribute("aui:fieldset:label"));```

you can use it inside your own portlet in this way:

```jsp
<aui:fieldset label="value here" cssClass="accessibleLegend"> 
```

rendered html: 

```html
<fieldset class="fieldset accessibleLegend">
	<legend class="fieldset-legend">
		<span class="legend">value here</span></legend><div class=""> 
		...
```

### Override a jsp

just use an hook, and put the jsp inside it with the same name of the original one

## Override a core javascript file

how to redefine lifeportal javascript ? ```//TODO```

[take a look at this](https://dev.liferay.com/develop/tutorials/-/knowledge_base/7-0/overriding-liferays-default-yui-and-aui-modules)

or...

You can avoid this using pure javascript, but is a bad solution(but faster)!

## General Liferay Javascript

### On portlet ready inside jsp

example:

```jsp
<%-- on portlet ready --%>
<aui:script>
  AUI().ready(
    function() {
      console.log("ON_PORTLET_READY_TEST");
    }
  );
</aui:script>
```

## Language.properties

### Properties with parameters

in jsp:

```jsp
<liferay-ui:message key="welcome-x" arguments="<%= user.getScreenName() %>" />
```

properties file

```properties
welcome-x=Welcome{0}!
```

## Gogo shell

### Access

example

```telnet localhost 11311```

pay caution! don't kill this process or type ```exit``` ! will kill the Tomcat! use the ```disconnect``` command!

### Show bundles

```lb | grep Liferay```


### Stop bundle

```stop $bundleId```

very different from ```unistall``` !!

### Start bundle

```start $bundleId```

NOTE: even if you re-deploy it, it is always in the stop(Resolved) state!

## Liferay startup errors

+ remember to set ```liferay.home``` in ```portal-setup-wizard.properties```
+ delete ```/osgi/state```
+ change if needed database connection info in ```/tomcat/conf/context.xml```
+ increase if needed ```-Xmx``` and ```-XX:MaxPermSize=``` inside ```tomcat/bin/setenv.*```
+ !! dunno why changing log levels in ```logging.properties``` solved a startup freezing on loading spring context !!

## Localhost only environment tricks

+ inside ```portal-ext.properties``` set ```module.framework.properties.lpkg.index.validator.enabled=false``` to decrease startup time

## How to create a new hook

TODO

## Patching tool

+ only available on EE

1. download the .zip
2. copy it under ```/[liferay_directory]/patching-tool/patches/```
3. delete old zips if presents
4. STOP THE SERVER
5. run ```patching-tool install```
6. if all right start the server, otherwise fix things :(
7. even if the procedure worked, Liferay will never start up again correctly
8. redeploy and fix things?

Running example:

![running example](https://user-images.githubusercontent.com/18740246/45815855-3bfb0880-bcda-11e8-9c19-4056e26bba73.png)

## Gradle

+ comments in ```build.gradle``` are java like

### Gradle common errors

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

## Deploy

put jars under ```/deploy/``` dir

## Css

### Targetting browsers

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

## HTML

+ main-resources like footer.html can be edited as admin user in Liferay under ```Content > Web Content```

### Getting img from theme

from jsp:

```jsp
<img src="<%= themeDisplay.getPathThemeImages() %>/img.png" />
```

## Application Display Template (ADT)

+ database table: ```ddmtemplate```
  + after editing one row, I had to restart Liferay to see the effect (lol)
+ you can edit them as admin user in Liferay under ```Configuration > Application Display Template```

## Site Settings

Site entry are save by AssetEntry model -  ```assetentry``` table.

## Liferay AUDIT

+ to see if it is installed: ```Control Panel -> Configuration -> System Settings -> Foundation -> Audit```
+ to go to the panel: ```Control Panel -> Configuration -> Audit```

+ [info link](https://www.xtivia.com/liferay-dxp-audit-service/)
+ [info link](https://dzone.com/articles/liferay-7-cloud-amqp-audit-message-processor)
+ [info link](https://web.liferay.com/community/wiki/-/wiki/Main/Audit+Service)
+ [info link](https://web.liferay.com/community/wiki/-/wiki/Main/Adding+Auditing+Functionality+to+Portlets)

## Location of urlrewrite.xml

```...\tomcat-8.0.32\webapps\ROOT\WEB-INF\urlrewrite.xml```

## Liferay 6.1-6.2 notes

+ ```public class com.liferay.portal.servlet.filters.dynamiccss.DynamicCSSUtil``` -> theme sass cache generation trigger
+ plugins:
  + portlet
  + hook
  + theme
  + ext
  + layout
+ set proxy inside dev environment
  build-common-ivy.xml
  ```xml
  <!-- before "if not avalable file=''"-->
  <setproxy proxyhost="" proxyport=""/>
  ```
+ Eclipse setup example
  + download Eclipse
  + download and install Liferay IDE from Eclipse marketplace or web
  + create new workspace
  + set the jdk
  + download from project version system the sdk
  + set the just downloaded sdk as default
  + if you want you can set the source folder, tomcat bundle zip and javadoc
  + to edit a Liferay plugin just export from sdk (project nature:liferay should be already enabled)
  + now the Liferay menu should be enabled from context menu (es. right click on project, Liferay, build)
  + set the proxy if any in ```build-common-ivy.xml```
    + ```<setproxy proxyhost="" proxyport=""/>```
  + if some library cannot be downloaded automatically from ivy, just download and add it in ```/liferay-plugins-sdk-6.2/.ivy/cache``` (unzipped) [example of added zip](https://github.com/simon387/job_note/blob/master/java/jars/biz.zip)
  + to include the Liferay source code into Eclipse:
    + right click on Package Explorer
    + import
    + Existing project into Workspace
+ EXT deploy example
  + stop Liferay
  + remove the old ext
    + ```sudo rm /opt/liferay/liferay-portal-6.2-ce-ga2/tomcat-7.0.42/lib/ext/ext-NAME-ext-service.jar```
    + ```sudo rm -rf /opt/liferay/liferay-portal-6.2-ce-ga2/tomcat-7.0.42/webapps/NAME-ext/```
    + ```sudo rm /opt/liferay/liferay-portal-6.2-ce-ga2/tomcat-7.0.42/webapps/ROOT/WEB-INF/ext-NAME-ext.xml```
    + ```sudo rm /opt/liferay/liferay/tomcat-7.0.42/webapps/ROOT/WEB-INF/lib/ext-NAME-ext-*```
  + start Liferay
  + after complete startup, deploy the war (just cp it)
  + always check logs
  + at the end restart Liferay

## Bugs / errors / general problems

Sometime they are not related to Liferay, but I put them here anyway because I suppose they are pretty common in a LF environment!

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

### No login iterface available?

Just go to ```[baseurl]/c/portal/login```

example: ```localhost:8080/c/portal/login```

## Nice links

+ [Alternate text for css background images](http://davidmacd.com/blog/alternate-text-for-css-background-images.html)
+ [Using a Custom Bundle for the Liferay Workspace](https://community.liferay.com/es/blogs/-/blogs/using-a-custom-bundle-for-the-liferay-workspace)

