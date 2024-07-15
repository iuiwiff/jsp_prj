<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<link rel="icon" href="http://192.168.10.230/jsp_prj/common/favicon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<!--sist스타일시트 시작--> 
<link rel="stylesheet" href="http://192.168.10.230/jsp_prj/common/css/main.css" type="text/css" media="all" /> 
<link rel="stylesheet" href="http://192.168.10.230/jsp_prj/common/css/board.css" type="text/css" media="all" /> 
<!--sist스타일시트 끝-->

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">


</style>
<script type="text/javascript">
	$(function() {
		
	});//ready
</script>
</head>
<body>
	<h1>Join</h1>
	<form method="post" action="joinAction.jsp">
	<label for="userID">ID:</label>
	<input type="text" id="userID" name="userID" required>
	<br>
	<label for="userPassword">Password:</label>
	<input type="password" id="userPassword" name="userPassword" required>
	<br>
	<label for="userName">Name:</label>
	<input type="text" id="userName" name="userName" required>
	<br>
	<label for="userGender">Name:</label>
	<input type="text" id="userGender" name="userGender" required>
	<br>
	<label for="userEmail">Name:</label>
	<input type="email" id="userEmail" name="userEmail" required>
	<br>
	<input type="submit" value="Join">
	</form>

</body>
</html>