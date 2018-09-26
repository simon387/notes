# Maven general Notes

## Common errors

```Execution default of goal org.springframework.boot:spring-boot-maven-plugin:2.0.5.RELEASE:repackage failed:Unable to find main class```

ok it was a child module, frontend one without java code

I fixed it changing the ```packaging``` from ```jar``` to ```pom```

old pom:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>com.linuxparade</groupId>
        <artifactId>myapp</artifactId>
        <version>0.0.1-SNAPSHOT</version>
    </parent>

    <artifactId>myapp-frontend</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <packaging>jar</packaging>

</project>
```

new pom:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>com.linuxparade</groupId>
        <artifactId>myapp</artifactId>
        <version>0.0.1-SNAPSHOT</version>
    </parent>

    <artifactId>myapp-frontend</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <packaging>pom</packaging>

</project>
```
