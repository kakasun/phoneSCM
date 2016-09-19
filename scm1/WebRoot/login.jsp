<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include  file="/common/common.jspf"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <c:set var="proPath" value="${pageContext.request.contextPath }"/>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	

  </head>

  <body>
   <div id="myLogin" align="center">
  
<form id="ff" method="post" action="account/login.action" style="border-top-width: 40px;padding-top: 300;border-style: 600" >   
    <div>   
        <label for="accLogin">账号:</label>  
        <!-- 行内验证 
        <input class="easyui-validatebox" type="text" name="accLogin" data-options="required:true" />   
    	-->
    	<input type="text" name="accLogin" />
    </div>   
    <div>   
        <label for="accPass">密码:</label>   
        <!-- 行内验证
        <input class="easyui-validatebox" type="text" name="accPass" data-options="validType:'email'" />   
   		-->
   		<input type="text" name="accPass" />
    </div>   
      <div style="color:red" >${sessionScope.msg}</div>
  
</form> 
	</div>  
	<script type="text/javascript">
		$("[name='accLogin']").validatebox({
			required : true,
			missingMessage : '请填写账号！'
		});
		$("[name='accPass']").validatebox({
			required : true,
			missingMessage : '请填写密码！'
		});
		//禁用验证
		$("#ff").form("disableValidation");
	
		$('#myLogin').dialog({    
		    title: '登录页面',    
		    width: 400,    
		    height: 300,    
		    closed: false,    
		    cache: false,     
		    modal: true,
		    resizable: true ,
		    buttons:[{
				text:'登录',
				handler:function(){
					$("#ff").form("enableValidation");
					if($("#ff").form("validate")){
						alert("login");
						$("#ff").submit();
					}
				}
			},{
				text:'取消',
				handler:function(){
					$("#ff").form("rest");
					alert("取消");
				}
			}]
		});    
		
	
	</script>
	
  </body>
  
  
  
</html>
