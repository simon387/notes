# Java notes

## Eclipse note

+ debugs stop execution without breakpoints? Windows -> Preferences -> Java -> Debug -> Suspend execution on uncaught exceptions

## log4j

[log4j property file example](https://github.com/simon387/Log4jEx/blob/master/src/main/resources/log4j.properties)

## Optional usage example (with JSON parsing)

```java
private Optional<Map<String, Object>> getComponentField(String componentName, String componentVariation, String field) {
		if (this.map.containsKey(COMPONENTS)) {
			Map<String, List<Object>> components = (Map<String, List<Object>>) this.map.get(COMPONENTS);
			for (Map.Entry pair: components.entrySet()) {
				ArrayList<Map<String, Object>> component = (ArrayList) pair.getValue();
				for (Map<String, Object> o : component) {
					if (o.containsKey(NAME) && o.containsKey(VARIATION) && o.containsKey(field)) {
						if (((String) o.get(NAME)).equalsIgnoreCase(componentName) &&
								((String) o.get(VARIATION)).equalsIgnoreCase(componentVariation)) {
							return Optional.of((Map<String, Object>)o.get(field));
						}
					}
				}
			}
		}
		return Optional.absent();
	}
```
```json
{
	"a": "a",
	"b": "b",
	"c": "c",
	"d": "d",
	"e": "e",
	"f": "f",
	"components": {
		"name-name": [
			{
				"name": "name",
				"variation": "variation",
				"field": {
					"a": "a",
					"b": {
						"c": "c"
					}
				},
				"features": {
					"a": {
						"b": "b",
						"c": "c"
					},
					"d": {
						"e": "e"
					}
				}
			}
		]
	}
}
```

## VM options

+ ```-verbose:class``` understanding which classes are loaded 

## Popular annotations

+ JPA
  + ```@Transient``` doesn't persist the field on db
+ Spring
  + ```@Service``` it's a service class
+ javax.validation
  + ```@Valid``` validate the field throw reflection?
+ ```//TODO```
POST
Path
Produces
Consumes
GET
Autowired
Component
Valid
NotNull
HeaderParam
@QueryParam
Override

## Java Thread Dump

+ ```kill -3 <pid>```
+ dump example: [output](https://github.com/simon387/job_note/blob/master/java/java_thread_dump_example)

## Common errors

+ ```ORA-00928: missing SELECT keyword``` in an insert, during an Hibernate Transaction with Oracle... I was using a reserved oracle keyword (```FILE```)

## Liferay note (6.1-6.2)

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
  + now the Liferay menu should be enabled from context menu (es. right click on project, liferay, build)
  + set the proxy if any in ```build-common-ivy.xml```
    + ```<setproxy proxyhost="" proxyport=""/>```
  + if some library cannot be downloaded automatically from ivy, just download and add it in ```/liferay-plugins-sdk-6.2/.ivy/cache``` (unzipped) [example of added zip](https://github.com/simon387/job_note/blob/master/java/jars/biz.zip)
  + to include the Liferay source code into Eclipse:
    + right click on Package Explorer
    + import
    + Existing project into Workspace
+ EXT deploy example
  + stop liferay
  + remove the old ext
    + ```sudo rm /opt/liferay/liferay-portal-6.2-ce-ga2/tomcat-7.0.42/lib/ext/ext-NAME-ext-service.jar```
    + ```sudo rm -rf /opt/liferay/liferay-portal-6.2-ce-ga2/tomcat-7.0.42/webapps/NAME-ext/```
    + ```sudo rm /opt/liferay/liferay-portal-6.2-ce-ga2/tomcat-7.0.42/webapps/ROOT/WEB-INF/ext-NAME-ext.xml```
    + ```sudo rm /opt/liferay/liferay/tomcat-7.0.42/webapps/ROOT/WEB-INF/lib/ext-NAME-ext-*```
  + start liferay
  + after complete startup, deploy the war (just cp it)
  + always check logs
  + at the end restart liferay

## tomcat(7) setting VM options on windows

inside catalina.bat

```bat
set "JAVA_OPTS=%JAVA_OPTS% your_option "
```

## remote debug

catalina.sh / bat

```bat
set "JAVA_OPTS=%JAVA_OPTS% -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=12345"
```

## common errors

```javax.naming.CommunicationException: anonymous bind failed: package.class.eu:636 [Root exception is javax.net.ssl.SSLHandshakeException: sun.security.validator.ValidatorException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target]```

solution's example:

setting the tomcat VM option
```
-Djavax.net.ssl.trustStore=path_to_keystore.jks -Djavax.net.ssl.trustStorePassword=password 
```
## how to print current project classpath

```java
import org.junit.Test;

import java.net.URL;
import java.net.URLClassLoader;

public class PrintClasspath {

	@Test
	public void printClasspath() {
		ClassLoader cl = ClassLoader.getSystemClassLoader();

		URL[] urls = ((URLClassLoader)cl).getURLs();

		for(URL url: urls){
			System.out.println(url.getFile());
		}
	}
}
```

## easy way to switch jdk and jre on linux

```bash
alternatives --set javac /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.172-9.b11.fc28.x86_64/bin/javac
```

```bash
alternatives --config java
```




