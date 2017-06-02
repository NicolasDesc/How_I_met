
var arrayDesc=[];
var arrayCandidate1Pos=[];
var arrayCandidate2Pos=[];
var arrayDeleteValue=[];
var deleteButton=[];
var listAddContenue=[];
var liste_contenu;
var numberProp;
var candidate1Name;
var candidate2Name;
var questionnaireTitle;
var pouetdebug;
var resultCheck;
var checkTitleOk;
window.onload = function () {
	liste_contenu = document.getElementById("liste");
	var add=document.getElementById("add");
	var newQuestionnaire=document.getElementById("newQuestionnaire");
	var deployQuestionnaireButton=document.getElementById("deployQuestionnaire");
	var titleCheck=document.getElementById("title");
	var cand1Name=document.getElementById("candidate1");
	var cand2Name=document.getElementById("candidate2");
	numberProp=0;
	//Here we call the function getQuestionnaireTitle to fill the select balise (in HTML) with the questionnaire title present on the database
	getQuestionnaireTitle();
	//Here we call the function getPropDataList to fill the datalist balise with the proposition which already exist in the database
	getPropDataList();
	//We add an event listener onchange to the element "title", which means each time the user enter a new value in
	//the input title the function checkTitle is called
	titleCheck.onchange=function(){
		//checkTitle will check if the "title" the user entered is already in the database
		checkTitle(this);
	}
	//We add an event listener onchange to the element "candidate1", which means each time the user enter a new value in
	//the input "candidate1" the function bellow is called
	cand1Name.onchange=function(){
		//This function check if the two candidates entered by the user are the same
		if(this.value==cand2Name.value){
			//In this case the two input background are set in red
			this.style.backgroundColor="#FF9393";
			cand2Name.style.backgroundColor="#FF9393";
		}
		else{
			//In this case the two input background are set in green
			this.style.backgroundColor="#34FF45";
			cand2Name.style.backgroundColor="#34FF45";
		}
	}
	//We add an event listener onchange to the element "candidate2", which means each time the user enter a new value in
	//the input "candidate2" the function bellow is called
	cand2Name.onchange=function(){
		if(this.value==cand1Name.value){
			//In this case the two input background are set in red
			this.style.backgroundColor="#FF9393";
			cand1Name.style.backgroundColor="#FF9393";
		}
		else{
			//In this case the two input background are set in green
			this.style.backgroundColor="#34FF45";
			cand1Name.style.backgroundColor="#34FF45";
		}
	}
	//We add an event listener onclick on the button "Add a proposition"
	add.onclick=function(){
		console.log("ajouter");
		var propDesc = document.getElementById("proposition");
		var pro1 = document.getElementById("pro1");
		var pro2 = document.getElementById("pro2");
		var con1 = document.getElementById("con1");
		var con2 = document.getElementById("con2");
		var candidate1pos;
		var candidate2pos;
		if(pro1.checked){
			candidate1pos=pro1.value;
		}
		else if(con1.checked){
			candidate1pos=con1.value;
		}
		if(pro2.checked){
			candidate2pos=pro2.value;
		}
		else if(con2.checked){
			candidate2pos=con2.value;
		}
		//This function will fill arrays in order to store the proposition, and the two position the user entered
		arrayDesc[numberProp]=propDesc.value;
		arrayCandidate1Pos[numberProp]=candidate1pos;
		arrayCandidate2Pos[numberProp]=candidate2pos;
		//This line add an html div which contain a summary of what the user just entered, and a delete button
		var addContenu='<div class="forminfo-item" id="'+numberProp+'"><label for="" style="width:40%;">'+propDesc.value+'</label> <label for="" style="width:auto;">'+candidate1pos+'</label> <label for="" style="width:auto;">'+candidate2pos+'</label><div class="ta-c forminfo-item"><button type="button" class="btn" onclick="deleteHTML('+numberProp+')" id="delete'+numberProp+'" value="'+propDesc.value+'" style="padding:0 20px; font-size:12px;">Delete</button></div></div>';
		listAddContenue[numberProp]=addContenu;
		liste_contenu.innerHTML=liste_contenu.innerHTML+addContenu;
		numberProp++;
		propDesc.value = "";

	}
	//We add an event listener onclick on the button "Create new questionnaire"
	newQuestionnaire.onclick=function(){
		var correctArray;
		questionnaireTitle=document.getElementById("title").value;
		candidate1Name=document.getElementById("candidate1").value;
		candidate2Name=document.getElementById("candidate2").value;
		//We check if the questionnaire created by the user match our conditions
		if(questionnaireTitle=="" || candidate1Name=="" || candidate2Name==""){
			alert("All fields must be fulfilled");
		} 
		else if(candidate1Name==candidate2Name){
			alert("The name of the candidates must be different");
		}
		//checkTitleOk is a variable returned by checkTitle() function, it's set as "false" if the title already exist on the database
		else if(checkTitleOk=="false"){
			alert("You must use a new Questionnaire Title");
		}
		else{
			//We call the function corrigeUserError, in order to eliminate all duplicate, and null proposition
			//entered by the user
			correctArray=corrigeUserError(arrayDesc,arrayCandidate1Pos,arrayCandidate2Pos);
			//We call the function createQuestionnaire to collect the questionnaire made by the user on the database.
			createQuestionnaire(correctArray[0],correctArray[1],correctArray[2],questionnaireTitle,candidate1Name,candidate2Name);
			
		}
	}
	//We add an event listener onclick on the button "Deploy Questionnaire"
	deployQuestionnaireButton.onclick=function(){
		var selectValue=document.getElementById("selectDeploy").value;
		//We call the function deployQuestionnaire() with the value of the questionnaire selected by the user
		// and this function will change the deployed questionnaire on the database
		deployQuestionnaire(selectValue);
		alert("Deployed Questionnaire Changed");
	}

}
//This function is called once the button delete near a proposition is clicked, it will delete the html related to the proposition
//and erase the proposition from the three(arrayDesc, arrayCandidate1Pos, arrayCandidate2Pos) array used to create the questionnaire
function deleteHTML(number){
	var index;
	liste_contenu.innerHTML=liste_contenu.innerHTML.replace(listAddContenue[number],"");
	index = arrayDesc.indexOf(arrayDesc[number]);
	arrayDesc.splice(index,1);
	console.log(arrayDesc.length);
	arrayCandidate1Pos.splice(index,1);
	arrayCandidate2Pos.splice(index,1);
}
//This function call the getQuestionnaireTitle.php file using GET method
function getQuestionnaireTitle() {
  var selectButton=document.getElementById("selectButton");
  var selectDeploy=document.getElementById("selectDeploy");
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else { // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
      //The result provided by the getQuestionnaireTitle.php file is used to fill the two selects with the titles which are on the database
      selectButton.innerHTML=this.responseText;
      selectDeploy.innerHTML=this.responseText;
    }
  }
  xmlhttp.open("GET","getQuestionnaireTitle.php",true);
  xmlhttp.send();
}
//This function is used to change the value of the submit "exportcsv" in order to use it as argument for the function exportcsv()
function changeInputValue(){
	var select=document.getElementById("selectButton");
	var input=document.getElementById("exportcsv");
	input.value=select.value;
}
//This function call the file createQuestionnaire.php using GET method with some argument
//the input of this function are the array which contains proposition, the array which contains candidate1 and 2 position on each proposition
//the questionnaire title, and the two candidate names
function createQuestionnaire(arrayDesc,arrayCandidate1Pos,arrayCandidate2Pos,questionnaireTitle,candidate1Name,candidate2Name){
	if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp1=new XMLHttpRequest();
  } else { // code for IE6, IE5
    xmlhttp1=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp1.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
      pouetdebug=this.responseText;
      alert("Questionnaire created succesfully");
      // we reload the page once the questionnaire is created succesfully in order to clean the page
      location.reload;
    }
  }
  var jsonArrayDesc=JSON.stringify(arrayDesc);
  var jsonArrayCandidate1Pos=JSON.stringify(arrayCandidate1Pos);
  var jsonArrayCandidate2Pos=JSON.stringify(arrayCandidate2Pos);
  // here we send to the php file, the three array, and the questionnaire title, and the two candidate names
  xmlhttp1.open("GET","createQuestionnaire.php?jsonArrayDesc="+jsonArrayDesc+"&jsonArrayCandidate1Pos="+jsonArrayCandidate1Pos+"&jsonArrayCandidate2Pos="+jsonArrayCandidate2Pos+"&questionnaireTitle="+questionnaireTitle+"&candidate1Name="+candidate1Name+"&candidate2Name="+candidate2Name,true);
  xmlhttp1.send();
}
//This function call the deployQuestionnaire.php file using GET method, and with one input
function deployQuestionnaire(selectValue) {
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else { // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
    }
  }
  //We send the variable selectValue, which is the selected quesitonnaire the user wants to deploy
  xmlhttp.open("GET","deployQuestionnaire.php?selectValue="+selectValue,true);
  xmlhttp.send();
}
//This function call getPropDataList.php using GET method
function getPropDataList() {
  var datalist=document.getElementById("prop1");
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else { // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
      //getPropDataList.php return an html with all the <option> with propositions we want to add to our datalist
      //then the user can use easily proposition which already exist
      datalist.innerHTML=this.responseText;
    }
  }
  xmlhttp.open("GET","getPropDataList.php",true);
  xmlhttp.send();
}
//This function call the checkTitle.php file using GET method, and one argument
function checkTitle(title) {
  var imageCheck=document.getElementById("imageCheck");
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else { // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
	//checkTitle.php return "exist" or "does not exist" depending if the title already exist in the database
    	resultCheck=this.responseText;
	if(resultCheck=="exist"){
		//if it already exists, a red cross is displayed near the input, the background of the input is set as red, and the user
		//get an alert
		imageCheck.src="./imgs/unCheck.png";
		title.style.backgroundColor="#FF9393";
		alert("This Title : "+title.value+" already exist, you must use a new one");
		checkTitleOk="false";
	}
	else {
		//if it doesn't exists, a green "V" is displayed near the input, the background of the input is set as green
		title.style.backgroundColor="#34FF45";
		imageCheck.src="./imgs/Check.png";
		checkTitleOk="true";
	}
	}
  }
  xmlhttp.open("GET","checkTitle.php?titleValue="+title.value,true);
  xmlhttp.send();
}


