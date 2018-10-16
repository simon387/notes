# General Notes on Apache jMeter

+ [GOTO Liferay Notes](liferay.md)

## Variables

To use them in forms use this syntax:

```${VARIABLENAME}```

**ITS BETTER TO NEVER USE UNDERSCORES IN VARIABLES**

Because sometime is used to access array-like elements.

---

## Certificates

(on Windows, Chrome)

After generating one (for example after the click on "start recording"), just go in the ```bin``` directory, click on it and follow the install wizard.

In firefox, you need to manually import from browser settings

---

## Test Script Recorder

+ Remember that usually proxy browsers settings bypass localhost / 127.0.0.1 !
+ If you have to upload a file, put in under the ```bin``` folder, or you will get a site map error

---

## How to set general setting

Modify ```jmeter.properties```

Example:

```resultcollector.action_if_file_exists=DELETE```

---

## Query the database

1. Copy the connector in the ```lib``` folder (there is the mysql one sample on this repository under the ```java/jars``` folder)
2. Add the JDBC Connection Configuration element, settings ex: ```jdbc:mysql://localhost:3306/dbnamedb```, ```com.mysql.jdbc.Driver``` as Driver vlass name
3. Add the listener with the query

---
