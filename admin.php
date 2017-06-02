
<!DOCTYPE html>
<?php
	include('session.php');
?>
<html>
<head>
<meta charset="UTF-8">
<title>How I met</title>
<link rel="stylesheet" href="css/global.css" />
<link rel="stylesheet" href="css/pageAdmin.css" />

</head>

<body>
<script src="./js/admin.js" type="text/javascript"></script>


<div class="header">
		<div class="wrapper">
			<img src="imgs/logo.png" alt="" />			
			<ul class="abs nav">
				<li><a href="logout.php" id="J_btn_log">Logout</a></li>
			</ul>
		</div>
</div>
<div class="wrapper">
		<div class="rel clear mt10">
			<div class="l box w30">
				<div class="ta-c lh300 box-h">Download CSV</div>
				<div class="box-c">
					<div class="clear forminfo">
						<div class="ta-c forminfo-item">
							<label for="">Choose the Questionnaire you want data from</label>
						</div>
						<div class="ta-c mt5 f125">
							<select id="selectButton" name="questionnaire" onchange="changeInputValue()">
  							</select>
						</div>
						<form action="exportcsv2.php" method="post" name="upload_excel" enctype="multipart/form-data">
                            <div class="ta-c forminfo-item">
								<label for="">Download CSV:</label>
								<input type="submit" name="Export" id="exportcsv" class="btn f125 p2 mt5" value=1 />  
							</div>             
           			    </form>
					</div>
				</div>
			</div>
			
			<div class="l box ml1 w40">
				<div class="ta-c lh300 box-h">Create Quetionnaire</div>
				<div class="box-c">
					<div class="clear forminfo">
						<div class="forminfo-item ml2">
							<label for="">Title</label>
							<input class="input-text" id="title"/>
							<img src="./imgs/Empty.png" id="imageCheck" class="w5 h5">
						</div>
						<div class="forminfo-item">
							<label for="" class="ml30 mt5">Candidate Names</label>
							<input class="input-text" style="width:20%;" id="candidate1"/>
							<input class="input-text" style="width:20%;" id="candidate2"/>
						</div>
						<div class="forminfo-item ml2">
							<label for="">Proposition Description</label>
							<label class="ml30 mt1" for="">Candidates Position</label>
						</div>
						<div id="liste">
						</div>
						<div class="forminfo-item">
							<!--<input class="input-text" style="width:20%; margin-left: 7%;" id="proposition"/>-->
							<input list="prop1" class="input-text ml5" id="proposition"/>
								<datalist id="prop1">
								</datalist>
							<input type="radio" class="ml20" name="jstype" onclick="setOpposite('con2')" id="pro1" checked value=1 />
							<label for="jstype_a">Pro</label>
							<input type="radio" class="ml1"name="jstype" id="con1" onclick="setOpposite('pro2')" value=0 />
							<label for="jstype_b">Con</label>
							<input type="radio" class="ml5" name="jstype2" id="pro2" onclick="setOpposite('con1')" value=1 />
							<label for="jstype_c">Pro</label>
							<input type="radio" class="ml1" name="jstype2" id="con2" onclick="setOpposite('pro1')" checked value=0 />
							<label for="jstype_d">Con</label>
						</div>
						<div class="ta-c forminfo-item">
							<button type="button" class="btn f125 p5 mt1" id="add">Add the proposition</button>
						</div>
						<div class="ta-c forminfo-item">
							<button type="button" class="btn f125 p5 mt5" id="newQuestionnaire">Create Questionnaire</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="l box ml1 w25">
				<div class="ta-c lh150 box-h">Choose the Deployed Questionnaire</div>
				<div class="box-c">
					<div class="clear forminfo">
						<div class="ta-c forminfo-item">
							<label for="">Choose the Questionnaire to deploy</label>
						</div>
						<div class="ta-c f125 mt5">
							<select id="selectDeploy" name="questionnaire" onchange="changeInputValue()">
  							</select>
						</div>
						<div class="ta-c forminfo-item">
							<button type="button" class="btn f125 p5 mt5" id="deployQuestionnaire">Deploy Questionnaire</button>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>

</body>

</html>
