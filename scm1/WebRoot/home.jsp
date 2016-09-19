<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="common/common.jspf" %>
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
	
	
	
	<script type="text/javascript">
		$(function(){
			$("a[title]").ckick(function(){
					var text = this.title;
					alert(text);
					// 添加一个未选中状态的选项卡面板
					$('#aa').tabs('add',{
						title: text,
						
						
		});
	
			
			});
		
		});
		

	</script>
	
	
	
  </head>
  
  <body>
    <body class="easyui-layout">   
    <div data-options="region:'north',title:'进销存管理',split:true" style="height:100px;">
    	欢迎你：${sessionScope.account.accLogin }
    </div>   
   
    <div data-options="region:'south',title:'进销存管理',split:true" style="height:100px;"></div>   
    
    <div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:100px;"></div>   
    
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:100px;">
     <div id="aa" class="easyui-accordion" style="width:300px;height:200px;">   

    	<div title="基础数据录入">
<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="#" title="供应商管理"
						style="text-decoration: none;display: block;font-weight:bold;">供应商管理</a>
					</li>
					<li style="padding: 6px;"><a href="#" title="商品管理"
						style="text-decoration: none;display: block;font-weight:bold;">商品管理</a>
					</li>
				</ul>
			</div>
		<div title="title3"></div>
    	</div>
    	
    </div>   
    
    <div data-options="region:'center',title:'主要信息'" style="padding:5px;background:#eee;">
    	<div id="tt" class="easyui-tabs" data-options="fit:'true'" style="width:500px;height:250px;">   
	    <div title="Tab1" style="padding:20px;display:none;">   
	        tab1    
	    </div>   
   
</div>  
    
    </div>   
</body>
  </body>
</html>
