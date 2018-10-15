# General Notes on Apache jMeter

+ [GOTO Liferay Notes](liferay.md)

## Variables

To use them in forms use this syntax:

```${VARIABLE_NAME}```

---

## Certificates

(on Windows, Chrome)

After generating one (for example after the click on "start recording"), just go in the ```bin``` directory, click on it and follow the install wizard.

In firefox, you need to manually import from browser settings

---

## Test Script Recorder

Remember that usually proxy browsers settings bypass localhost / 127.0.0.1 !

---

## How to set general setting

Modify ```jmeter.properties```

Example:

```resultcollector.action_if_file_exists=DELETE```

---
