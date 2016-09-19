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
	 $(function(){
	 	//变量用来支持单元格编辑时使用
	    var editIndex = undefined;
	 	
	 	$('#dg').datagrid({    
  	 //	 url:'${proPath}/goods/selectAll.action', //单条件查询
  	 	 url:'${proPath}/stock/selectPageListUseDyc.action',
	
  	 	 nowrap:true,
  	 	 rownumbers:true,
   	 	 pageNumber:1, 
  	 	 pageSize:2,
  	 	 pageList:[2,4,9],
 	 	 pagination:true, 
  	 	 //多页同时记录删除，不会沟了翻页就没了idField:'supId',
  	 	 idField:'goodsId',
  	 	 singleSelect:false,
  	 	 selectOnCheck:true,
  	 	 checkOnSelect: true,
 	 	 queryParams: //form2Json("form1"),
			{
				boId:'%%',
		        goodsName:'%%' 
			},
						 	    
   		 columns:[[    
	        {field:'goods',title:'商品编号',width:100,checkbox:true},
	        {field:'goodsId',title:'商品名称',width:100},
	        {field:'stockId',title:'库存单号',width:100},    
	        {field:'shId',title:'仓库编号',width:100},    
	        {field:'stockFirstdate',title:'库存第一次进入时间',width:200,align:'right',
	        	formatter:function(value,row,index){
	        		alert("value"+value);
	        		var time = new Date(value);
	        		return time.toLocaleString();
	        	}
	        
	        },
	        {field:'stockLastdate',title:'库存出货时间',width:200
	        	
	        
	        },
	        {field:'stockAmount',title:'库存数量',width:100},
	        {field:'stockPrice',title:'库存价钱',width:100,editor:'numberbox', },    
	   		]]
	   	});
	
			 $("#search").click (function () {  
           		 alert("1");  
           		 alert($("#stockId").val()+"stockId");                                                                                                                                                                                                                               
           		 var stockIds = $("#stockId").val();
           		 var goodsId = $("#goodsId").val();
           		 alert(stockIds+"stockId1");
           		 alert(goodsId+"goodsId1");
          // 		 if(boIds==null || boIds==''){boIds='null' ;}
           //		 if(goodsNames==null || goodsNames==''){goodsNames='null';} 
            	 alert(stockIds+"stockId2");
           		 alert(goodsId+"goodsId2"); 
                $('#dg').datagrid('load',{
	                //  queryParams: form2Json("form1") 
	                 stockId:stockIds,
 	                 goodsId:goodsId             	
                });   //点击搜索
            }); 
        });
            
      //      $("#goodsName").
      //goodsName是商品的名称，goodsId是商品的id,现在通过input的onchang="doSelect()"事件去数据库查询goodsId返回到
/*             function doSelect(){
            	alert("haha");
            	$.ajax({
            		url:"${proPath}/goods/selectByGoodsName.action",
            	 	data:{"goods.goodsName":goodsName},
            		type:"post",
            		success:function(msg){
            			alert("msg="+msg);
            			var goodsId =("#goodsId").val();
            			alert("goodsId="+goodsId);
            		},
            		error:function(){
            			alert("发送失败");
            		}
            	});
            } */

</script>  	
  </head> 
  <body>	
  	 
	<form action="" name="form1" id="form1" method="post">
		<br>请填写库存信息：<br>
		库存单号：<input type="text" id="stockId" name="stockId" />
		商品名称：<input type="text" id="goodsId" name="goodsId" />
		<!-- <input type="text" id="goodsName" name="goodsName" onchange="doSelect();"/> -->
	
		<input type='button' value='库存搜索' id="search" />
		
		
	</form> 
	
	<table id="dg"></table> 
	

</body>
</html>
