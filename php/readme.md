# PHP

## old stuff

in htdocs di questo repo -> vecchio sito pre redirect github-io

---

## TIPS

php.ini lo puoi modificare/creare a caldo senza riavviare il server!

## esempio api proxy

```injectablephp
<?php
header('Content-Type: application/json;');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
echo file_get_contents('https://bestemmie.org/api/random/');
exit();
```