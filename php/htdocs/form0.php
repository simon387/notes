<?php
	$DBDEF=array(
		'user'=>" ",#required
		'pwd'=>" ", #required
		'db'=>"",  #optional, default DB
		'host'=>"",#optional
		'port'=>"",#optional
		'chset'=>"utf8",#optional, default charset
	);
?>
<!DOCTYPE html>
<html>
<head><title>form0</title></head>
<body>
<form action='' method='POST'>
<?php 

    mysql_connect('localhost', $DBDEF['user'], $DBDEF['pwd']);
    mysql_select_db('');
    $query = "SELECT * FROM dizionario"; 
    $result = mysql_query($query); 

	while($row = mysql_fetch_array($result)){
	        echo  $row['jap'];
	}

if(isset($_POST['delete'])){

$user  = $_POST['delete'];
$delet_query = mysql_query("DELETE FROM users WHERE id = $user ") or die(mysql_error());

if($delet_query) {
echo 'user with id '.$user.' is removed from your table, to refresh your page, click'. '<a href='.$_SERVER["PHP_SELF"].' > here </a>';

}
}
?>
</form>
</body>
</html>