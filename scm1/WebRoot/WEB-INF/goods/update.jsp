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

    

  </head>
  
  <body>

    
     
    <form id="ff" method="post">
	   <div>
			<label for="goodsId">商品编号:</label> <input type="text" name="goodsId" />
		</div>
		<div>
			<label for="goodsName">商品名称:</label> <input type="text" name="goodsName" />
		</div>
		<div>
			<label for="goodsUnit">商品单元:</label> <input type="text"
				name="goodsUnit" />
		</div>
		<div>
			<label for="goodsType">商品类型:</label> <input type="text"
				name="goodsType" />
		</div>
		<div>
			<label for="goodsLimit">商品限制:</label> <input type="text"
				name="goodsLimit" />
		</div>
		<div>
			<label for="goodsStore">仓库:</label> <input type="text"
				name="goodsStore" />
		</div>
		<div>
			<label for="goodsColor">商品颜色：</label> 									
				<select id="cc" class="easyui-combobox" name="goodsColor" style="width:200px;">   
					<c:forEach items="${applicationScope.sysParam.goodsColor}" var="goodsColor">
					    <option value="${goodsColor.key}">${goodsColor.value}</option>   
					</c:forEach>   
				</select>  
		</div>
		<div>
			<label for="goodsCommission">佣金:</label>
			<input type="text"
				name="goodsCommission" />
	
		</div>
		<div>
			<label for="goodsProducer">商品制作人:</label>
			<input type="text"
				name="goodsProducer" />
			
		</div>
		<div>
			<label for="goodsRemark">备注:</label>
			<textarea name="goodsRemark"></textarea>
		</div>
		<div>
			<label for="goodsSelPrice">卖的价钱:</label>
			<input type="text"
				name="goodsSelPrice" />
		
		</div>
		<div>
			<label for="goodsBuyPrice">买的价钱:</label>
			<input type="text"
				name="goodsBuyPrice" />
			
		</div>
		<div>
			<input id="btn" type="button" value="提交" />
		</div>
	</form>
	
	
	<script type="text/javascript">
		$(function() {
			
			var win = parent.$("iframe[title='商品管理']").get(0).contentWindow;//返回ifram页面文档（window)
			//拿到对象
			var array = win.$('#dg').datagrid('getSelections');
			alert(array[0].goodsId);
			
			//回显
			$('#ff').form('load',{
				goodsId:array[0].goodsId,
				goodsName:array[0].goodsName,
				goodsUnit:array[0].goodsUnit,
				goodsType:array[0].goodsType,
				goodsColor:array[0].goodsColor,
				goodsStore:array[0].goodsStore,
				goodsLimit:array[0].goodsLimit,
				goodsCommission:array[0].goodsCommission,
				goodsProducer:array[0].goodsProducer,
				goodsRemark:array[0].goodsRemark,
				goodsSelPrice:array[0].goodsSelPrice,
				goodsBuyPrice:array[0].goodsBuyPrice
				
			}); 
			
			$("[name='goodsName']").validatebox({
				required : true,
				missingMessage : '请填写供应商！'
			});
			$("[name='goodsUnit']").validatebox({
				required : true,
				missingMessage : '请填写出联系人！'
			});
			$("[name='goodsStore']").validatebox({
				required : true,
				missingMessage : '请填写联系电话！'
			});
			//禁用验证
		//	$("#ff").form("disableValidation");

			$("#btn").click(function() {
				alert("ddddddddddd");
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					alert("------------");
					$('#ff').form('submit', {
						url : '${proPath}/goods/updateByPk.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {							
								//可以定义为对应消息框
                        	    alert("成功");
								parent.$("#win").window("close");
								win.$("#dg").datagrid("reload");							
						}
					});

				}

			});

		});
	</script>
	
    
  </body>
</html>
