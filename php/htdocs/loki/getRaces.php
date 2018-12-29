<?
  $q = $_GET['q'];
  $r = $_GET['r'];

  $con = mysqli_connect('sql.simonecelia.it', ' ', ' ', ' ');
  if (!$con) {
    die('Could not connect: ' . mysqli_error($con));
  }

  $sql = "SELECT race FROM daochar WHERE class = '" . $q . "' and realm = '" . $r . "'";
  $result = mysqli_query($con, $sql);
  $ar = array();
  
  while($row = mysqli_fetch_array($result)) {
    array_push($ar, $row['race']);
  }
  echo json_encode($ar);//, JSON_FORCE_OBJECT);//| JSON_PRETTY_PRINT);
  
  mysqli_close($con);
?>