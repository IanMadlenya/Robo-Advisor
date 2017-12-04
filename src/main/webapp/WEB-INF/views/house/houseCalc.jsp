<%@page import="spring.project.vo.XmlVO2"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.left-box {float: left; width: 50%;}
	
	.right-box {float: right; width: 50%;}
	
	font {color: #F05F40;}
	
	#toggleButton{
		border-collapse: collapse;
		border:1px #98C593;
		border-radius : 50px 50px 50px 50px;
		width: 130px; 
		height: 50px;
		font-size: 18px;
		background-color: #F05F40;
		color: white;
	}
	#recomm_pd{width: 100%;height : 300px;font-size: 20px;text-align: center}
	#recomm_pd th{text-align: center; color: #00A2D1}
</style>
<!-- amCharts javascript sources -->
<script type="text/javascript"
	src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script type="text/javascript"
	src="https://www.amcharts.com/lib/3/serial.js"></script>
<script type="text/javascript"
	src="https://www.amcharts.com/lib/3/themes/light.js"></script>


<!-- amCharts javascript code -->
<script type="text/javascript">
	AmCharts.makeChart("chartdiv", {
		"type" : "serial",
		"categoryField" : "category",
		"angle" : 30,
		"depth3D" : 30,
		"startDuration" : 1,
		"theme" : "light",
		"categoryAxis" : {
			"gridPosition" : "start"
		},
		"trendLines" : [],
		"graphs" : [ {
			"balloonText" : "[[title]] of [[category]]:[[value]]",
			"fillAlphas" : 1,
			"id" : "AmGraph-1",
			"title" : "준비자금",
			"type" : "column",
			"valueField" : "column-1"
		}, {
			"balloonText" : "[[title]] of [[category]]:[[value]]",
			"fillAlphas" : 1,
			"id" : "AmGraph-2",
			"title" : "부족자금",
			"type" : "column",
			"valueField" : "column-2"
		} ],
		"guides" : [],
		"valueAxes" : [ {
			"id" : "ValueAxis-1",
			"stackType" : "regular",
			"title" : "자금"
		} ],
		"allLabels" : [],
		"balloon" : {},
		"legend" : {
			"enabled" : true,
			"useGraphSettings" : true
		},
		"titles" : [ {
			"id" : "Title-1",
			"size" : 15,
			"text" : "주거 마련 자금 그래프"
		} ],
		"dataProvider" : [ {
			"category" : "총 필요자금",
			"column-1" : "${vo.requireMoney }",
			"column-2" : ""
		}, {
			"category" : "부족자금 / 준비자금",
			"column-1" : "${vo.totalMoney }",
			"column-2" : "${vo.lackMoney }"
		} ]
	});
</script>
<script type="text/javascript">
	// 숨겨진 레이어 보이기
	function display() {
		moreView.style.display = "";
	}
	
