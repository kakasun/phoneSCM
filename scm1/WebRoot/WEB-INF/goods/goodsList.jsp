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
  	 //	 url:'${proPath}/goods/selectAll.action', //单条件查询  selectByPage
  	 	 url:'${proPath}/goods/selectPageListUseDyc.action',
  	 //	 url:'${proPath}/goods/selectByGoodsName.action',
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
				iconCls: 'icon-add',
				text:"增加",
				handler: function(){
				alert('增加按钮');
				parent.$('#win').window({    
				    title:'增加商品',
				    width:600,   
				    height:400,    
				    modal:true,
				    content:"<iframe src='${proPath}/base/goURL/goods/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"   
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
						ids[i] = array[i].goodsId;
						alert(ids[i]);
					}
					//parent把整个屏幕都锁住
					parent.$.messager.confirm('删除对话框','你确认要删除吗？',function(r){
						if(r){
							alert(r);
							$.ajax({
								url:"${proPath}/goods/deleteList.action",
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
					    content:"<iframe src='${proPath}/base/goURL/goods/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"   
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
				handler: function(){alert('帮助按钮')},
				
			},'-',{
					text:"商品名称<input type='text' id='goodsName' name='goodsName'/>",					
			},'-',{
					text:"商品单位<input type='text' id='goodsUnit' name='goodsUnit'/>",					
				} 
			
			],
  	 	    
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
			goodsUnit: '%'+value+'%',
		//	keyWord:$("#keyWord").val()
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
