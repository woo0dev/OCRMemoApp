<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	for(int i=2; i<1000; i++) {
		for(int j=2; j<=i; j++) {
			if(i%j == 0) {
				if(i/j != 1) {
					break;
				}
				out.print(i+" ");
			}
		}
	}
%>
</body>
</html>