<?php
	$servername = "serverName";
	$username = "userName";
	$password = "password";
	$dbname = "dbName";

	// Create connection
	$conn = mysqli_connect($servername, $username, $password, $dbname);
	// We get the questionnaire title provided by the user
   	$questionnaireID=$_GET['selectValue'];
	// first we set all the questionnaire as "not displayed" (displayed=0)
	$qry = "UPDATE questionnary_info SET displayed=0 where displayed=1";	
	if (mysqli_query($conn, $qry)) {
	    echo "Record updated successfully";
	} else {
	    echo "Error updating record: " . mysqli_error($conn);
	}
	//second we set the questionnaire with the title provided by the user as "displayed" (displayed=1)
	$qry2 = "UPDATE questionnary_info SET displayed=1 where questionnary_ID='".$questionnaireID."'";	
	if (mysqli_query($conn, $qry2)) {
	    echo "Record updated successfully";
	} else {
	    echo "Error updating record: " . mysqli_error($conn);
	}
	//We close the connection
	mysqli_close($conn);

?>
