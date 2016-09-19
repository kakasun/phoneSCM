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
  
  
<script type="text/javascript">
	 $(function(){
	 	$('#dg').datagrid({    
  	// 	 url:'${proPath}/supplier/selectByPage.action', //一个条件查询
  		 url:'${proPath}/supplier/selectPageUseDyc.action',//两个条件查询
  	 	 singleSelect:true,
  	 	 //多页同时记录删除，不会沟了翻页就没了idField:'supId',
  	 	 idField:'supId',
  	 	 nowrap:true,
  	 	 selectOnCheck:true,
  	 	 checkOnSelect: true,
  	 	 rownumbers:true,
  	 	 fitColumns:true,
  	 	 pageSize:2,
  	 	 pageList:[2,5,10,20],
  	 	 pagination:true,
  	 	 queryParams: {
				supName: '%%',
				supAddress:'%%'

				
		 },
  	 	 
  	 	 toolbar: [{
				iconCls: 'icon-ok',
				text:"选择供应商",
				handler: function(){
				alert('选择按钮');
				
				var win = parent.$("iframe[title='商品退货']").get(0).contentWindow;
				
				var rows = $('#dg').datagrid('getSelected');
				alert(rows.supName);
				if(rows == null || rows.length == 0){
					alert("请选择一个供应商");
				}
				win.$("#ff").form('load',{
					supId:rows.supId,
					supName:rows.supName
				
				});
				//回到主页win把窗口关了
				parent.$("#win").window("close");
				
				}
			},'-',{
					text:"商品名称<input type='text' id='supName' name='supName'/>",					
				},'-',{
					text:"商品地址<input type='text' id='supAddress' name='supAddress'/>",					
				}],
			
  	 	    
   		 columns:[[    
   		 	
	        {field:'supId',title:'供应商号',width:100,checkbox:true},    
	        {field:'supName',title:'供应商名字',width:100},    
	        {field:'supLinkman',title:'联系人',width:100,align:'right'},
	        {field:'supType',title:'供应商类型',width:100},
	        {field:'supPhone',title:'电话',width:100},
	        {field:'supAddress',title:'地址',width:100},
	        {field:'supRemark',title:'备注',width:100},
	        {field:'supPay',title:'支付',width:100}  
	   	]]    
	  });
	  
	  //多条件查询
	   $('#supAddress').searchbox({ 
		searcher:function(value,name){ 
			alert(value + "," + name);
			alert("supName:"+$('#supName').val());
			$('#dg').datagrid('load',{
	//		keyWord: '%'+value+'%'//单条件查询
			supName:'%'+$('#supName').val()+'%',
			supAddress:'%'+value+'%'
		}); 
		
		
		},  
		
		prompt:'请输入值' 
		});
		
		$('#supName').box({   
		
		prompt:'请输入值' 
		});
	  //单条件查询
/* 	  $('#ss').searchbox({ 
		searcher:function(value,name){ 
			alert(value + "," + name);
			$('#dg').datagrid('load',{
	//		keyWord: '%'+value+'%'//单条件查询
			keyWord:'%'+value+'%'
		}); 
		
		
		},  
		
		prompt:'Please Input Value' 
		}); 
		*/
		

		
	 
	 
	 });
	 

</script>

  
  </head>
  
  <body>
	<table id="dg"></table> 
  </body>
</html>
