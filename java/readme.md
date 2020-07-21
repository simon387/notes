# Java notes

+ [GOTO Liferay Notes](liferay.md)

## Log4j

[log4j property file example](https://github.com/simon387/Log4jEx/blob/master/src/main/resources/log4j.properties)

---

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

---

## VM options

+ ```-verbose:class``` understanding which classes are loaded 

---

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

---

## Java Thread Dump

+ ```kill -3 <pid>```
+ dump example: [output](https://github.com/simon387/job_note/blob/master/java/java_thread_dump_example)

---

## Tomcat(7) setting VM options on windows

inside catalina.bat

```bat
set "JAVA_OPTS=%JAVA_OPTS% your_option "
```

---

## Remote debug

catalina.sh / bat

```bat
set "JAVA_OPTS=%JAVA_OPTS% -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=12345"
```

---

## Common errors

### ```javax.naming.CommunicationException: anonymous bind failed: package.class.eu:636 [Root exception is javax.net.ssl.SSLHandshakeException: sun.security.validator.ValidatorException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target]```

solution's example:

setting the tomcat VM option

```
-Djavax.net.ssl.trustStore=path_to_keystore.jks -Djavax.net.ssl.trustStorePassword=password 
```

---

### ```ORA-00928: missing SELECT keyword```

In an insert, during an Hibernate Transaction with Oracle... I was using a reserved oracle keyword (```FILE```)

---

## How to print current project classpath

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

---

## Easy way to switch jdk and jre on linux

```bash
alternatives --set javac /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.172-9.b11.fc28.x86_64/bin/javac
```

```bash
alternatives --config java
```

---

## String to Date

```java
String sDate = "20180118";
Date date = new SimpleDateFormat("yyyyMMdd").parse(sDate);
```

---

## O(1) Search on Strings example

```java
private static final Set<String> VALUES = new HashSet<String>(Arrays.asList(
    new String[] {"AB","BC","CD","AE"}
));

VALUES.contains(s)
```

---

## Strange issues

Why I don't see stack trace on logs?

After many errors, jvm omit them!

add this parameter to the jvm (1.6+)

```properties
-XX:-OmitStackTraceInFastThrow
```

---

## Caused by: org.springframework.beans.factory.NoSuchBeanDefinitionException: No qualifying bean of type 'java.util.Set<javax.persistence.EntityManager>' available: expected at least 1 bean which qualifies as autowire candidate. Dependency annotations: {}

Fixed putting this in application.properties file: ```spring.data.jpa.repositories.enabled=false```

---


