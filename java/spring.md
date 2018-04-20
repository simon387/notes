# spring

## spring boot web app with thymeleaf example

service

```java
package it.simonecelia.jokesapp.services;

public interface ChuckNorrisService {
	String getRandomQuote();
}
```

```java
package it.simonecelia.jokesapp.services;

import guru.springframework.norris.chuck.ChuckNorrisQuotes;
import org.springframework.stereotype.Service;

@Service
public class ChuckNorrisServiceImpl implements ChuckNorrisService {

	private final ChuckNorrisQuotes chuckNorrisQuotes;

	public ChuckNorrisServiceImpl() {
		this.chuckNorrisQuotes = new ChuckNorrisQuotes();
	}

	@Override
	public String getRandomQuote() {
		return chuckNorrisQuotes.getRandomQuote();
	}
}
```

controller

```java
package it.simonecelia.jokesapp.controllers;

import it.simonecelia.jokesapp.services.ChuckNorrisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JokesController {

	private ChuckNorrisService chuckNorrisService;

	@Autowired
	public JokesController(ChuckNorrisService chuckNorrisService) {
		this.chuckNorrisService = chuckNorrisService;
	}

	@RequestMapping({"/", ""})
	public String getJoke(Model model) {

		model.addAttribute("joke", chuckNorrisService.getRandomQuote());

		return "chucknorris";
	}
}
```

view chucknorris.html

```html
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
	<meta charset="UTF-8">
	<title>Chuck Norris Jokes</title>
</head>
<body>

<p th:text="${joke}"></p>

</body>
</html>
```

## changing banner

put ```banner.txt``` under ```resources``` folder

nice tool: http://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20
