# Liferay (MAINLY LIFERAY 7 DXP) Notes

But not only Liferay infos, I put here even some random web dev tricks learned in my experience

+ [General Java Notes](readme.md)
+ [General JSP Notes](jsp.md)
+ [General HTML Notes](../HTML.md)
+ [General Javascript Notes](../javascript/readme.md)
+ [General CSS Notes](../css/readme.md)
+ [General MySql Notes](../sql/readme.md)
+ [General Freemarker Notes](freemarker.md)
+ [General Velocity Notes](velocity.md)
+ [General Maven Notes](maven.md)
+ [General Gradle Notes](gradle.md)
+ [General jMeter Notes](jmeter.md)

---

## Intellij IDEA / other IDE trick

### Sysntax highlight JSP

with this line

```jsp
<%@ page contentType="text/javascript" %>
```

you can have syntax highlight inside JSP

---

### OSGI modules with maven

If the module doesn't have the "square" on IDEA GUI, check the ```pom.xml``` configuration, even of the parent one (take a look at the ```<modules>``` tags)

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

### Service Builder Module(s)

How to create and configure (with Liferay IDE):

Maven instructions:

1. create an osgi module (portlet, hook, doesn't matter)
2. create a sub-module, with for the example the name of the entity you want to create/map
   + **Specify the right Location** by hand, ```Liferay Developer Studio Version: 3.3.0.201808240530-ga1``` is bugged and doesn't create the submodule properly
   + Project Type: ```Liferay Module Project```
   + Project Name: something similar to the entity you want to create/map
   + Build Type: depends on other modules
   + Project Template Name: ```service-builder```
   + Package Name: follow the project naming convenction, please
3. at the end of the wizard, modify the ```service.xml```, see [the doc](https://docs.liferay.com/portal/7.0/definitions/liferay-service-builder_7_0_0.dtd.html)
4. build services! right click on the module, ```Liferay```, ```build-service```
5. check if every classes have been generated
6. add the maven dependency in the project you would like to use the services

Example of a simple ```service.xml```:

```xml
<?xml version="1.0"?>
<!DOCTYPE service-builder PUBLIC "-//Liferay//DTD Service Builder 7.0.0//EN" "http://www.liferay.com/dtd/liferay-service-builder_7_0_0.dtd">

<service-builder package-path="it.simonecelia.liferay">
    <namespace>blabla_entity</namespace>
    <!--<entity data-source="sampleDataSource" local-service="true" name="Foo" remote-service="false" session-factory="sampleSessionFactory" table="foo" tx-manager="sampleTransactionManager uuid="true"">-->
    <entity local-service="true" name="EntityName" remote-service="false" uuid="true">

        <!-- PK fields -->

        <column name="entityNameId" primary="true" type="long" />

        <!-- Group instance -->

        <column name="groupId" type="long" />

        <!-- Audit fields -->

        <column name="companyId" type="long" />
        <column name="userId" type="long" />
        <column name="userName" type="String" />
        <column name="createDate" type="Date" />
        <column name="modifiedDate" type="Date" />

        <!-- Other fields -->

        <column name="name" type="String" primary="true"/>
        <column name="enabled" type="boolean" />
<!-- 		<column name="field3" type="int" /> -->
<!-- 		<column name="field4" type="Date" /> -->
        <column name="description" type="String" />

        <!-- Order -->

<!-- 		<order by="asc"> -->
<!-- 			<order-column name="field1" /> -->
<!-- 		</order> -->

        <!-- Finder methods -->

         <finder name="entityName" return-type="EntityName" unique="true" >
             <finder-column name="name" />
         </finder>

        <!-- References -->

<!-- 		<reference entity="AssetEntry" package-path="com.liferay.portlet.asset" /> -->
<!-- 		<reference entity="AssetTag" package-path="com.liferay.portlet.asset" /> -->
    </entity>
</service-builder>
```

**service builder does not generate methods for finders!!!**

You have to manual edit the file ```<entityName>LocalServiceImpl.java```

add for example:

```java
public EntityName findByName(String name) throws NoSuchEntityNameException {
	return entityNamePersistence.findBylistenerName(name);
}
```

and the run the build of the service builder again!

**DOES NOT WORK ANYWAY**

Just write a dynamic query, *byebye* the finders!

---

#### Running service builder in cmd

maven (inside the ```service.xml``` folder):

```mvn service-builder:build```

**Note**: remember to delete generated sources and binaries.

---

#### Adding data from java

```java
EntityName entityName = new EntityName();
entityName.setBlablablablabla();
EntityNameLocalServiceUtil.addEntityName(entityName);
```

Doesn't work, the project compiles but the deployment process never ends.

Solution:

```java
EntityName entityName = EntityNameLocalServiceUtil.createEntityName(CounterLocalServiceUtil.increment());
entityName.setBlablablablabla();
EntityNameLocalServiceUtil.addEntityName(entityName);
```

---

#### Common errors

```[ERROR] No plugin found for prefix 'service-builder' in the current project and in the plugin groups [org.apache.maven.plugins, org.codehaus.mojo] available from the repositories [local (C:\Users\Simone\.m2\repository), central (https://repo.maven.apache.org/maven2)] -> [Help 1]```

You miss the plugin in the ```pom.xml```, example: 

```xml
<build>
  <plugins>
    <plugin>
      <groupId>com.liferay</groupId>
      <artifactId>com.liferay.portal.tools.service.builder</artifactId>
      <version>1.0.228</version>
      <configuration>
        <apiDirName>../xx-xxxx-xxxx-xx-persistence-api/src/main/java</apiDirName>
        <autoNamespaceTables>true</autoNamespaceTables>
        <buildNumberIncrement>true</buildNumberIncrement>
        <hbmFileName>src/main/resources/META-INF/module-hbm.xml</hbmFileName>
        <implDirName>src/main/java</implDirName>
        <mergeModelHintsConfigs>src/main/resources/META-INF/portlet-model-hints.xml</mergeModelHintsConfigs>
        <modelHintsFileName>src/main/resources/META-INF/portlet-model-hints.xml</modelHintsFileName>
        <osgiModule>true</osgiModule>
        <propsUtil>xx.xxxx.xxxx.xx.persistence.service.util.ServiceProps</propsUtil>
        <resourcesDirName>src/main/resources</resourcesDirName>
        <springFileName>src/main/resources/META-INF/spring/module-spring.xml</springFileName>
        <sqlDirName>src/main/resources/META-INF/sql</sqlDirName>
        <sqlFileName>tables.sql</sqlFileName>
      </configuration>
    </plugin>
  </plugins>
</build>
```

**OR**

You need to decrease the ```<version>x.x.xxx</version>``` tag, use the ones of other modules, if any

---

```No entity column exist with column database name ...```

+ delete all generated source by the service builder
+ avoid to use column name similar with sql keyboard (like ```name```)

---

```Service builder "error: cannot find symbol```

A client cannot find a method that exists in a new version of service builder generated code?

+ Delete state, temp, work folders, remove services and apis module from osgi module, redeploy.

---

#### Tips

+ if Liferay does not generate service builder's sql tables, you can find the definition in the ```*ModelImpl.java``` class

---

#### Where to put custom method in a service ?

looks for this string

```All custom service methods should be put in this class. Whenever methods are added, rerun ServiceBuilder to copy their definitions into the```

in java generated code

---

## Liferay modules (old plugins) installation location

```......./bundles/osgi/modules```

---

## How to debug javascript

1. add to the url ```?js_fast_load=0&css_fast_load=0&strip=0```
2. if any (js)error will appear, you can see the code line in the browser console
3. add breakpoint on that line

---

## Logging

### Java side logging

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

### JSP side logging

```jsp
<%@ page import="com.liferay.portal.kernel.log.LogFactoryUtil" %>
<%@ page import="com.liferay.portal.kernel.log.Log" %>
<%! private static Log _log = LogFactoryUtil.getLog("mypackage.html.myfile.jsp"); %>
```

---

## General JSP

### Current page name in JSP

```jsp
<%@ page import = "com.liferay.portal.kernel.util.WebKeys" %>
<%@ page import = "com.liferay.portal.theme.ThemeDisplay" %>

<%
ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
String pageName = themeDisplay.getLayout().getName(themeDisplay.getLocale());
%>
```

For example, in the login page: ```pageName.equals("Login")```

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

How to redefine lifeportal javascript ?

[take a look at this](https://dev.liferay.com/develop/tutorials/-/knowledge_base/7-0/overriding-liferays-default-yui-and-aui-modules)

or...

You can avoid this using pure javascript, but is a bad solution(but faster)!

---

## Control Panel Portlets

You can develop a module as a control Panel portlet in a very easy way

Maven Module Structure example:

```
My-Module
│   bnd.bnd
│   mvnw
│   mvnw.cmd
│   pom.xml
├───src
│   └───main
│       ├───java
│       │   └───com
│       │       └───simonecelia
│       │           └───backoffice
│       │               ├───constants
│       │               │       BackofficePortletKeys.java
│       │               │
│       │               ├───panel
│       │               │       BackofficePanelApp.java
│       │               │
│       │               ├───portlet
│       │               │       BackofficePortlet.java
│       │               │
│       │               └───util
│       │                       BackofficeUtil.java
│       │
│       └───resources
│           ├───content
│           │       Language.properties
│           │
│           └───META-INF
│               └───resources
│                   │   action.jsp
│                   │   init.jsp
│                   │   view.jsp
│                   │
│                   └───css
│                           main.css

```

```java
@Component(
		immediate = true,
		property = {
				"panel.category.key=" + PanelCategoryKeys.CONTROL_PANEL_CONFIGURATION,
				"panel.app.order:Integer=301"
		},
		service = PanelApp.class
)
public class BackofficePanelApp extends BasePanelApp {

	@Override
	public String getPortletId() {
		return BackofficePortletKeys.BackofficePortlet;
	}

	@Override
	public String getLabel(Locale locale) {
		ResourceBundle resourceBundle = ResourceBundleUtil.getBundle("content.Language", locale, getClass());

		return LanguageUtil.get(resourceBundle, "javax.portlet.display-name.backofficePortlet");
	}

	@Override
	@Reference(
			target = "(javax.portlet.name=" + BackofficePortletKeys.BackofficePortlet + ")",
			unbind = "-"
	)
	public void setPortlet(Portlet portlet) {
		super.setPortlet(portlet);
	}
}

```

```java
@Component(immediate = true, property = { "com.liferay.portlet.display-category=category.hidden",
		"javax.portlet.display-name=Blabla Backoffice", "javax.portlet.init-param.template-path=/",
		"com.liferay.portlet.header-portlet-css=/css/main.css", "javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + BackofficePortletKeys.BackofficePortlet,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user" }, service = Portlet.class)
public class BackofficePortlet extends MVCPortlet {

	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		super.doView(renderRequest, renderResponse);
	}

	//custom
	public void enablingXXX(ActionRequest actionRequest, ActionResponse actionResponse) {
		long xxxListenerId = ParamUtil.getLong(actionRequest, FORM_XXX_ID);

		try {
			
		} catch (PortalException portalException) {
			portalException.printStackTrace();
		}
		SessionMessages.add(actionRequest, "xxxEnabled");
	}

	...
}
```

```view.jsp```

```jsp
<%@ page import="com.liferay.portal.kernel.language.LanguageUtil" %>
<%@ page import="com.liferay.portal.kernel.util.Constants" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="package.service.XxxLocalServiceUtil" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/frontend" prefix="liferay-frontend" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<liferay-theme:defineObjects/>
<liferay-frontend:defineObjects/>
<portlet:defineObjects/>

<liferay-ui:success key="xxxEnabled" message="package.backoffice.jsp.message.xxx.enabled"/>

<div class="container">
    <div class="col-md-12">
        <div class=" ">
            <h2><liferay-ui:message key="package.backoffice.main.title" /></h2>
        </div>
        <div class="backofficeView">
            <liferay-ui:search-container emptyResultsMessage="package.backoffice.table.empty" total="<%= XxxLocalServiceUtil.getXxxListenersCount() %>" delta="20" deltaConfigurable="false">
                <liferay-ui:search-container-results
                        results="<%= XxxListenerLocalServiceUtil.getXxxListeners(searchContainer.getStart(), searchContainer.getEnd() ) %>"
                />
                <liferay-ui:search-container-row
                        className="package.sb.model.XxxListener"
                        modelVar="aXxxListener"
                >
                    <liferay-ui:search-container-column-text cssClass="width-15" name="package.backoffice.form.name" value="<%=aXxxListener.getListenerName()%>" />
                    <liferay-ui:search-container-column-text cssClass="width-15" name="package.backoffice.form.description" value="<%=aXxxListener.getDescription()%>" />
                    <liferay-ui:search-container-column-text cssClass="width-15" name="package.backoffice.form.enabled" value="<%=String.valueOf(aXxxListener.isEnabled())%>" />
                    <liferay-ui:search-container-column-jsp  cssClass="width-10" path="/action.jsp" name="package.backoffice.form.actions" />
                </liferay-ui:search-container-row>
                <liferay-ui:search-iterator />
            </liferay-ui:search-container>
        </div>
    </div>
</div>
```

```action.jsp```

```jsp
<%@ page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@ page import="com.liferay.portal.kernel.dao.search.ResultRow"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/frontend" prefix="liferay-frontend"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ page import="package.model.XxxListener" %>

<liferay-theme:defineObjects />
<liferay-frontend:defineObjects />
<portlet:defineObjects />
<%
    ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);
    XxxListener aXxxListener = (XxxListener)row.getObject();
%>

<liferay-ui:icon-menu>
    <portlet:actionURL name="enablingListener" var="enablingListenerURL">
        <portlet:param name="listenerId" value="<%= String.valueOf(aXxxListener.getListenerId())%>" />
    </portlet:actionURL>
    <liferay-ui:icon message="package.backoffice.form.actions.enabling" iconCssClass="icon-exclamation-sign" url="<%= enablingListenerURL %>" />

    <portlet:actionURL name="disablingListener" var="disablingListenerURL">
        <portlet:param name="listenerId" value="<%= String.valueOf(aXxxListener.getListenerId())%>" />
    </portlet:actionURL>
    <liferay-ui:icon message="package.backoffice.form.actions.disabling" iconCssClass="icon-remove" url="<%= disablingListenerURL %>" />
</liferay-ui:icon-menu>
```

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
+ delete ```temp``` and ```work``` directories
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

They are similar to the templates under web contents, remember to search in both location if you can't find the desidered template.

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
//DynamicQuery dynamicQuery = DynamicQueryFactoryUtil.forClass(Library.class); // <-- possible runtime error
DynamicQuery dynamicQuery = LibraryLocalServiceUtil.dynamicQuery();
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

*Web Content Folders are different from Documents and Media Folders*

---

## ServiceLocator

Inside a ```custom.ftl```:

```freemarker
<#assign xxxToolService = serviceLocator.findService("com.simone.celia.package.service", "com.simone.celia.package.service.xxxToolLocalService") />
```

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

## Portlet in Popup window in Liferay 6.2

[Portlet in Popup window in Liferay 6.2](https://community.liferay.com/blogs/-/blogs/portlet-in-popup-window-in-liferay-6-2)

For example:

how do you put the login page inside a bootstrap modal ?

This is code example inside a template/js

```freemarker
// <%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>

// <liferay-portlet:renderURL portletName="58" var="loginPortletURL"  windowState="<%=LiferayWindowState.POP_UP.toString()%>">
// </liferay-portlet:renderURL>
 
// <aui:button name="login-popup"  id="login-popup"  value="login"> </aui:button>
// <aui:script>
AUI().use('aui-base','liferay-util-window','aui-io-plugin-deprecated',function(A){

	// A.one('#<portlet:namespace/>login-popup').on('click', function(event){
	var login_popup= Liferay.Util.Window.getWindow({
		dialog: {
			centered: true,
			constrain2view: true,
			modal: true,
			resizable: false,
			// width: 475
		}
	}).plug(A.Plugin.DialogIframe, {
		autoLoad: true,
		iframeCssClass: 'dialog-iframe',
		uri:'<%=loginPortletURL.toString()%>'
	}).render();
	
	login_popup.show();
	login_popup.titleNode.html("Login");
});
// });
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

### Another example of 6.2 setup

Using Liferay Ide (eclipse one)
And its committed w/o SDK structure

~~1. check it out from version control~~

~~2. download or get in some way the right SDK~~

~~3. set the SDK in Liferay IDE~~

~~4. copy the theme or hook or portlet or etc.. you need to edit inside the right folder of the SDK (by hand)~~

~~5. in Liferay IDE right click on projects area and chose Import -> Liferay Project from Plugin SDK~~

~~6. follow the wizard, and then you should see new project(s) in workspace~~

~~7. They should be working and you can build them with Ant or Maven or Gradle or...~~

just do in this way:

1. download or get in some way the right SDK
2. set the SDK in Liferay IDE
3. single checkout the plugin (theme, hook, portlet, whatever) inside the right SDK's directory

**Liferay IDE bugs appears!**

4. delete the project keeping the files on file system
5. reimport project from SDK plugin

Thank me later!

---

## Auth tokens

There are two types of Auth Tokens:

1. p_auth: Portal Authentication Token for CSRF protection
2. p_p_auth: Portlet Authentication token for add-default-resource protection

### Example of jMeter regular expression extractor setup

Regular Expression Extractor

+ Apply to: ```main sample only```
+ Field to check: ```body```
+ Name of created variable: ```pauth```
+ RE: ```;p_auth&#x3d;(.+?)"```
+ Template: ```$1$```
+ Match No. ```1```
+ Default Value: ```Failed```

You can put it under every request, with a similar expression for the ```p_p_auth```, and use the variables for the next requests.

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

---

### No tag "" defined in tag library imported with prefix "portlet"

add in jsp 

```jsp
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
```

---

### No login interface available?

Just go to ```[baseurl]/c/portal/login```

example: ```localhost:8080/c/portal/login```

---

### Deploy for module never ends - no errors in console

Commenting out the code in the right places reveled the code causing the problem...

Was a bad usage of ```xxLocalServiceUtil();```

---

### java.lang.IllegalStateException: No servlet context name specified

or 

```liferay Unable find model ...```

Possible solution if happening while using dynamyc queries:

Change the code from this one:

```java
DynamicQuery dynamicQuery = DynamicQueryFactoryUtil.forClass(MyEntity.class);
```

to this one:

```java
DynamicQuery dynamicQuery = MyEntityLocalServiceUtil.dynamicQuery();
```

### class file for javax.servlet.http.HttpServletRequest not found

maybe you miss the dependency?

if maven, add something like this to the pom gerarchy

```xml
<dependency>
	<groupId>javax.servlet</groupId>
	<artifactId>javax.servlet-api</artifactId>
	<version>3.0.1</version>
	<scope>provided</scope>
</dependency>
```

---

### Liferay Ide cannot set SDK ?

Maybe the ide is too new, download an older version (6.x ones)

---

### Ant error, dependencies not founds?

Even if the java classpath is correct? 

Use the "save" trick (Eclipse based IDEs):

1. Click on console error, in the class name, should open the java file
2. Edit it, just whitespace
3. re run the goal (build, deploy, whatever)
4. should work

---

### error while deploy com.liferay.util.service cannot be resolved

```
Caused by: org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'com.xxxx.EntityNameLocalService' defined in ServletContext resource [/WEB-INF/classes/META-INF/portlet-spring.xml]: Initialization of bean failed; nested exception is org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'com.xxx.service.persistence.EntityPersistence' defined in ServletContext resource [/WEB-INF/classes/META-INF/portlet-spring.xml]: Instantiation of bean failed; nested exception is java.lang.Error: Unresolved compilation problems:
        com.liferay.util.service cannot be resolved
        com.liferay.util.service cannot be resolved
        com.liferay.util.service cannot be resolved
        com.liferay.util.service cannot be resolved
```

Maybe your Liferay IDE portlet setup is broken, see [here](###-Another-example-of-6.2-setup)

---

### Liferay.PortletURL undefined

jsp

```jsp
<aui:script use="aui-base,aui-io-request,liferay-portlet-url,aui-io-deprecated">
	A.one('#<portlet:namespace/>loginButton').on('click', function(event) {
		var resourceURL = Liferay.PortletURL.createResourceURL();
```

```Liferay.PortletURL``` is undefined.

Adding the taglibrary can help:

```jsp
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
```

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

---

## Embedding a portlet with preferences 

+ Liferay 6.2
+ Velocity

```velocity
$velocityPortletPreferences.setValue("portlet-setup-show-borders", "false")
$theme.runtime("82", "", $velocityPortletPreferences.toString())
$velocityPortletPreferences.reset()
```

---

## Code Example of embedding a portlet (login one) in the theme inside a modal

+ Liferay 6.2

portal_normal.vm

```velocity
#if ($url_pagina == "login")
	
#else
	<div id="loginOne" class="modal modal_custom fade propound regular_form transparent" role="dialog" style="display:none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<a href="javascript:void(0);" title="<@liferay.language key='Exit' />" data-dismiss="modal" data-target="#loginOne" class="sh_icon-close"></a>
				$theme.runtime("58", "", "")
			</div>
		</div>
	</div>
#end
```

anywhere in the JS code:

```javascript
$("#loginOne").modal('toggle');
```

---

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

## Liferay on jBoss

Usually server configuration like datasources are in ```standalone.xml```

Example:

```xml
<subsystem xmlns="urn:jboss:domain:datasources:1.2">
	<datasources>
		<datasource jndi-name="java:/jdbc/nameeeeee" pool-name="namee" enabled="true" use-java-context="true">
			<connection-url>jdbc:oracle:thin:@xxx.xxx.xxx.xxx:1521:ORCL</connection-url>
			<driver>oracle</driver>
			<security>
				<user-name>xxx</user-name>
				<password>xxx</password>
			</security>
		</datasource>
		<drivers>
			<driver name="oracle" module="com.liferay.portal">
				<driver-class>oracle.jdbc.OracleDriver</driver-class>
				<xa-datasource-class>oracle.jdbc.xa.client.OracleXADataSource</xa-datasource-class>
			</driver>
		</drivers>
	</datasources>
</subsystem>
```

---

When you deploy something, you can find the unzipped code here:

```.../jboss-eap-x.x/standalone/deployments/```

---

## How to know if user is logged in?

Javascript:

```javascript
themeDisplay.isSignedIn();
```

Always in javascript context, you can get current user id with:

```javascript
themeDisplay.getUserId();
```

---

## Liferay Philosophy

+ Everything is an Asset!

---

## Liferay best practices

+ In maven or gradle projects, always create a parent module per osgi module... so you can put inside service builders sub-modules (for example)
+ *Always have a liferay portal bundle with tomcat for development*
+ Always use constant fields
+ Always localize strings

---

## Liferay tricks

+ You can edit files like ```portal_normal.vm``` macros deployed in the server without have to redeploy (hot-editing is working)
+ if you use
  ```java
  int myEntityCount = MyEntityLocalServiceUtil.getMyEntities(0, Integer.MAX_VALUE).size();
  ```
  instead of
  ```java
  int myEntityCount = MyEntityLocalServiceUtil.getMyEntityCount();
  ```
  it gives the correct result even if you edit the database without updating indexes / cache
+ If you don't find in the source code piece of rendered html... maybe it's inside the database! (for example as a web content)
+ If you change extension to the ```.war``` files before copying them into the deploy folder, you will get less errors in the hot deploy phase... just put back the right extension after the transfer

---

## Nice links

+ [Alternate text for css background images](http://davidmacd.com/blog/alternate-text-for-css-background-images.html)
+ [Using a Custom Bundle for the Liferay Workspace](https://community.liferay.com/es/blogs/-/blogs/using-a-custom-bundle-for-the-liferay-workspace)
+ [Override command from Site Admin Portlet](https://community.liferay.com/it/forums/-/message_boards/message/106482937)
+ [Event tracking by JS](https://www.xtivia.com/google-analytics-event-tracking-liferay/)
+ [Portlet filters in Liferay 7 dxp](https://www.liferaystack.com/2017/09/portlet-filters-in-liferay-7-dxp.html)
+ [Top Service Builder Article](http://www.enprowess.com/blogs/service-builder-liferay-dxp/)

---

## TEST ZONE

https://github.com/simon387/notes/blob/efdf77dfc11cd8ca6b7a0f2d9cddca93f910d68a/java/src/Test.java#L1

