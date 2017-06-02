<?php
$servername = "serverName";
$username = "userName";
$password = "password";
$dbname = "dbName";

//we retrieve data 
$jsondata =json_decode($_GET['jsondata']);
$fullLength=count($jsondata);
$halfLength=($fullLength-1)/2;
//we create a connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
//we fill the table answerer_position
for($x=1;$x<$halfLength+1;$x++){
	$var1=$jsondata[0];
	$var2=$jsondata[$x];
	$addition=$x+$halfLength;
	$var3=(string)strval($jsondata[$addition]);
	$sql="INSERT INTO answerer_position(answerer_ID,proposition_ID,position)
	VALUES ('$var1','$var2','$var3')";
	if (mysqli_query($conn,$sql) === TRUE) {
	} else {
	}	
}
//we close the connection
mysqli_close($conn);
?>
