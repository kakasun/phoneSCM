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
			<label for="shId">商品编号:</label> <input type="text" name="shId" />
		</div>
		<div>
			<label for="shName">商品名称:</label> <input type="text" name="shName" />
		</div>
		<div>
			<label for="shResponsible">商品单元:</label> <input type="text"
				name="shResponsible" />
		</div>
		<div>
			<label for="shPhone">商品类型:</label> <input type="text"
				name="shPhone" />
		</div>
		<div>
			<label for="shAddress">商品限制:</label> <input type="text"
				name="shAddress" />
		</div>
		<div>
			<label for="shType">仓库:</label> 
			<select id="cc" class="easyui-combobox" name="shType" style="width:200px;">
				<c:forEach items="${applicationScope.sysParam.shId }" var="shType">
					<option value="${shType.key}">${shType.value}</option>
				</c:forEach>
			
			</select>
		</div>
		
		<div>
			<label for="shRemark">佣金:</label>
			<input type="text"
				name="shRemark" />
	
		</div>
		
		<div>
			<input id="btn" type="button" value="提交" />
		</div>
	</form>
	
	
	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='仓库管理']").get(0).contentWindow;//返回ifram页面文档（window)
		
			$("[name='shName']").validatebox({
				required : true,
				missingMessage : '请填写供应商！'
			});
			$("[name='shType']").validatebox({
				required : true,
				missingMessage : '请填写出联系人！'
			});
			$("[name='shRemark']").validatebox({
				required : true,
				missingMessage : '请填写联系电话！'
			});
			//禁用验证
			$("#ff").form("disableValidation");

			$("#btn").click(function() {
				alert("ddddddddddd");
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					alert("------------");
					$('#ff').form('submit', {
						url : '${proPath}/storeHouse/insert.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {							
								//可以定义为对应消息框
                        	    alert("成功");
                        	    alert(count);
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
