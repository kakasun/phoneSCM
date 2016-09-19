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
  	 	 singleSelect:false,
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
				iconCls: 'icon-add',
				text:"增加",
				handler: function(){
				alert('增加按钮');
				
				parent.$('#win').window({ 
					title:"增加供应商",   
				    width:600,   
				    height:400,    
				    modal:true ,
				    content:"<iframe src='${proPath}/base/goURL/supplier/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"   
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
					for(var i=0; i<array.length;i ++){
						ids[i] = array[i].supId;
						alert(ids[i]);
					}
					//parent把整个屏幕都锁住
					parent.$.messager.confirm('删除对话框','你确认要删除吗？',function(r){
						if(r){
							alert(r+"我是r");
							$.ajax({
								url:"${proPath}/supplier/deleteList.action",
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
					    content:"<iframe src='${proPath}/base/goURL/supplier/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"   
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
				handler: function(){alert('帮助按钮');},
				
			}/* ,'-',{
					text:"商品名称<input type='text' id='supName' name='supName'/>",					
				},'-',{
					text:"商品地址<input type='text' id='supAddress' name='supAddress'/>",					
				} */],
			
  	 	    
   		 columns:[[    
   		 	
	        {field:'supId',title:'供应商号',width:100,checkbox:true},    
	        {field:'supName',title:'供应商名字',width:100},    
	        {field:'supLinkman',title:'联系人',width:100,align:'right'},
	        {field:'supType',title:'供应商类型',width:100,
		        	formatter: function(value,row,index){
						var str = "${applicationScope.sysParam.supType}";
						//alert(a);
						str= str.substring(1, str.length-1);
						//alert(a);
						var arrays= str.split(",");
						for(i=0;i<arrays.length-1;i++){
							//alert(arrays[i]);
							var array = arrays[i].split("=");
							if($.trim(value)==$.trim(array[0])){
								return array[1];
							}
						}
						return value;
					}
	        	
	        },
	        {field:'supPhone',title:'电话',width:100},
	        {field:'supAddress',title:'地址',width:100},
	        {field:'supRemark',title:'备注',width:100},
	        {field:'supPay',title:'支付',width:100}  
	   	]]    
	  });
	  
	  //多条件查询
	   $('#search').searchbox({ 
		searcher:function(value,name){ 
			alert(value + "," + name);
			alert("supName:"+$('#supName').val());
			$('#dg').datagrid('load',{
	//		keyWord: '%'+value+'%'//单条件查询
			supName:'%'+$('#supName').val()+'%',
			supAddress:'%'+$('#supAddress').val()+'%'
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
  
  <form action="" name="form1" id="form1" method="post">
		<br>请填写采购信息：<br>
		采购单号：<input type='text' id='supName' name='supName' />
		商品名称：<input type='text' id='supAddress' name='supAddress'/>
		<input type='submit' value='采购搜索' id="search"/>
	</form>
	<table id="dg"></table> 
  </body>
</html>
