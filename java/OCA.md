# OCA

1. Checked exceptions are meant for...
 + exceptional conditions external to an application that a well written application should anticipate and from which it can recover.
 + sublcass of Exception
 + invalid conditions in areas outside the imeediate control of the program
2. RuntimeExeption(unchecked) it's sublcass of Exception!
3. String String = "string isa string";  System.out.println(String.substring(3, 6)); -> "ing"
4. Throwable is a super class of Exception
5. Any exception that extends java.lang.Exception but is not a subclass of java.lang.RuntimeException is a checked exception
6. A final variable must be initialized when an instance is constructed.
7. The overriding method cannot decrease the accessibility.
8. you cannot override/hide a static method with a non static method and vice versa

```
          C P S W
public    X X X X
protected X X X
          X X
private   X
```
9. Remember that a String once created cannot be changed
10. Default methods enable us to add new functionalities to interfaces without breaking the classes that implements that interface. Lets take a look at the example below.
11. always return 1
  ```java
  try {
    throw new Exception();
  }
  catch(Exception exception) {
    return 0;
  }
  finally {
    return 1;
  }
  ```
12. ```new Object[] {"asd", {}};``` will not compile for ```{}```
13. A constructor cannot be final, static or abstract.
14. super classes can catch() subclass Exception
15. abstract classes can implements interface (obv without implementing methods)
