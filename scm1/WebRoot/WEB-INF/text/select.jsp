<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
<title></title>
<style type="text/css">
.searchbox{
	margin:-3
}
</style>
  
<script type="text/javascript">
	
            
      //      $("#goodsName").
      //goodsName是商品的名称，goodsId是商品的id,现在通过input的onchang="doSelect()"事件去数据库查询goodsId返回到
            function doSelect(){
            	var goodsName = $("#goodsName").val();
            	
            	alert("haha");
          //  	var goodsName = ("#goodsName").val();
            	alert("goodsName="+goodsName);
            	$.ajax({
            		url:"${proPath}/goods/selectByGoodsName.action",
            		data:{"goodsName":goodsName},
            		type:"post",
            //		dataType:"json",
            		success:function(msg){
            			alert("msg="+msg);
            			var goodsId =$("#goodsId").val();
            			alert("未赋值前goodsId="+goodsId);
            			goodsId = msg;
            			alert("赋值后goodsId="+goodsId);
            		},
            		error:function(){
            			alert("发送失败");
            		}
            	});
            }

</script>  	
  </head> 
  <body>	
  	 
	<form action="" name="form1" id="form1" method="post">&nbsp; 
		<br>请填写库存信息：<br>
		库存单号：<input type="text" id="stockId" name="stockId" />
		商品名称：<input type="hidden" id="goodsId" name="goodsId" />
		<input type="text" id="goodsName" name="goodsName" onchange="doSelect();"/>
		
		<input type='button' value='点击查询商品Id' id="search" />
		查询结果为：<input type="text" id="goodsId" name="goodsId" value=""/><!--  -->
		
	</form> 
	
	<table id="dg"></table> 
	

</body>
</html>
