<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>How I met</title>
<link rel="stylesheet" href="css/global.css" />
<link rel="stylesheet" href="css/page.css" />
</head>

<body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.js"
        type="text/javascript"></script>
<script src="./js/variable.js" type="text/javascript"></script>
<script src="./js/client.js" type="text/javascript"></script>

<!-- Formulaire qui apparait au lancement de la page -->
<div class="header">
		<div class="wrapper">
			<img src="imgs/logo.png" alt="" />			
		</div>
</div>
<div class="formulaire">
		<div class="abs box formulaire-box">
			<div class="ta-c lh300 box-h">Please enter your Informations</div>
			<div class="box-c">
				<div class="clear forminfo">
					<div class="forminfo-item">
						<label class="ml5" for="">Gender</label>
						<select class="f125" name="gender" id ="gender">
  						<option value="Male">Male</option>
  						<option value="Female">Female</option>
 						<option value="Undefined">I don't wish answer</option>
  						</select>
					</div>
					<div class="forminfo-item">
						<label class="ml5" for="">Age</label>
						<select class="f125" name="age" id="age">
  						<option value="18-24">18-24</option>
  						<option value="25-34">25-34</option>
 						<option value="35-44">35-44</option>
 						<option value="45-54">45-54</option>
 						<option value="55-64">55-64</option>
 						<option value="65-74">65-74</option>
 						<option value="+75">+75</option>
  						</select>
					</div>
					<div class="forminfo-item">
						<label class="ml5" for="">State</label>
						<select class="f125" name="states" id="states">
  						</select>
					</div>
					<div class="ta-c forminfo-item">
						<button type="button" class="btn p5 f125" id="J_btn_start">Meet My President!</button>
					</div>
				</div>
			</div>
		</div>
</div>

<!-- La boite type d'une question -->
<div id="formularyResponse"></div>
<div id="questionnaryDisplay"></div>


<!-- La boite de resultats -->

<div class="results">
		<div class="abs box result-box">
			<div class="ta-c lh300 box-h">Results</div>
			<div class="box-c">
				<div class="ta-c forminfo-item">
					<label id="candidate_1"></label>
					<label id="candidate_1_pourcentage"></label>
				</div>
				<div class="ta-c forminfo-item">
					<label id="candidate_2"></label>
					<label id="candidate_2_pourcentage"></label>
				</div>
			</div>
		</div>
</div>


</body>

</html>
