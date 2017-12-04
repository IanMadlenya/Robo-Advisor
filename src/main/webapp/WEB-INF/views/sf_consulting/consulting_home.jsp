
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주거</title>
</head>
<body>
	<%@ include file="/resources/include/headerSF.jsp"%>
	
	<h2 align="center">당신의 주거 계획에 대하여 말씀해주세요.</h2>
	<hr id="redHr">
	<form method="post" action="<%=request.getContextPath()%>/sf_marrige.do">
		<div id="userInput" align="center">
			<input type="hidden" name="code" value="${vo.code }"/>
			<input type="hidden" name="id" value="<%=(String)session.getAttribute("id")%>"/>
			<input type="hidden" name="nowAge" value="${vo.nowAge }"/>
			<input type="hidden" name="gender" value="${vo.gender }"/>
			<input type="hidden" name="name" value="<%=(String)session.getAttribute("name")%>"/>
			<input type="hidden" name="invest_tot" value="${vo.invest_tot }"/>
			<h4>당신은 현재 어떤집에 살고있나요?
				<select name="home_select"  id="input1">
					<option value=0>부모님과거주</option>
					<option value=1>내집거주</option>
				</select><br></h4>
			<h4>현재 집을 위해 모아둔자금은?(현재 집가격은?) : <input  id="input1" name="savedMoney" value="5000"/>만원</h4>
			<hr>
			<h2>어떤 집에 살고 싶으십니까?</h2>
			<h5><select name="home_region" id="input1" >
				<option value=0>거주지역</option>
				<option value=1>서울</option>
				<option value=0.5>인천</option>
				<option value=0.6>경기</option>
				<option value=0.7>기타 수도권</option>
				<option value=0.5>5개광역시</option>
				<option value=0.4>기타지역</option>
			</select> <select name="home_type" id="input1" >
				<option value=0>주거형태</option>
				<option value=2152>아파트 매매</option>
				<option value=1582>아파트 전세</option>
				<option value=407>단독주택</option>
				<option value=849>연립주택</option>
			</select> 
			면적 : <input name="home_m" id="input1"  value="33"/>평</h5>
			<hr>
			<h2>목표 시기는 언제입니까?</h2>
			<input id="input1" name="goalTime" value="10"/>년뒤
			<hr>
			<br>
			<input id="resultInput" type="submit" value="다음단계로"/>
			<br><br>
		</div>
	</form>


</body>
</html>