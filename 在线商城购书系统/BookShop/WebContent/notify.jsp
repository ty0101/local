<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
  <head>
    <title>支付结果</title>
    <style>
    .a11{
    text-align: center;}
    
    </style>
  </head>
  <body>
  <jsp:include page="header.jsp" />
    <div class="a11">
<h3>支付结果</h3>
	支付状态:成功<br/>
	支付金额:${sessionScope.resMap.cash_fee/100}元<br/>
	交易单号:${sessionScope.resMap.transaction_id}<br/>
	支付时间:${sessionScope.resMap.time_end}<br/>
	</div>
  </body>
</html>
