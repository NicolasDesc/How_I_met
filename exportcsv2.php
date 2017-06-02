<?php
	//we check if the user click on the submit "Export"
	if(isset($_POST["Export"])){
	$servername = "serverName";
	$username = "userName";
	$password = "password";
	$dbname = "dbName";

	// Create connection
	$conn = mysqli_connect($servername, $username, $password, $dbname);
	//We get the questionnaireID provided by the user
   	$questionnaireID=$_POST["Export"];
	//we select a table which show answerer_info.answerer_ID, answerer_info.age, answerer_info.gender, answerer_info.state, questionnary_info.description, proposition_info.description, answerer_position.position
	//related to the questionnaireID provided by the user
	$qry = "SELECT answerer_info.answerer_ID, answerer_info.age, answerer_info.gender, answerer_info.state, questionnary_info.description, proposition_info.description as proposition, answerer_position.position FROM answerer_info, answerer_position, proposition_info, questionnary, questionnary_info where answerer_info.answerer_ID = answerer_position.answerer_ID and answerer_position.proposition_ID = proposition_info.proposition_ID and proposition_info.proposition_ID = questionnary.proposition_ID and questionnary.questionnary_ID = questionnary_info.questionnary_ID and questionnary.questionnary_ID='".$questionnaireID."' order by answerer_info.answerer_ID";	
	$pouet=mysqli_query($conn,$qry);
	//we create a csv document
	header("Content-Type: application/csv");
	header("Content-Disposition: attachement; Filename=report.csv");
	$output = fopen("php://output", "w");  
	//we set the name of each column
      	fputcsv($output, array('User ID','User Age','User Gender','User State','Questionnaire','Proposition','User Position'));
	//we fill each row with the row provided by the selected table
	while($row = mysqli_fetch_assoc($pouet)) {
	 fputcsv($output, $row);
	}
	fclose($output);
	//we close the connection
	mysqli_close($conn);
	}

?>
