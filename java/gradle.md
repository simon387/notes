# General Gradle Notes

+ [GOTO Liferay Notes](liferay.md)

## Gradle comments

+ comments in ```build.gradle``` are java like

---

## Gradle common errors

```
Execution failed for task ':initBundle'.
> Could not expand ZIP xxxxx
```

solution: ```rm -rf xxxxx``` and re-run the download task

---

```
“URI has an authority component”
```

solution: (on windows environment) the three slashes after ```file:``` fixed the issue

example: ```liferay.workspace.bundle.url=file:///C://dev//liferay-dxp-digital-enterprise-7.0-sp3_FOR_IDEA.zip```

---

Gradle can't resolve dependencies...

Solution: "version" keyword was missing.

---

## INIT & random commands help

+ ```gradle init``` inside project di
+ ```gradle.properties``` is the default properties file
+ ```def propertyValue = propertyName``` how to read from ```build.gradle```

```gradle
task main {
    println "running main task"
}
```

*split*

```gradle
def values = '1182-2'.split('-')
assert values[0] == '1182'
assert values[1] == '2'
```

---

## It is very important to understand the distinction between task configuration and task execution

``` gradle
task eclipsify {
    // Code that goes here is *configuring* the task, and will 
    // get evaluated on *every* build invocation, no matter
    // which tasks Gradle eventually decides to execute.
    // Don't do anything time-consuming here.
    doLast {
        // `doLast` adds a so-called *task action* to the task.
        // The code inside the task action(s) defines the task's behavior.
        // It will only get evaluated if and when Gradle decides to 
        // execute the task.
        exec { commandLine = ["./play1.3.x/play", "eclipsify"] }
    }
}

// Improving on the previous task declaration, let's now use a *task type* 
// (see `type: Exec` below). Task types come with a predefined task action, 
// so it's typically not necessary to add one yourself. Also, many task types 
// predefine task inputs and outputs, which allows Gradle to check if the task 
// is up-to-date. Another advantage of task types is that they allow for 
// better tooling support (e.g. auto-completion of task properties).
task precompile(type: Exec) {
    // Since this task already has a task action, we only
    // need to configure it.
    commandLine = ["./play1.3.x/play", "precompile"] }
}
```