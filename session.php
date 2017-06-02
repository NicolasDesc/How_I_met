<?php
   include('config.php');
   session_start();
   //used to check if a session has been established, and the user log in, if not you are redirected to the login.php file
   $user_check = $_SESSION['login_user'];
   
   $ses_sql = mysqli_query($db,"select admin_name from admin where admin_name = '$user_check' ");
   
   $row = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
   
   $login_session = $row['admin_name'];
   
   if(!isset($_SESSION['login_user'])){
      header("location:login.php");
   }
?>
