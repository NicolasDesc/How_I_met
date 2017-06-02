<?php
   include("config.php");
   session_start();
   
   if($_SERVER["REQUEST_METHOD"] == "POST") {
      // username and password sent from form 
      
      $myusername = mysqli_real_escape_string($db,$_POST['username']);
      $mypassword = mysqli_real_escape_string($db,$_POST['password']); 
      
      $sql = "SELECT id FROM admin WHERE admin_name = '$myusername' and password = '$mypassword'";
      $result = mysqli_query($db,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      
      $count = mysqli_num_rows($result);
      
      // If result matched $myusername and $mypassword, table row must be 1 row
		
      if($count == 1) {
        // session_register("myusername");
         $_SESSION['login_user'] = $myusername;

         header("location: admin.php");
      }else {
         $error = "Your Login Name or Password is invalid";
      }
   }
?>
<html>
   
   <head>
      <title>Login Page</title>
      
      <link rel="stylesheet" href="css/global.css" />
      <link rel="stylesheet" href="css/page.css" />
      
   </head>
   
   <body>
	
      <div class = "formulaire">
         <div class="abs box formulaire-box">
            <div class="ta-c lh300 box-h">Login</div>
				
            <div class="box-c">
              <div class="forminfo"> 
               <form action = "" method = "post">
                  <div class="forminfo-item ta-c">
                    <label>UserName:</label><input type = "text" name = "username" /><br /><br />
                     <label>Password:</label><input type = "password" name = "password" /><br/><br />
                     <input type = "submit" class="ta-c btn f125 p2 mt5" value = " Submit "/><br />
                     <div style = "font-size:11px; color:#cc0000; margin-top:10px"><?php echo $error; ?></div>
                  </div>
               </form>
               
	     </div>				
            </div>
				
         </div>
			
      </div>

   </body>
</html>
