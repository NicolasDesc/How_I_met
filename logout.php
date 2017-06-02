<?php
   session_start();
   //used when the user click on Logout
   if(session_destroy()) {
      header("Location: login.php");
   }
?>
