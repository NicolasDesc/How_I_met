
<?php
$servername = "serverName";
$username = "userName";
$password = "password";
$dbname = "dbName";


// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
//we select all the questionnaire which already exist in the table
$sql1="SELECT * FROM questionnary_info";

$result = mysqli_query($conn,$sql1);
while($row = mysqli_fetch_array($result)) {
    //we create an html file with <option> which will populate the two select with questionnaire title in the admin.php page
    echo '<option value="'.$row['questionnary_ID'].'">'.$row['questionnary_ID'].'. '.$row['description'].'</option>';
}
//we close the connection
mysqli_close($conn);
?>

