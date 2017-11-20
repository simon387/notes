# java notes

## optional usage example

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

## liferay

+ ```public class com.liferay.portal.servlet.filters.dynamiccss.DynamicCSSUtil``` -> theme sass cache generation trigger
