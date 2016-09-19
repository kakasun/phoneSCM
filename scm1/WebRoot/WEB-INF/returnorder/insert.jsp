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
	 	var editIndex = undefined;
	 	
	 	$('#dg').datagrid({    
  	 //	 url:'${proPath}/goods/selectAll.action', //单条件查询
  	// 	 url:'${proPath}/goods/selectPageListUseDyc.action',
	
  	 	 nowrap:true,
  	 	 rownumbers:true,
/*   	 	 pageNumber:1,
  	 	 pageSize:2,
  	 	 pageList:[2,4,9],
 	 	 pagination:true, */
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
				text:"选择退货商品",
				handler: function(){
				alert('选择退货商品');
				parent.$('#win').window({  
					title:"选择需要退货的商品",
				    width:600,   
				    height:400,    
				    modal:true ,
				    content:"<iframe src='${proPath}/base/goURL/goods/roselect.action' height='100%' width='100%' frameborder='0px' ></iframe>"   
				}); 
				
				}
			},'-',{
				iconCls: 'icon-remove',
				text:"删除",
				handler: function(){
				alert('删除按钮');
				
				var array = $('#dg').datagrid('getSelections');
				alert('haha');
				alert(array.length);
				if(array.length == 0 ){
					alert("请选择行");
					return false;
				}	
				//parent把整个屏幕都锁住
				parent.$.messager.confirm('删除对话框','你确认要删除吗？',function(r){
					if(r){
						alert(r);
						alert(array.length);
						
						for(var i=array.length-1; i>=0;i--){
							alert('进入for，准备删除');
							var rowIndex = $('#dg').datagrid('getRowIndex',array[i].goodsId);
							alert(rowIndex);
							
							
							
							//设置应付的多少钱
							var  a = $("#boPayable").val();
							var value = array[i].bodTotalPrice;
							alert("a的值是"+a);//a为字符串
							
							alert("value的值是"+value);
							a = parseInt(a);//转为了数字了
							alert("parseInt(a)的值是"+a);
					//		alert(a+1);
							var b = parseInt(value);//b的值为数字
							
							var c = a-b;
							alert("c的值是"+c);
							$("#boPayable").val(c.toString());
							
							$('#dg').datagrid('deleteRow',rowIndex);
						}
				}	
			});
			}
			},'-',{
				iconCls: 'icon-ok',
				text:"提交退货",
				handler: function(){
				alert('提交退货');
				//获取buyOrderDetail的数据（返回当前页的所有行。）
				var data = $('#dg').datagrid('getData');
				var rows = $("#dg").datagrid("getRows");
				console.info(data);
				
				if(data.rows.length == 0){
					alert("请选择商品吧");
				}
				//把对象转成JSON格式的字符串
				rows =JSON.stringify(rows);
				console.info(rows);
				 $('#ff').form('submit', {    
				    url:'${proPath}/returnOrder/insert.action',    
				    onSubmit: function(param){    
				        param.rows = rows;    
				           return true;
				    }, 
				     success:function(data){    
				        alert(data);  
				    }   
				}); 
			//	$('#ff').submit(); 
				}
			}],
			 	    
   		 columns:[[    
	        {field:'goodsId',title:'商品编号',width:100,checkbox:true},    
	        {field:'goodsName',title:'商品名称',width:100},    
	        {field:'goodsUnit',title:'商品单位',width:100,align:'right'},
	        {field:'goodsType',title:'商品类型',width:100},
	        {field:'goodsColor',title:'商品颜色',width:100},
	        {field:'rodAmount',title:'数量',width:100,editor:'numberbox'},
	        {field:'rodReturnPrice',title:'退货单价',width:100,editor:{type:'numberbox',options:{precision:3}}
	        },
	        {field:'rodTotalPrice',title:'退货总价',width:100,editor:{type:'numberbox',options:{precision:3}}
        	},
	        {field:'rodImeiList',title:'手机串号列表',width:100,editor:'textarea'}
	    
	   	]],
	   	//cloumn的field用editor:{type:'',options:''}来定义
	   	    onDblClickCell:function(index,field,value){
	   	    	//结束编辑行, 可以不用，不会被调用，将在单击事件处理
				if(editIndex != undefined){							
					//alert(" onDblClickCell editIndex != undefined");			
				  $(this).datagrid('endEdit', editIndex);
					editIndex = undefined;
				}
	   	    	//alert("dbclick");		
				//设置可编辑行	
				$(this).datagrid('beginEdit', index);
				editIndex = index;
				//alert("dbclick");				
				var ed = $(this).datagrid('getEditor', {index:index,field:field});
				//alert("field||index:"+field+index);				
				$(ed.target).focus();
			   	    
			},
			onClickCell: function(index,field,value){
			//	alert("1");
				if(editIndex!= undefined){					
					alert("2");
				  //计算总价
				  var amount = $(this).datagrid('getEditor', {index:editIndex,field:"rodAmount"});
				  alert("3"); 
				  var returnPrice=$(this).datagrid('getEditor', {index:editIndex,field:"rodReturnPrice"});
				  alert("4");
				  var totalPrice =$(returnPrice.target).numberbox('getValue')*$(amount.target).numberbox('getValue');
				  alert("5");
				  //alert("bodTotalPrice"+bodTotalPrice);
				  var ed = $(this).datagrid('getEditor', {index:editIndex,field:"rodTotalPrice"});
				  alert("6");
				  //alert(" onClickCell editIndex != undefined3");	
				  $(ed.target).numberbox('setValue', totalPrice);
				  //alert(" onClickCell editIndex != undefined4");	
				  alert("7");
				  //结束编辑行
				  $(this).datagrid('endEdit', editIndex);
				  alert("8");
				  editIndex = undefined;
				  alert("10");
				}				
			}
	  });
	  //供应商的搜索框
	  $('#supName').searchbox({ 
		searcher:function(value,name){ 	
		parent.$('#win').window({  
						title:'选择供应商',  
					    width:600,   
					    height:400,    
					    modal:true ,
					    content:"<iframe src='${proPath}/base/goURL/supplier/roselect.action' height='100%' width='100%' frameborder='0px' ></iframe>"   
					});	
		}, 
//	  	disabled:true,
		prompt:'请选择供应商'
		
		}); 
		
		//禁用供应商信息的输入
		var box = $('#supName').searchbox('textbox');//获取控件文本框对象
   	    box.attr('disabled',true);//禁用输入
   	    
   	    //表单禁用验证
   	   //$("#ff").form("disableValidation");
   	   
   	   //下拉框中的仓库
