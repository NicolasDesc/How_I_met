# How-I-Met-My-President

## Abstract
Web Application Survey Tool

The purpose of our application would be to propose a set of multiple choice questions, concerning your opinion on a particular subject, in order to help you determine which side you are. For example, it could be questions about political views, and at the end of the test, the result will tell you if you are more conservative or more democrat.

This application could be used by polling institute, to have a more precise idea of the popoluation ideas. For example, in case of a  presidential election, one candidate can be ahead in the overall survey, but with this application, it could be possible to determine on which particular subject people agree or disagree with his idea. So this service could also be used by people managing the campaign of a candidate.
## Introduction, Motivations, Functionnalities
### Introduction and Motivations
Nowadays, people are very interesting in survey results and estimations such as politic views. Our application proposes a set of multiple choice questions, concerning the opinion on a specific subject, in order to return the agreement percentage each user has for each entity within the chosen subject. For example, the pool could be a question set about political views, and at the end of the test, the result will tell you if your ideas are closer to one politician or another.
### Architecture and Functionnalities
#### General architecture requirements:
  * Web application
    *	Client application
    *	Owner application
  *	Web server (Amazon Web Services)
  *	Database (Amazon Web Services)

#### Client side functionalities:
  *	1st view: fill personal information
    *	Gather and put the personal information in the database
  *	2nd view: answering survey (“pro” or “against”)
    *	Select the deployed questionnaire from the database
    *	Gather and display all the questions linked to the deployed questionnaire
  * 3rd view: results of the survey
    * Check the matches between the user’s answer and entity’s answer
    *	Calculate the percentage of agreement for each entity

#### Owner side functionalities:
  *	1st view: login page
    *	If user is registered as an owner in the database then it can access the admin page
    *	If not the login page is refreshed with an error message
  *	2nd view: Admin page
    *	Possibility for the user to download a table of all the results for the deployed questionnaire.
    * Can create a questionnaire and enter new questions
    *	Select the questionnaire to deploy on the client side


## Deploy the project on your server

First you need unbuntu servers, one used for the database and the other one for the website. You can use AWS to do that.

### WebServer
This part is dedicated to the deployment of the website on your Ubuntu server.
In this part you can use NGINX, or Apache on your server, it's up to you. 
Download the whole code, and change the following champs in php files : 

```bash
git clone https://github.com/enzoqtvf/How-I-Met-My-President.git
cp -R How-I-Met-My-President /var/www/html
cd /var/www/html/How-I-Met-My-President
find . -type f -print0 | xargs -0 sed -i 's/serverName/PUT-Address-of-your-DatabaseServer-HERE/g'
find . -type f -print0 | xargs -0 sed -i 's/userName/PUT-userName-for-your-Database-HERE/g'
find . -type f -print0 | xargs -0 sed -i 's/password/PUT-password-for-your-Database-HERE/g'
find . -type f -print0 | xargs -0 sed -i 's/dbName/PUT-dataBase-Name-for-your-Database-HERE/g'
```

### Database
This part is dedicated to the database deployment and building. 
First, in this project you must use mysql database on your server. Once you have a mysql database running on your server,
you can create the database following this physical design:
![My image](https://github.com/enzoqtvf/How-I-Met-My-President/blob/master/imgs/physical_design.png)

Here is a backup of the database if you want to create it directly, on your unbuntu server:
#### Download HowImet.sql:
```bash
git clone https://github.com/enzoqtvf/How-I-Met-My-President.git
cd /How-I-Met-My-President/mysql
find . -type f -print0 | xargs -0 sed -i 's/adminUsername/PUT-the-admin-userName-you-want-HERE/g'
find . -type f -print0 | xargs -0 sed -i 's/adminPassword/PUT-the-admin-password-you-want-HERE/g'
```
#### Download mysql:
```bash
sudo apt-get install mysql-server
```
#### Log in:
```bash
mysql -u yourusername -p yourpassword yourdatabase
```
#### Create database:
```bash
mysql>CREATE DATABASE a_new_database_name
```
#### Create all tables using the backup HowImet.sql:
```bash
mysql -u yourusername -p yourpassword a_new_database_name < HowImet.sql
```




*Authors (in alphabetical order):Nicolas Deschamps, Enzo Piacenza, Nathan Sowie*
