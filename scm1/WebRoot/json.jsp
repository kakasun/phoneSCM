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
  		$(
	  		function(){
	  			$("#p").click(
	  				function(){
		  				$.ajax({
							
							url:"supplier/ajax.action",
							data:{supName:"name1001"},
							type:"post",
							dataType:"json",
							success:function(data){
								alert(data.supName);
							
							},
							error:function(){alert("获取被投诉人列表失败");}
						});
		  			}
	  			);	  			
	  		}
  		);

  		
  	
  	
	
	</script>
  
  </head>
  
  <body>
<button id="p">测试json</button>
  </body>
</html>
