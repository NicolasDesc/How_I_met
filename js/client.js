var userGender;
var userAge;
var userState;
var nicolas;
var btn_questionnary;
var userAnswer;
var candidateArray=[];
var listProposition=[];
var answerID;
window.onload = function (){
	//That's used to fill the state select
	var state_index = ['Alabama','Alaska','American Samoa','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Federated States of Micronesia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Marshall Islands','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Northern Mariana Islands','Ohio','Oklahoma','Oregon','Palau','Pennsylvania','Puerto Rico','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virgin Island','Virginia','Washington','West Virginia','Wisconsin','Wyoming'];
	var i=0;
	var states = document.getElementById("states");
	while(i<state_index.length){
		//we add options to the state select
		states.innerHTML=states.innerHTML+'<option value="'+state_index[i]+'">'+state_index[i]+'</option>';
		i++;
	}

	
	var btn_formulary=document.getElementById("J_btn_start");
	//We add a onclick lsitener on btn_formulary
	btn_formulary.onclick = function(){
		userGender=document.getElementById("gender").value;
		userAge=document.getElementById("age").value;
		userState=document.getElementById("states").value;
		//this function it's used to send the information filled by the user to the database
		sendFormulary();
		//this will hide the formaulaire box, in order to display the quizz one
		document.querySelector('.formulaire').style.display = 'none';
		// this function will displayed the questionnaire deployed by the admin to the user
  		launchQuizz();
		
  	}

}
// This function call the fillFormulary.php file using GET method in order to fill the answerer_info table with the information provided
// by the user
function sendFormulary() {
  var formularyResponse=document.getElementById("formularyResponse");
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else { // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
      // the php file return a full html file which is the questionnaire, and we put it in a balise which already exist on the html page
      formularyResponse.innerHTML=this.responseText;
      //we use it to get the answerID of the actual user in order to use it later
      answerID=document.getElementById("answerer_ID").innerHTML;
    }
  }
  //we send to fillFormulary.php the userGender, the userAge, and the userState
  xmlhttp.open("GET","fillFormulary.php?userGender="+userGender+"&userAge="+userAge+"&userState="+userState,true);
  xmlhttp.send();
}
//this function does multiple things, first it call the getQuestionnary.php file using GET method
//then it contains the script running the html provided by the getQuestionnary.php
function launchQuizz(){
  nicolas=document.getElementById("questionnaryDisplay");
  if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp=new XMLHttpRequest();
  } else { // code for IE6, IE5
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
	//Here we get the full questionnaire which is an html file
      	nicolas.innerHTML=this.responseText; 
	btn_questionnary=document.getElementById("J_btn_login");
	//Here we handle the html file provided by the php file
	//We add an onclick event listener on the button submit created by the php file
	btn_questionnary.onclick = function(){
		var blank = false;
		//we check if the user answered to all question
		$("input:radio").each(function() {
			//get names of each radio button of the group
    			var val = $('input:radio[name=' + this.name + ']:checked').val(); 
    			//check if each one has a va
    			if (val === undefined) {
        			blank = true;
        			return false;
    			}
		});
		if(blank){alert("You must answer to all questions to get your result")}
		else{
		//the user can access here only if he answered to all questions
			//here we call the function getAnswers() to collect all the user answers
			userAnswer=getAnswers();
			//we hide the questionnaire to display the last view
			document.querySelector('.quizzQuestion').style.display = 'none';
			// we call the function createArray() which will create the array we will send to the database
			var rawArray=createArray(userAnswer,listProposition,answerID);
			// we call the function sendResults, which is used to fill the database with user's answers
			sendResults(rawArray);
			//This function is called to display the result to the user
			displayResults();
			console.log(proposition_id);
		}
	}
     }
  }
  xmlhttp.open("GET","getQuestionnary.php",true);
  xmlhttp.send();
}

// this function is used to parse the propositonString ID we have, in order to create an array with it(proposition_id is created 
// once we get the questionnaire)
function parseProposition(listProposition){
	var propositionString=document.getElementById("proposition_id").innerHTML;
	var k=0;
	var espace;
	while(propositionString.length>2){
    		espace=propositionString.search(" ");
    		listProposition[k]=propositionString.substring(0,espace);
    		propositionString=propositionString.substring(espace+1);
   		k++;
	}
	return listProposition;
}
//this function is used to retrive the two candidate names, and add them in an array(candidateName is created 
// once we get the questionnaire)
function parseCandidate(candidateArray){
	var candidateString=document.getElementById("candidateName").innerHTML;
	var slash=candidateString.search("/");
	var slashEnd=candidateString.lastIndexOf("/");
	candidateArray[0]=candidateString.substring(0,slash);
	candidateArray[1]=candidateString.substring(slash+1,slashEnd);
	return candidateArray;

}
//This function is used to check all the radio button checked by the user and retrieve its answers
function getAnswers(){
	listProposition=parseProposition(listProposition);
	candidateArray=parseCandidate(candidateArray);
	var i=0;
	var answer=[];
	var pro;
	var con;
	var strPro;
	var strCon;
	while(i<listProposition.length){
		strPro=listProposition[i]+"_a";
		strCon=listProposition[i]+"_b";
		pro=document.getElementById(strPro);
		con=document.getElementById(strCon);
		if(pro.checked){
		 	answer[i]=pro.value;
		}
		else if(con.checked){
			if(pro.value==candidateArray[0]){
				answer[i]=candidateArray[1];
			}
			else if(pro.value==candidateArray[1]){
				answer[i]=candidateArray[0];
			}
		}
		i++;
	}
	return answer;
}

//this function will display the result to the user
function displayResults(){
	var candidate_1=document.getElementById("candidate_1");
	var candidate_1_pourcentage=document.getElementById("candidate_1_pourcentage");
	var candidate_2=document.getElementById("candidate_2");
	var candidate_2_pourcentage=document.getElementById("candidate_2_pourcentage");
	candidate_1.innerHTML = candidateArray[0];
	candidate_2.innerHTML = candidateArray[1];
	var cnt_c1=0;
	var cnt_c2=0;
	var i=0;
	while(i<userAnswer.length){
		if(userAnswer[i]==candidateArray[0]){
			cnt_c1++;
		}
		else if(userAnswer[i]==candidateArray[1]){
			cnt_c2++;
		}
		i++;
	}
	candidate_1_pourcentage.innerHTML = Math.round(cnt_c1/userAnswer.length*100)+"%";
	candidate_2_pourcentage.innerHTML = Math.round(cnt_c2/userAnswer.length*100)+"%";	
	//this line display the last box to the user(the result box)
	document.querySelector('.results').style.display = 'block';
}
//this function call the sendAnswers.php file with the argument rawArray to fill the database
function sendResults(rawArray){
	if (window.XMLHttpRequest) {
    // code for IE7+, Firefox, Chrome, Opera, Safari
    xmlhttp1=new XMLHttpRequest();
  } else { // code for IE6, IE5
    xmlhttp1=new ActiveXObject("Microsoft.XMLHTTP");
  }
  xmlhttp1.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
      
    }
  }
  var jsondata=JSON.stringify(rawArray);
  xmlhttp1.open("GET","sendAnswers.php?jsondata="+jsondata,true);
  xmlhttp1.send();
}
//this function create the array which will be sent to the sendAnswers.php file
function createArray(userAnswer,listProposition,answerID){
	var rawArray=[];
	rawArray[0]=answerID;
	var halfLength=listProposition.length;
	for(i=1;i<halfLength+1;i++){
		rawArray[i]=listProposition[i-1];
		rawArray[i+halfLength]=userAnswer[i-1];
	}
	return rawArray;
}
