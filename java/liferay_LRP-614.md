# Portal Developer

1. The method to define a column in a layout template is:

   + $processor.processColumn()

2. The JavaScript method that executes after all the portlets on the page have finished loading is:

   + Liferay.on('allPortletsReady', fn)

3. A JSR-286 standard portlets extends:

   + GenericPortlet

4. ThecompanyId is a:

   + Portal instance

5. Site administrators would like to search for a web content based on the review date. The review date is not currently indexed when web content is published. The recommended way to add the review date to the search index is to:

   + Create a hook plugin and implement an indexer post processor to index the review date

6. The recommended way to add new functionality in Liferay is to:

   + Create portlet, theme, layout template or hook plugins

7. Instanceable portlets:
   
   + Have unique prerences per portlet
   + Can be added to a page multiple times

8. To generate remote services with Service Builder:

   + Set the attribute "remote-service" to "true" on the "entity" element in service.xml

9. The method to embed the non-instanceable Language portlet with the name "82" is a theme is:

   + $theme.runtime("82")
   
10. The method to embed a portlet in a layout template is:

    + processor.processPortlet()

