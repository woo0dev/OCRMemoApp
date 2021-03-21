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
<H1>Lotto</H1>
<%
	int nLottoCnt = 6;
	int nArrLottoNum[] = new int[nLottoCnt];
	int nCurrentLottoCnt = 0;
	int nGenNumber = 0;
	int random = 0;
	boolean bExistLottoNumber = false;
	
	for(int i=0; i<nArrLottoNum.length; i++) {
		nArrLottoNum[i] = 0;
	}
	
	for(int i=0; i<nArrLottoNum.length; i++) {
		random =(int)(Math.random() * 10);
		for(int j=0; j<nArrLottoNum.length; j++) {
			if(random != nArrLottoNum[j]) {
				bExistLottoNumber = true;
			} else {
				bExistLottoNumber = false;
				break;
			}
		}
		if(bExistLottoNumber && nArrLottoNum[i] == 0) {
			nArrLottoNum[i] = random;
		} else {
			i--;
		}
	}
	
	for(int i=0; i<nArrLottoNum.length; i++) {
		out.print((i+1)+"번째 Lotto Number: " + nArrLottoNum[i] + "<BR>");
	}
	
%>
</body>
</html>