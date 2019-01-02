<!DOCTYPE html>
<html>
	<head>
		<title>Our list of words</title>
		<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
	</head>
	<body>
		<?php
			$dbcnx = @mysql_connect('sql.simonecelia.it', ' ', ' ');
			if (!$dbcnx) {
				exit('<p>unable to connect to the database server at this time.</p>');
			}
			if (!@mysql_select_db(' ')) {
				exit('<p>unable to locate the   database at this time.</p>');
			}
		?>
		<p>here are all the words in our database:</p>
		<blockquote>
			<?php
				$result = @mysql_query('select * from dizionario');
				if (!$result) {
					exit('<p>error performing query: ' . mysql_error() . '</p>');
				}
				while ($row = mysql_fetch_array($result)) {
					echo '<p>' . $row['jap'] . ' ' . $row['ita'] . ' ' . $row['info'] . '</p>';
				}
			?>
		</blockquote>
	</body>
</html>