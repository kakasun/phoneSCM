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
  
  <title>选择页面</title>
<style type="text/css">
.searchbox{
	margin:-3
}
</style>
<script type="text/javascript">
	 $(function(){
	 	$('#dg').datagrid({    
  	 //	 url:'${proPath}/goods/selectAll.action', //单条件查询
  	 	 url:'${proPath}/goods/selectPageListUseDyc.action',
	 	 singleSelect:true,
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
  	 	 queryParams: {
			goodsName: '%%',
			goodsUnit: '%%'
			
		},
  	 	 
  	 	 toolbar: [{
				iconCls: 'icon-ok',
				text:"保存",
				handler: function(){
				alert('保存按钮');
				var row = $("#dg").datagrid('getSelected');
				if(row == null){
					alert("请选择一个商品");
					return false;
				}
				alert(row.goodsId);
				//拿到主矿中的商品采购这个副框
				var win = parent.$("iframe[title='商品采购']").get(0).contentWindow;//返回ifram页面文档（window)
					//在副框中添加行
				win.$('#dg').datagrid('appendRow',{
					goodsId:row.goodsId,
					goodsName:row.goodsName,
					goodsUnit:row.goodsUnit,
					goodsType:row.goodsType,
					goodsColor:row.goodsColor,
					bodAmount:$("#bodAmount").val(),
					bodBuyPrice:$("#bodBuyPrice").val(),
					bodTotalPrice:$("#bodBuyPrice").val()*$("#bodAmount").val(),
					bodImeiList:$("#bodImeiList").val()
				});
				//可以定义为对应消息框
                    alert("成功");
					parent.$("#win").window("close");
				//	win.$("#dg").datagrid("reload");	
			/* parent.$('#win').window({    
				    width:600,   
				    height:400,    
				    modal:true ,
				    content:"<iframe src='${proPath}/base/goURL/goods/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"   
				}); */ 
				
				}
			}],
			
  	 	    
   		 columns:[[    
	        {field:'goodsId',title:'商品编号',width:100,checkbox:true},    
	        {field:'goodsName',title:'商品名称',width:100},    
	        {field:'goodsUnit',title:'商品单元',width:100,align:'right'},
	        {field:'goodsType',title:'商品类型',width:100},
	        {field:'goodsColor',title:'商品颜色',width:100},
	        {field:'goodsStore',title:'仓库',width:100},
	        {field:'goodsLimit',title:'商品限制',width:100},
	        {field:'goodsCommission',title:'佣金',width:100} ,
	        {field:'goodsSelProducer',title:'商品制作人',width:100},
	        {field:'goodsSelRemark',title:'备注',width:100},
	        {field:'goodsSelPrice',title:'卖的价钱',width:100},
	        {field:'goodsBuyPrice',title:'买的价钱',width:100} 
	    
	   	]]    
	  });
	  
	  $('#goodsUnit').searchbox({ 
		searcher:function(value,name){ 
		alert(value + "," + name);
		alert($("#goodsName").val()+","+name);
		$('#dg').datagrid('load',{
			goodsName: '%'+$("#goodsName").val()+'%',
			goodsUnit: '%'+value+'%'
		});

		
		
		
		}, 
		
		prompt:'Please Input Value' 
		}); 
		
		
	 
	 
	 });
	 

</script>

  
  </head>
  
  <body style="margin: 0px">
	<table id="dg"></table> 
	<form action="">
	采购数量：<input type="text" id="bodAmount" name="bodAmount"/>
	价格：<input type="text" id="bodBuyPrice" name="bodBuyPrice"/>
	手机串号：<textarea  id="bodImeiList" name="bodImeiList">333</textarea>
	</form>
  </body>
</html>
