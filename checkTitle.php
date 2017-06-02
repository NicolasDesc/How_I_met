<?php
	$servername = "serverName";
	$username = "userName";
	$password = "password";
	$dbname = "dbName";

	// Create connection
	$conn = mysqli_connect($servername, $username, $password, $dbname);
	// this value is provided by the user, it's the title enter by the user
   	$questionnaireTitle=$_GET['titleValue'];
	//we check if it already exist in the database
	$qry = "SELECT * FROM questionnary_info WHERE description='".$questionnaireTitle."'";
	$result=mysqli_query($conn,$qry);
	if (mysqli_num_rows($result)>0) {
	    echo "exist";
	} else {
	    echo "This Title doesn't exist";
	}
	// close connection
	mysqli_close($conn);

?>
