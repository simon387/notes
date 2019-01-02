<!DOCTYPE html>
<html>
	<head>
		<title>the japan database</title>
		<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
	</head>
	<body>
		<?php
			if (isset($_GET['addword'])):
		?>
				<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
					<table>
						<tr>
							<td>
								<label>type the jap:<br/>
									<textarea name="japtext" row="1" cols="40"></textarea>
								</label>			
							</td>
							<td>
								<label>type the ita:<br/>
									<textarea name="itatext" row="1" cols="40"></textarea>
								</label>		
							</td>
							<td>
								<label>type the info:<br/>
									<textarea name="infotext" row="1" cols="40"></textarea>
								</label>		
							</td>
						</tr>
					</table>
					<input type="submit" value="SUBMIT" />
				</form>
		<?php
			else:
				$dbcnx = @mysql_connect('sql.simonecelia.it', ' ', ' ');
				if (!$dbcnx) {
					exit('<p>unable to connect to the database server at this time.</p>');
				}
				if (!@mysql_select_db(' ')) {
					exit('<p>unable to locate the database at this time.</p>');
				}
				//add
				if (isset($_POST['japtext']) || isset($_POST['itatext']) || isset($_POST['infotext'])) {
					$japtext = $_POST['japtext'];
					$itatext = $_POST['itatext'];
					$infotext = $_POST['infotext'];
					$sql = "INSERT INTO dizionario SET jap = '$japtext', ita = '$itatext', info = '$infotext'";
					if (@mysql_query($sql)) {
						echo '<p> word added. </p>';
					}
					else {
						echo '<p> error adding submitted text: ' . mysql_error() . '</p>';
					}
				}
				//delete
				if (isset($_GET['deleteword'])) {
					$wordid = $_GET['deleteword'];
					$sql = "DELETE FROM dizionario WHERE id = $wordid";
					if (@mysql_query($sql)) {
						echo '<p> word delete. </p>';
					}
					else {
						echo '<p> error deleting word: ' . mysql_error() . '</p>';
					}
				}
				//show
				echo '<p><a href="' . $_SERVER['PHP_SELF'] . '?addword=1">Add a word!</a></p>';
				echo '<p> here all the words in our database: </p>';
				$result = @mysql_query("SELECT id, jap, ita, info FROM dizionario");
				if (!$result) {
					exit('<p> error performing query: ' . mysql_error() . '</p>');
				}
				echo '<table>';
				while ($row = mysql_fetch_array($result)) {
					echo '<tr><td>' . $row[0] . '</td><td>' . $row[1] . 
					     '</td><td>' . $row[2] . '</td><td>' . $row[3] .
					     '</td><td><a href="' . $_SERVER['PHP_SELF'] . '?deleteword=' .
						 $row[0] . '">' . 'delete this word</a></td></tr>';
				}
				echo '</table>';
			endif;
		?>
	</body>
</html>