//		 data:'${proPath}/storeHouse/selectAll.action',
		/* $.ajax({  
		   type: "POST",  
		   url: "${proPath}/storeHouse/selectAll.action",  
		   dataType:"json",  
		   success: function(json){  
		     $("#shId").combobox({  
		        data:json.rows,  
		        valueField:'shId',  
		        textField:'shName'  
		    });  
		   }  
		 }); */ 
		
	 	//禁用应付信息的输入
		$('#boPayable').attr('disabled',true);//禁用输入
		
		
		$('#pp').numberbox({  
			value:5,  
		    min:0,    
		    precision:2    
		}); 
		

		
	 
	 });

	 

</script>

  
  </head>
  
  <body>
	
	
	<form action="" id="ff">
		请填写退货信息：<br>
		供应商:<input type="hidden" id="supId" name="supId"/>
		<input type="text" id="supName" name="supName" />
		仓库：<!-- <input type="text" id="shId" name="shId"  /> -->
			<select>
				<c:forEach items="${applicationScope.sysParam.shId }" var="shId">
					<option value="${ shId.key}">${shId.value }</option>
				</c:forEach>
			</select>
		退货日期：<input type="text" id="roDate"
							 class="easyui-datebox" name="roDate" required="required"/>
		应退金额：<input type="text" id="roPayable" name="roPayable"/><br>
		实退金额 :<input type="text" id="roPaid" name="boPaid"/>
<!-- 		欠款：<input type="text" id="roArrears" name="roArrears"/>
		原始单号：<input type="text" id="boOriginal" name="boOriginal"/>    -->
		经手人：<input type="text" id="roAttn" name="roAttn"/><br>
		操作员：<input type="text" id="roOperator" name="roOperator"/>
		备注：<input type="text" id="roRemark" name="roRemark"/>
	</form>
	<table id="dg"></table> 
	

</body>
</html>
