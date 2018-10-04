# Liferay (MAINLY LIFERAY 7 DXP) notes

But not only Liferay infos, I put here even some random web dev tricks learned in my Spain experience

+ [General Java Notes](https://github.com/simon387/notes/blob/master/java/readme.md)
+ [General HTML Notes](https://github.com/simon387/notes/blob/master/HTML.md)
+ [General Javascript Notes](https://github.com/simon387/notes/blob/master/javascript/readme.md)
+ [General CSS Notes](https://github.com/simon387/notes/blob/master/css/readme.md)
+ [General MySql Notes](https://github.com/simon387/notes/blob/master/sql/readme.md)
+ [General Freemarker Notes](https://github.com/simon387/notes/blob/master/java/freemarker.md)
+ [General Velocity Notes](https://github.com/simon387/notes/blob/master/java/velocity.md)
+ [General Maven Notes](https://github.com/simon387/notes/blob/master/java/maven.md)
+ [General Gradle Notes](https://github.com/simon387/notes/blob/master/java/gradle.md)

---

## Intellij IDEA / other IDE trick

with this line

```jsp
<%@ page contentType="text/javascript" %>
```

you can have syntax highlight inside JSP

---

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

---

## Liferay modules (old plugins) installation location

```......./bundles/osgi/modules```

---

## How to debug javascript

1. add to the url ```?js_fast_load=0&css_fast_load=0&strip=0```
2. if any (js)error will appear, you can see the code line in the browser console
3. add breakpoint on that line

---

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

---

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

---

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

Just use an hook, and put the jsp inside it with the same name of the original one

---

## Override a core javascript file

how to redefine lifeportal javascript ? ```//TODO```

[take a look at this](https://dev.liferay.com/develop/tutorials/-/knowledge_base/7-0/overriding-liferays-default-yui-and-aui-modules)

or...

You can avoid this using pure javascript, but is a bad solution(but faster)!

---

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

---

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

---

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

---

## Liferay startup errors

+ remember to set ```liferay.home``` in ```portal-setup-wizard.properties```
+ delete ```/osgi/state```
+ change if needed database connection info in ```/tomcat/conf/context.xml```
+ increase if needed ```-Xmx``` and ```-XX:MaxPermSize=``` inside ```tomcat/bin/setenv.*```
+ !! dunno why changing log levels in ```logging.properties``` solved a startup freezing on loading spring context !!

---

## Localhost only environment tricks

+ inside ```portal-ext.properties``` set ```module.framework.properties.lpkg.index.validator.enabled=false``` to decrease startup time

---

## How to create a new "hook"

In liferay 7 DXP, I just created from maven/gradle a new osgi module (I.E.: it can be a random type of portlet) and I used the @Component mechanism to add/override the functionalities I needed

---

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

---

## Deploy

put jars under ```/deploy/``` dir

---

## CSS

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

---

## HTML

+ main-resources like footer.html can be edited as admin user in Liferay under ```Content > Web Content```

### Getting img from theme

from jsp:

```jsp
<img src="<%= themeDisplay.getPathThemeImages() %>/img.png" />
```

---

## Application Display Template (ADT)

+ database table: ```ddmtemplate```
  + after editing one row, I had to restart Liferay to see the effect (lol)
+ you can edit them as admin user in Liferay under ```Configuration > Application Display Template```

---

## Site Settings

Site entry are save by AssetEntry model -  ```assetentry``` table.


If ```assetentry.classNameId = 20045``` ~~it is the assetentry relative to the site~~. **NO, IT DEPENDS BY OTHER TABLE DATA, check the relations**

---

## Read Entities from database

Use always the ```xxxLocalServiceUtil...```

```java
AssetEntry assetEntry = AssetEntryLocalServiceUtil.getAssetEntry(newAssetEntry.getEntryId());
```

---

### DynamicQuery example

```java
DynamicQuery dynamicQuery = DynamicQueryFactoryUtil.forClass(Library.class);
dynamicQuery.add(RestrictionsFactoryUtil.like("bookName", "java"));
dynamicQuery.add(RestrictionsFactoryUtil.eq("author", "james"));
List results = LibraryLocalServiceUtil.dynamicQuery(dynamicQuery);
```

---

## Random database notes

+ Documents library files
  + DLFileEntry
    + the version is increased at every update
  + DLFileRank
  + DLFileShortcut
  + DLFileVersion
  + DLFolder

+ Web contents
  + JournalArticle
  + JournalArticleImage
  + JournalArticleResource
  + JournalContentSearch
  + JournalFeed
  + JournalStructure
  + JournalTemplate

---

## Liferay saxreaderutil

Usefull to parse xml to Java Object

---

## Liferay Listener

There are different type of listeners.

Example of a BaseModelListener:

```java
@Component(
		service = ModelListener.class,
		immediate = true
)
public class MyNewCustomOnAssetEntryEntityListener extends BaseModelListener<AssetEntry> {

	private static final Log logger = LogFactoryUtil.getLog(MyNewCustomOnAssetEntryEntityListener.class);
	
	@Override
	public void onBeforeUpdate(AssetEntry model) throws ModelListenerException {
		// TODO Auto-generated method stub

		logger.info(model.toString());

		super.onBeforeUpdate(model);
	}
}
```

---

## Comments on bnd.bnd file

It's like a java properties file, use the ```#``` at the start of the line

Example:

```properties
#Fragment-Host: com.liferay.site.admin.web;bundle-version="1.0.0"
```

---

## Liferay AUDIT

+ to see if it is installed: ```Control Panel -> Configuration -> System Settings -> Foundation -> Audit```
+ to go to the panel: ```Control Panel -> Configuration -> Audit```

+ [info link](https://www.xtivia.com/liferay-dxp-audit-service/)
+ [info link](https://dzone.com/articles/liferay-7-cloud-amqp-audit-message-processor)
+ [info link](https://web.liferay.com/community/wiki/-/wiki/Main/Audit+Service)
+ [info link](https://web.liferay.com/community/wiki/-/wiki/Main/Adding+Auditing+Functionality+to+Portlets)

Example inside an ```BaseModelListener```

```java
//assetEntry is an Entity, Model
try {
	String eventType = "event bla";
	long companyId = CompanyThreadLocal.getCompanyId().longValue();
	long userId = 0L;
	if (null != PrincipalThreadLocal.getName()) {
		userId = GetterUtil.getLong(PrincipalThreadLocal.getName());
	}
	AuditRequestThreadLocal auditRequestThreadLocal = AuditRequestThreadLocal.getAuditThreadLocal();
	long realUserId = auditRequestThreadLocal.getRealUserId();
	String realUserName = PortalUtil.getUserName(realUserId, "");
	JSONObject additionalInfo = JSONFactoryUtil.createJSONObject();
	
	if ((realUserId > 0L) && (userId != realUserId)) {
		additionalInfo.put("doAsUserId", String.valueOf(userId));
		additionalInfo.put("doAsUserName", PortalUtil.getUserName(userId, ""));
	}
	additionalInfo.put("name", organization.getName());
	additionalInfo.put("type",organization.getType());
	additionalInfo.put("countryId", organization.getCountryId());
	additionalInfo.put("regionId", organization.getRegionId());
	if(organization.getParentOrganization() != null) {
		additionalInfo.put("parentName", organization.getParentOrganization().getName());
	}
	
	AuditMessage auditMessage = new AuditMessage(
		eventType, companyId, realUserId, realUserName, AssetEntry.class.getName(), String.valueOf(assetEntry.getEntryId()), null, additionalInfo);
	
	AuditRouterUtil.route(auditMessage);
	
} catch(Exception exception) {
	throw new ModelListenerException(exception);
} finally {
	super.onAfterUpdate(assetEntry);
}
```

---

## Location of urlrewrite.xml

```...\tomcat-8.0.32\webapps\ROOT\WEB-INF\urlrewrite.xml```

---

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

---

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

---

## Classes

+ ```SiteAdminPortletKeys```

```java
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.liferay.site.admin.web.internal.constants;

/**
 * @author Eudaldo Alonso
 */
public class SiteAdminPortletKeys {

	public static final String SITE_ADMIN =
		"com_liferay_site_admin_web_portlet_SiteAdminPortlet";

	public static final String SITE_SETTINGS =
		"com_liferay_site_admin_web_portlet_SiteSettingsPortlet";

}
```

## Useful Java methods

```java
public static long classNameIdForClass(Class<?> clazz)
  throws SystemException {
 return ClassNameLocalServiceUtil
   .getClassName(clazz.getName())
   .getClassNameId();
}
```

```java
public static Class<?> classForClassNameId(long classNameId)
  throws PortalException, SystemException {
 try {
  String modelClassName = ClassNameLocalServiceUtil
    .getClassName(classNameId)
    .getValue();
  return Class.forName(modelClassName);
 } catch (ClassNotFoundException e) {
  throw new SystemException(e);
 }
}
```

---

## Liferay Philosophy

+ Everything is an Asset!

---

## Liferay best practices

In maven or gradle projects, always create a parent module per osgi module... so you can put inside service builders sub-modules (for example)

---

## Nice links

+ [Alternate text for css background images](http://davidmacd.com/blog/alternate-text-for-css-background-images.html)
+ [Using a Custom Bundle for the Liferay Workspace](https://community.liferay.com/es/blogs/-/blogs/using-a-custom-bundle-for-the-liferay-workspace)
+ [Override command from Site Admin Portlet](https://community.liferay.com/it/forums/-/message_boards/message/106482937)
+ [Event tracking by JS](https://www.xtivia.com/google-analytics-event-tracking-liferay/)
+ [Portlet filters in Liferay 7 dxp](https://www.liferaystack.com/2017/09/portlet-filters-in-liferay-7-dxp.html)

---