</script>
</head>
<body>
	<%@ include file="/resources/include/headerHouse.jsp"%>

	<h2 align="center"><font><%=session.getAttribute("name")%></font>님의 주거 자금 상황입니다.</h2>
	<hr id="redHr">
	<div class="left-box">
		<!-- 그래프 -->
		<div id="chartdiv" style="width: 100%; height: 400px;"></div>
	</div>

	<div class="right-box">
		<h4>목표 주거 금액을 위해 저축해야하는 연 금액은</h4>
		<h2>
			<font color="#F05F40">${vo.yearSave }만원 입니다.</font>
		</h2>
		<h4>목표 주거 금액을 위해 저축해야하는 월 금액은</h4>
		<h2>
			<font color="#F05F40">${vo.monthSave }만원 입니다.</font>
		</h2>
		<h4>월 저축가능 금액과 저축 금액을 통해 모을 수 있는 총 자금은</h4>
		<h2>
			<font color="#F05F40">${vo.totalMoney }만원 입니다.</font>
		</h2>
		<h4>예상되는 부족 자금은</h4>
		<h2>
			<font color="#F05F40">${vo.lackMoney }만원 입니다.</font>
		</h2>
	</div>
	</header>
	<br>
	<div align="center">
		<h4>
			<%=session.getAttribute("name")%> 님은 <font>${vo.enterYear }년</font>도 즈음에 <font>${vo.requireMoney }만원</font> 정도의 주거를 목표로 하고 있습니다.<br>
			현재 준비된 자금은 <font>${vo.savedMoney }만원</font>이며, 준비된 자금과, 월 저축 가능 금액으로 모을 수 있는 금액은
			<font>${vo.totalMoney }만원</font> 입니다.<br>
			따라서 <font>${vo.lackMoney }만원</font>의 부족자금이 발생합니다.
		</h4>
		<hr id="redHr">
		<h4>
			부족한 주거자금을 보충하기 위해서는 매달 <font>${vo.addMoney }만원</font>을 추가 저축해야 합니다.<br>
			부족 금액의 40%를 대출 받을 경우 매달 <font> ${vo.addMoney2 }만원</font>을 추가 저축해야
			합니다.<br> 부족 금액의 60%를 대출 받을 경우 매달 <font>${vo.addMoney3 }만원</font>을
			추가 저축해야 합니다.
		</h4>
		<hr>
		<input  id="toggleButton" type="button" value="상품추천받기" onclick="display()"/>
		<input id="resultInput" type="submit" value="다시하기"
			onclick="location.href='<%=request.getContextPath()%>/house.do' " />
	</div>
	<br>
	<!-- 상품추천 테이블 목록 div -->
	<div align="center" id="moreView" style="display: none;">
		<div style="background-color: #353535">
			<br>
			<h2 style="color: white;">추천상품</h2>
			<h3 style="color: #00A2D1">고객님께 가장 잘 맞는 상품을 소개합니다!</h3>
			<br>
		</div>
		<div style="background-color: #4C4C4C; color: white">
		<br>
		<table id="recomm_pd">
			<tr style="color: #00A2D1">
				<th>금융회사</th>
				<th>상품명</th>
				<th>금리방식</th>
				<th>상환방식</th>
				<th>최저금리</th> 
				<th>최고금리</th> 
				<th>평균금리</th> 

			</tr>
			<tr><td colspan="7" style="height: 30px"></td></tr>
			<%
				List<XmlVO2> xmlList = (List<XmlVO2>)request.getAttribute("xmlList");
				XmlVO2 xmlvo = new XmlVO2();
				
				if(xmlList.size() > 0){
					for(int i=0; i<xmlList.size(); i++){
						xmlvo = xmlList.get(i);
						
						if(xmlvo.getLend_rate_type_nm() == null && xmlvo.getRpay_type_nm() == null){	// 만약 값이 null이면 출력X
							continue;
						}else{
							%>

							<tr>
								<td><%=xmlvo.getKor_co_nm() %></td>
								<td style="color: #FFE400"><%=xmlvo.getFin_prdt_nm() %></td>
								<td><%=xmlvo.getLend_rate_type_nm() %></td>
								<td><%=xmlvo.getRpay_type_nm() %></td>
								<td><%=xmlvo.getLend_rate_min() %></td>
								<td><%=xmlvo.getLend_rate_max() %></td>
								<td><%=xmlvo.getLend_rate_avg() %></td>
							</tr>
							<tr><td colspan="7" style="height: 30px"></td></tr>
							<tr>
								<th style=" font-size: 15px">중도상환수수료 :</th>
								<td colspan="6" style="text-align: left; font-size: 15px"><%=xmlvo.getErly_rpay_fee() %></td>
							</tr>
							<tr>
								<th style="font-size: 15px">연체 이자율 :</th>
								<td colspan="6" style="text-align: left; font-size: 15px"><%=xmlvo.getDly_rate() %></td>
							</tr>
							<tr><td colspan="7" style="height: 30px"></td></tr>
						<%
						}
					}
				} else{
					%>
					<tr>
						<td colspan="5">추천 상품 목록이 없습니다.</td>
					</tr>
					<%
				}
			%>
		</table>
		<br><br>
		</div>
	</div>
	
</body>
</html>