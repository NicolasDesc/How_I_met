<?php
$servername = "serverName";
$username = "userName";
$password = "password";
$dbname = "dbName";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// We select all the propsotion which are already on the database
$sql1="SELECT * FROM proposition_info";

$result = mysqli_query($conn,$sql1);
while($row = mysqli_fetch_array($result)) {
    //we return an html file with all the <option> used to populate the <datalist> on the admin.php page
    echo '<option value="'.$row['description'].'"></option>';
}
// We close the connection
mysqli_close($conn);
?>

