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
  	 	 url:'${proPath}/buyOrderDetail/selectPageListUseDyc2.action',
	
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
	        {field:'goodsId',title:'商品编号',width:100,checkbox:true},
	        {field:'boId',title:'采购单号',width:100},    
	        {field:'goodsName',title:'商品名称',width:100},    
	        {field:'goodsUnit',title:'商品单位',width:100,align:'right'},
	        {field:'goodsType',title:'商品类型',width:100},
	        {field:'goodsColor',title:'商品颜色',width:100},
	        {field:'bodAmount',title:'数量',width:100,editor:'numberbox', },
	        {field:'bodBuyPrice',title:'进价',width:100,},
	        {field:'bodTotalPrice',title:'合计总价钱',width:100,},
	        {field:'bodImeiList',title:'串号列表',width:100,editor:'textarea'}	    
	   		]]
	   	});
	
			 $("#search").linkbutton({ iconCls: 'icon-search', plain: true })
           		 .click(function () {  
           		 alert("1");  
           		 alert($("#boId").val()+"boId");  
           		 var boIds = $("#boId").val();
           		 var goodsNames = $("#goodsName").val();
           		 alert(boIds+"boId1");
           		 alert(goodsNames+"goodsName1");
           	//	 if(boIds==null || boIds==''){boIds='null' ;}
           	//	 if(goodsNames==null || goodsNames==''){goodsNames='null';} 
            	 alert(boIds+"boId2");
           		 alert(goodsNames+"goodsName2"); 
                $('#dg').datagrid('load',{
	                //  queryParams: form2Json("form1") 
	                 boId:boIds,
 	                 goodsName:goodsNames             	
                });   //点击搜索
            }); 
            
/*             	  //多条件查询
	   $('#search').searchbox({ 
		searcher:function(value,name){ 
			 
			$('#dg').datagrid('load',{
	//		keyWord: '%'+value+'%'//单条件查询
			boId:'%'+$("#boId").val()+'%',
	        goodsName:'%'+$("#goodsName").val()+'%'  
		}); 
		
		
		},  
		
		prompt:'请输入值' 
		}); */
	   	 
	 });
/*         //将表单数据转为json
        function form2Json(id) {
 
            var arr = $("#" + id).serializeArray();
            alert(arr+"arr");
            var jsonStr = "";
 
            jsonStr += '{'
            for (var i = 0; i < arr.length; i++) {
            	if(arr[i].value==""){
                	arr[i].value='%%';
                }
                jsonStr += '"' + arr[i].name + '":"' + arr[i].value + '",'
                
                alert(arr[i].name+"----"+arr[i].value);
                alert(jsonStr+"jsonStr");
            }
            jsonStr = jsonStr.substring(0, (jsonStr.length - 1));
            jsonStr += '}'
 
            var json = JSON.parse(jsonStr);
            alert(json+"json")
            return json;
        }; */
	 	
/* 	 	 $('#goodsUnit').searchbox({ 
		searcher:function(value,name){ 
		alert(value + "," + name);
		alert($("#goodsName").val()+","+name);
		$('#dg').datagrid('load',{
			goodsName: '%'+$("#goodsName").val()+'%',
			goodsUnit: '%'+value+'%'
		});
	  */

</script>  	
  </head> 
  <body>	
	<form action="" name="form1" id="form1" method="post">
		<br>请填写采购信息：<br>
		采购单号：<input type='text' id='boId' name='boId' />
		商品名称：<input type='text' id='goodsName' name='goodsName'/>
		<input type='button' value='采购搜索' id="search" />
	</form> 
	
	<table id="dg"></table> 
	

</body>
</html>
