
<?php
$servername = "serverName";
$username = "userName";
$password = "password";
$dbname = "dbName";
//we retrive data provided by the user
$userGender = strval($_GET['userGender']);
$userAge = strval($_GET['userAge']);
$userState = strval($_GET['userState']);

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

//this is used to generate a new answerer_ID
$sql1="SELECT MAX(answerer_ID) as maximum FROM answerer_info";
$userID = mysqli_query($conn,$sql1);
$userID2 = mysqli_fetch_array($userID);
$num=$userID2["maximum"]+1;

//this is used to get the questionnaireID the user will answer
$sql2="SELECT questionnary_ID as questionnaire FROM questionnary_info WHERE displayed = '1'";
$questionnaireID = mysqli_query($conn,$sql2);
$questionnaireID2 = mysqli_fetch_array($questionnaireID);
$num2=$questionnaireID2["questionnaire"];

//we fill the table answerer_info with a new answerer_ID, the questionnary_ID corresponding to the questionnaire that the user will 
//answer to, and the information provided by the user
$sql = "INSERT INTO answerer_info(answerer_ID, questionnary_ID, gender, age, state)
VALUES ('$num', '$num2', '$userGender', '$userAge','$userState')";

// We return the answerer_ID generated
echo '<div id="answerer_ID" style="display:none;">';
echo ''.$num.'';
echo '</div>';


if (mysqli_query($conn,$sql) === TRUE) {
    //echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}
//We close the connection
mysqli_close($conn);
?>
