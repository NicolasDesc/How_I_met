<html>
<head>
<title>...</title>
<!--We need to creat an html file, in order to be able to use class from our css files-->
<link rel="stylesheet" href="css/global.css" />
<link rel="stylesheet" href="css/page.css" />
</head>
<body>
<?php
$servername = "serverName";
$username = "userName";
$password = "password";
$dbname = "dbName";


// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// We select the candidate_position.proposition_ID,proposition_info.description,candidate_info.candidate_name, which correspond with
// the questionnaire set as displayed
$sql1="SELECT candidate_position.proposition_ID,proposition_info.description,candidate_info.candidate_name FROM candidate_position,proposition_info,candidate_info,questionnary_info,questionnary WHERE candidate_position.proposition_ID = proposition_info.proposition_ID AND proposition_info.proposition_ID = questionnary.proposition_ID AND questionnary.questionnary_ID = questionnary_info.questionnary_ID AND candidate_info.candidate_ID = candidate_position.candidate_ID  AND candidate_position.position = 1 AND questionnary_info.displayed = 1 ORDER BY proposition_ID;";
$result = mysqli_query($conn,$sql1);
$result2 = mysqli_query($conn,$sql1);
//we select the title of the questionnaire set as displayed
$sql2="SELECT description as questionnairetitle FROM questionnary_info WHERE displayed = 1";
$questionnaireTitle = mysqli_query($conn,$sql2);
$questionnaireTitle2 = mysqli_fetch_array($questionnaireTitle);
//we store the title in the $title variable
$title=$questionnaireTitle2["questionnairetitle"];
//We select the candidate_info.candidate_name from candidate_info,candidate_position,questionnary,questionnary_info related
// to the questionnaire set as displayed
$sql3="SELECT candidate_info.candidate_name from candidate_info,candidate_position,questionnary,questionnary_info WHERE candidate_info.candidate_ID = candidate_position.candidate_ID AND candidate_position.proposition_ID = questionnary.proposition_ID AND questionnary.questionnary_ID = questionnary_info.questionnary_ID AND questionnary_info.displayed =1 GROUP BY candidate_info.candidate_name;";
$result3 = mysqli_query($conn,$sql3);
//We create a full html file which is the questionnaire displayed on the second view in the client.php 
echo '<div class="quizzQuestion">
		<div class="abs box quizzQuestion-box">
			<div class="ta-c lh300 box-h">' . $title . '</div>
			<div class="box-c">
				<div class="clear forminfo">';


while($row = mysqli_fetch_array($result)) {
    echo '<div class="container">';
	
		echo '<div class="prop">'.$row['description'].'</div>';
	
  			echo '<ul>
  				<li>
    				<input type="radio" id="'.$row['proposition_ID'].'_a" name="'.$row['proposition_ID'].'" value="'.$row['candidate_name'].'">
    				<label for="'.$row['proposition_ID'].'_a">Pro</label>   
    				<div class="check"></div>
  				</li>
  
  				<li>
    				<input type="radio" id="'.$row['proposition_ID'].'_b" name="'.$row['proposition_ID'].'" value="'.$row['candidate_name'].'">
    				<label for="'.$row['proposition_ID'].'_b">Con</label>
    				<div class="check"></div>
 			 	</li>
			</ul>
		</div>';





}
echo '<div class="container">';
echo '<div class="ta-c questforminfo-item">
						<button type="button" class="btn p5 f30" id="J_btn_login">Submit</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>';
//we get the proposition ID to use them later in the javascript client.js
echo '<div id="proposition_id" style="display:none;">';
while($row2 = mysqli_fetch_array($result2)) {
    echo ''.$row2['proposition_ID'].' ';
     
}
echo '</div>';
//we get the candidateName to use them in the javascript
echo '<div id="candidateName" style="display:none;">';
while($row3 = mysqli_fetch_array($result3)) {
    echo ''.$row3['candidate_name'].'/';
     
}
echo '</div>';
//we close connection
mysqli_close($conn);
?>
</body>
</html>
