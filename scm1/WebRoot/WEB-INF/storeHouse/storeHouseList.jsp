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
  	// 	 url:'${proPath}/storeHouse/selectAll.action', //单条件
  		 url:'${proPath}/storeHouse/selectPageUseDyc.action', 
  	 	 singleSelect:false,
  	 	 //多页同时记录删除，不会沟了翻页就没了idField:'supId',
  	 	 idField:'shId',
  	 	 selectOnCheck:true,
  	 	 checkOnSelect: true,
  	 	 
  	 	 nowrap:true,
  	 	 rownumbers:true,
  	 	 pageNumber:1,
  	 	 pageSize:2,
  	 	 pageList:[2,4,6],
  	 	 pagination:true,
  	 	 queryParams:{
  	 	 		shName:'%%',
  	 	 		shAddress:'%%'
  	 	 },
  	 	 toolbar: [{
				iconCls: 'icon-add',
				text:"增加",
				handler: function(){
				alert('增加按钮');
				parent.$('#win').window({   
					title:"增加库存", 
					closed:false, 
				    width:600,   
				    height:400,    
				    modal:true ,
				    content:"<iframe src='${proPath}/base/goURL/storeHouse/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"   
				}); 
				
				}
				
				
			},'-',{
				iconCls: 'icon-remove',
				text:"删除",
				handler: function(){
				alert('删除按钮');
				var array = $('#dg').datagrid('getSelections');
				if(array.length > 0 ){
					alert(array.length);
					var ids = new Array();
					for(var i=0; i<array.length;i++){
						ids[i] = array[i].shId;
						alert(ids[i]);
					}
					//parent把整个屏幕都锁住
					parent.$.messager.confirm('删除对话框','你确认要删除吗？',function(r){
						if(r){
							alert(r+"我是r");
							$.ajax({
								url:"${proPath}/storeHouse/deleteList.action",
								type:"post",
								data:{pks:ids},
								//设置为传统方式传送参数
								traditional:true,
								
								success: function(data){
									alert(data);
									//重载页面
									$("#dg").datagrid("reload");
									//清除所有勾选的行idField:'supId',
									$("#dg").datagrid("clearSelections");	
															
								},
								error:function(XMLHttpRequest,textStatus,errorThrown){
									$.messager.alert('删除错误','请联系管理员','error');
								},
								dataType:"json"
							});
						}
					
					
					});
				}else{
					alert("请选择行");
				}
				
				}
			},'-',{
				iconCls: 'icon-edit',
				text:"编辑",
				handler: function(){
				alert('编辑按钮');
				var array = $('#dg').datagrid('getSelections');
				if(array.length ==1){
					parent.$('#win').window({    
					    width:600,   
					    height:400,    
					    modal:true ,
					    content:"<iframe src='${proPath}/base/goURL/storeHouse/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"   
					});
				}else{
					$.messager.show({
						title:'操作提示',
						msg:'请选择一条信息操作  ',
						timeout:5000,
						showType:'slide'
					});
					
				
				}
				
				}
			},'-',{
				iconCls: 'icon-help',
				text:"帮助",
				handler: function(){alert('帮助按钮');}
				
			},'-',{
					text:"<input type='text' id='shName' name='shName'/>",					
				},'-',{
					text:"<input type='text' id='shAddress' name='shAddress'/>",					
				}],
			
  	 	    
   		 columns:[[    
	        {field:'shId',title:'仓库编号',width:100,checkbox:true},    
	        {field:'shName',title:'仓库名字',width:100},    
	        {field:'shResponsible',title:'仓库责任',width:100,align:'right'},
	        {field:'shPhone',title:'仓库电话',width:100},
	        {field:'shAddress',title:'仓库地址',width:100},
	        {field:'shRemark',title:'备注',width:100},
	        {field:'shType',title:'仓库类型',width:100}  
	   	]]    
	  });
	  
	  $('#shAddress').searchbox({ 
		searcher:function(value,name){ 
		alert(value + "," + name);
		$('#dg').datagrid('load',{
			shName:'%'+$('#shName').val()+'%',
			shAddress:'%'+value+'%'
		
		
		});
		}, 
		
		prompt:'Please Input Value' 
		}); 
	 
	 
	 });
	 

</script>

  
  </head>
  
  <body>
	<table id="dg"></table> 
  </body>
</html>
