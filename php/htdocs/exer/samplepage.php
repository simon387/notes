<!DOCTYPE html>
<html>
	<head>
		<title>Sample Page</title>
	</head>
	<body>
		<?php if (!isset($_GET['name'])): ?>
			<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="get">
				<label>Please enter your name:
					<input type="text" name="name" />
				</label>
				<input type="submit" value="GO" />
			</form>
		<?php else: ?>
			<p>Your name: <?php echo $_GET['name']; ?></p>
			<p>This paragraph contains a
			<a href="newpage.php?name=<?php echo urlencode($_GET['name']); ?>">link</a>
			that passes the name variable on to the next document. </p>
		<?php endif; ?>
	</body>
</html>