//This function is the one which correct user misstake, it will correct if the user entered duplicate or empty porpositions
function corrigeUserError(arrayDesc,arrayCandidate1Pos,arrayCandidate2Pos) {
  var i,
  k=0,
  len=arrayDesc.length,
  result = [],
  lengthTest,
  newArrayDesc = [],
  newArrayCan1 = [],
  newArrayCan2 = [],
  returnArray=[],
  obj = {}; 
  for (j=0; j<len; j++){
	 // if user delete proposition during his questionnaire creation, some value of the array will be set as undifined
	 // we don't want to send it to the database
  	if(arrayDesc[j]===undefined || arrayDesc[j]==""){
  		console.log("undifined")
  	}
  	else{
  		newArrayDesc[k]=arrayDesc[j];
  		newArrayCan1[k]=arrayCandidate1Pos[j];
  		newArrayCan2[k]=arrayCandidate2Pos[j];
  		k++;
  	}
  }
  for (i=0; i<newArrayDesc.length; i++)
  {
  	lengthTest=Object.keys(obj).length;
  	obj[newArrayDesc[i]]=0;
  	console.log(lengthTest);
  	if (lengthTest==Object.keys(obj).length){
  		newArrayCan1.splice(i,1);
  		newArrayCan2.splice(i,1);
  	}
  }
  console.log(obj);
  for (i in obj) {
  result.push(i);
  }
  returnArray=[result,newArrayCan1,newArrayCan2];
  //it returns the good arrays to send to the database
  return returnArray;
 }


//This functions is called when the user click on a radio button, if the user click on pro for candidate1
//this function set the candidate2 radio button con as checked
 function setOpposite(str){
 	var buttonToCheck=document.getElementById(str);
 	buttonToCheck.checked=true;
 }

 
