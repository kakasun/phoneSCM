<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/common/common.jspf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>进销存项目</title>
 	<script type="text/javascript">
		var stmnGAP1 = 0; 
		var stmnGAP2 = 96; 
		/* stmnGAP2小时，距离顶部的距离在stmnGAP2与stmnGAP1之间，stmnGAP2为离相对顶部的最小距离，stmnGAP1离相对顶部最大距离，开始时为stmnGAP1，往下滚动，最后会变为stmnGAP2，stmnGAP2比stmnGAP1大时，stmnGAP1不起作用，stmnGAP2为距离相对顶部距离 */
		var stmnBASE = 0; //设定浮动块的初始位置,相对距离
		var stmnActivateSpeed = 200;//启动速度
		var stmnScrollSpeed = 10;//浮动速度
		var stmnTimer;//setTimeout句柄
		
		function RefreshStaticMenu()
		{
		var stmnStartPoint, stmnEndPoint, stmnRefreshTimer;
		stmnStartPoint = parseInt(STATICMENU.style.top, 10);
		stmnEndPoint = document.body.scrollTop + stmnGAP2;
		if (stmnEndPoint < stmnGAP1) 
		stmnEndPoint = stmnGAP1;
		stmnRefreshTimer = stmnActivateSpeed;
		if ( stmnStartPoint != stmnEndPoint ) {
		                stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 );
		                STATICMENU.style.top = parseInt(STATICMENU.style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount );
		                stmnRefreshTimer = stmnScrollSpeed;
		}
		stmnTimer = setTimeout ("RefreshStaticMenu();", stmnRefreshTimer);
		}
		STATICMENU.style.top = document.body.scrollTop + stmnBASE;
		            RefreshStaticMenu();
 	
 	</script>

	
	
	
	<script type="text/javascript">
		$(function(){
			$("a[title]").click(function(){
					var text = this.href;
					//alert(text);
					if($("#tt").tabs("exists",this.title)){
						//alert("haha");
						$("#tt").tabs("select",this.title);
					
					}else{
						// 添加一个未选中状态的选项卡面板
						$("#tt").tabs('add',{
						closable:true,
						title: this.title,
						content:"<iframe src='"+text+"' title='"+this.title+"' height='100%' width='100%' frameborder='0px' allowtransparency='true' ></iframe>"
					});
					}
			return false;
					
			});
		});
		

	</script>
	
	
	
  </head>
  
  <body>
    <body class="easyui-layout">  
    <div data-options="region:'north',title:'进销存管理',split:true" style="height:100px;background:url(${proPath}/image/20160626125046.jpg) ">
    	欢迎你：${sessionScope.account.accLogin }
    	<a target=blank href=tencent://message/?uin=582792737&Site=www.ik38.com&Menu=yes><img border="0" SRC=http://wpa.qq.com/pa?p=1:582792737:3 alt="点击联系"></a>
    	<%-- <img src="${proPath}/image/20160603201650.jpg"></img> --%>
    </div>   
   
    <div data-options="region:'south',title:'进销存管理',split:true" style="height:100px;"></div>   
    
    <div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:100px;"></div>   
    
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:100px;">
     <div id="aa" class="easyui-accordion" style="width:300px;height:200px;">   

    	<div title="基础数据录入">
		<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/supplier/supplierList.action" title="供应商管理"
						style="text-decoration: none;display: block;font-weight:bold;">供应商管理</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/goods/goodsList.action" title="商品管理"
						style="text-decoration: none;display: block;font-weight:bold;">商品管理</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/storeHouse/storeHouseList.action" title="仓库管理"
						style="text-decoration: none;display: block;font-weight:bold;">仓库管理</a>
					</li>
				</ul>
			</div>
		<div title="采购管理">
			<ul style="list-style: none;padding: 0px;margin:0px;">
				<li style="padding: 6px;"><a href="${proPath}/base/goURL/buyorder/insert.action" title="商品采购"
						style="text-decoration: none;display: block;font-weight:bold;">商品采购</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/returnorder/insert.action" title="商品退货"
						style="text-decoration: none;display: block;font-weight:bold;">商品退货</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/buyorder/select.action" title="采购单据查询"
						style="text-decoration: none;display: block;font-weight:bold;">采购单据查询</a>
					</li>	
			</ul>
		</div>
		<div title="库存管理">
			<ul style="list-style:none;padding:0px;margin:0px;">
				<li style="padding:6px;"><a href="${proPath}/base/goURL/stock/select.action"  title="库存查询"
					style="text-decoretion:none;display:block;font-weight:bold;">库存查询</a>	
				</li>
				<li style="padding:6px;"><a href="${proPath}/base/goURL/text/select.action"  title="测试"
					style="text-decoretion:none;display:block;font-weight:bold;">测试</a>	
				</li>
			</ul>
		</div>
		
		
    	</div>
    	
    </div>   
    
    <div data-options="region:'center',title:'主要信息'" style="padding:5px;background:url(${proPath}/image/135353rill90f9mhdlz9fz.jpg)#eee;">
    	<div id="tt" class="easyui-tabs" data-options="fit:'true'" style="width:500px;height:250px;">   
		    <div title="简介" style="padding:20px;display:none;background:url(${proPath}/image/135353rill90f9mhdlz9fz.jpg);  ">   
		        简介    
		    </div>   
   
		</div>  
    
    </div>   
    <div id="win"></div> 
    
    
     <!--浮动QQ客服代码开始 -->
<DIV id=STATICMENU 
     style="Z-INDEX: 999; FILTER:alpha(opacity=90); LEFT: 88%; VISIBILITY: visible; WIDTH: 109px;
      POSITION: absolute; TOP: 100px;">
  <table width="106" border="0" cellspacing="0" cellpadding="0">
      <tr>
      <td colspan="3"  >
      <img src="http://www2.cpooo.com/images/share/qq2/qq_top.gif" width="109" height="34" border="0" 

usemap="#MapForQQ"></td>
      </tr>
      
      <tr>
      <td width="6"   background="http://www2.cpooo.com/images/share/qq2/qq_life.gif" >
      </td>
      
      <td width="96" align="center" bgcolor="#FFFFFF"><TABLE cellSpacing=0 cellPadding=0 width=90 

align=center border=0>
        <TBODY><TR>
            <TD height="39" align="center"><a target="_blank" href="http://wpa.qq.com/msgrd?

v=3&uin=2805285046&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:2805285046:41" alt="点

击这里给我发消息" title="点击这里给我发消息"></a></TD>
          </TR><TR>
            <TD height="39" align="center"><a target="_blank" href="http://wpa.qq.com/msgrd?

v=3&uin=582792737&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:582792737:41" alt="点击

这里给我发消息" title="点击这里给我发消息"></a></TD>
          </TR>
        </TBODY>
      </TABLE></td>
      <td width="7" background="http://www2.cpooo.com/images/share/qq2/qq_right.gif">&nbsp;
      </td>
     </tr>
     
      <tr>
      <td colspan="3">
      <img src="http://www2.cpooo.com/images/share/qq2/qq_logo.gif" width="109" height="17">
      </td>
    </tr>
  </table>
	 <SCRIPT>
	    function  closeQQ(){
	        STATICMENU.style.display="none";
	    }
	  </SCRIPT>
</DIV>
	<map name="MapForQQ" >
	  <area shape="circle" coords="89,17,11" href="javascript:closeQQ();">
	</map>


    
</body>
	
</html>
