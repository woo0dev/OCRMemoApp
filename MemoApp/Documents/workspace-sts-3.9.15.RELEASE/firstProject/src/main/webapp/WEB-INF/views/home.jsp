<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<%
	int number=1;
	int sum=0;
	
	for(int i=1; i<=10; i++){
		sum+=i;
		out.print(i+"까지 합계는 "+sum+"<BR>");
	}
%>

</body>
</html>
