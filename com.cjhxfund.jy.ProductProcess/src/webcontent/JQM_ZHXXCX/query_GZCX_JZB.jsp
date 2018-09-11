<%@page import="com.cjhxfund.commonUtil.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/JQMHistory/common/commscripts.jsp" %>
<%@include file="/ProductProcess/zhxxcx/CFJY_zhxxcx_common.jsp" %>
<%
	//获取上一个交易日
	String preDate = DateUtil.getCalculateTradeDay(null, DateUtil.currentDateString(DateUtil.YMD_NUMBER), null, -1);
	//获取上七个交易日
	String pre7Date = DateUtil.getCalculateTradeDay(null, DateUtil.currentDateString(DateUtil.YMD_NUMBER), null, -7);
%>
<%--
- Author(s): huangmizhi
- Date: 2016-03-03 14:35:39
- Description: 综合信息查询（数据取自O32）
--%>
<head>
<title>产品净值表查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link id="css_icon" rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/coframe/org/css/org.css"/>
<script type="text/javascript" src="<%= request.getContextPath() %>/scripts/com.cjhxfund.js.base/utils/DateUtil.js"></script>
</head>
<body style="width:99.6%;height:99.6%;">
<div style="margin:0px 2px 0px 2px;width:100%;height:100%;" >
		   <%--产品净值查询条件开始... --%>
		   <div class="search-condition">
			   <div class="list">
				 <form id="form_CPJZ" method="post">
				 	<%-- 查询用户类型，若是投顾，则过滤产品权限 --%>
				 	<input class="nui-hidden" name="paramObject/queryUserType" value="<%=request.getParameter("queryUserType")%>">
				 	<%-- 查询类型 --%>
				 	<input class="nui-hidden" name="paramObject/queryType" value="CPJZ">
	               <table id="table1" class="table" style="height:100%;table-layout:fixed;">
	                	<tr>
	                		<td class="form_label" width="35px">
								日期:
	                        </td>
	                        <td colspan="1" width="40%">
	                        	从<input id="lDateBegin_CPYHJ" class="nui-datepicker" name="paramObject/lDateBegin" width="100px" required="false"/>
								到<input id="lDateEnd_CPYHJ" class="nui-datepicker" name="paramObject/lDateEnd" width="100px" required="false"/>
	                        </td>
	                        <td class="form_label" width="60px">
								基金名称:
	                        </td>
	                        <td colspan="2" width="30%">
	                            <input id="vcFundCode_CPJZ" class="nui-buttonedit" name="paramObject/vcFundCode" onbuttonclick="ButtonClickGetFundName_CPJZ"/>
	                        </td>
	                        <td colspan="2" width="20%">
	                        	<input class='nui-button' plain='false' text="查询" iconCls="icon-search" onclick="search_CPJZ()"/>
	                        	<input class='nui-button' plain='false' text="重置" iconCls="icon-cancel"  onclick="resetDire_CPJZ()"/>
	                        	&nbsp;
	                            <input id="export_CPJZ" class='nui-button' plain='false' text="导出" iconCls="icon-download" onclick="export_CPJZ()"/>
	                        </td>
	                    </tr>
					</table>
				</form>
			  </div>
		   </div>
		   <%-- 产品净值查询条件结束!!! --%>
             <%-- 产品净值开始... --%>
           <div class="nui-fit">
                <div 
                        id="datagrid_CPJZ"
                        dataField="resultObjectList"
                        class="nui-datagrid"
                        style="width:100%;height:100%;"
                        url="com.cjhxfund.jy.ProductProcess.ZhxxcxUtilBiz.queryZHXX.biz.ext"
                        pageSize="50"
                        showPageInfo="true"
                        allowSortColumn="true"
                        sortMode="client"
                        enableHotTrack="true"
                        sizeList="[10,20,50,100]">

                    <div property="columns">
                        <div type="indexcolumn"></div>
                        <div field="L_DATE" renderer="dateRen" headerAlign="center" allowSort="true" align="center" width="20%">
                           统计日期
                        </div>
                        <div field="VC_FUND_NAME" headerAlign="center" allowSort="true" align="left" width="20%">
                            基金名称
                        </div>
                        <div field="EN_FUND_VALUE" headerAlign="center" allowSort="true" align="right" width="20%">
                           净值
                        </div>
                        <div field="EN_NAV" headerAlign="center" allowSort="true" align="right" width="20%">
                           单位净值
                        </div>
                        <div field="EN_TOTAL_NAV" headerAlign="center" allowSort="true"  align="right" width="20%">
                           累计单位净值
                        </div>
                        <div field="EN_TOTAL_ZC" headerAlign="center" allowSort="true"  align="right" width="20%">
                           总资产
                        </div>
                    </div>
                </div>
            </div>
            <%-- 产品净值结束!!! --%>
</div>

<script type="text/javascript">
    nui.parse();
    var grid_CPJZ = nui.get("datagrid_CPJZ");//产品净值
    var preDate = '<%=preDate%>';//上一个交易日
    var pre7Date = '<%=pre7Date%>';//上七个交易日
    var refreshInt = true;//刚刚打开页面时，投顾默认刷新，交易员默认不刷新
    var queryUserTypeTemp = "<%=request.getParameter("queryUserType")%>";
	if(queryUserTypeTemp!=null && queryUserTypeTemp!="" && queryUserTypeTemp!="null"){
		refreshInt = false;
	}
    nui.get("lDateBegin_CPYHJ").setValue(pre7Date);
	nui.get("lDateEnd_CPYHJ").setValue(preDate);
	
	//系统自动刷新页面--所有业务通用
    function autoRefreshFun(){
    	if(refreshInt==false){
			return;
		}
		search_CPJZ();
    }
    self.setInterval("autoRefreshFun()",60000*5);//设置自动刷新时间默认5分钟
	
	
	<%-- 产品净值查询开始... --%>
	//查询
	function search_CPJZ() {
		search(grid_CPJZ, "#form_CPJZ");
	}
	//获取查询条件的基金名称
	function ButtonClickGetFundName_CPJZ(e){
        ButtonClickGetFundName(this);
	}
	//导出
	function export_CPJZ(){
		exportSubmit("export_CPJZ", "form_CPJZ", "产品净值");
	}
	<%-- 产品净值查询结束!!! --%>
	
	//日期转换
	function dateRen(e){
		if(e.value == 0){
			return "";
		}
		if(e.value){
			return DateUtil.numStrToDateStr(e.value);
		}
		return "";
	}
	
	//时间转换
	function timeRen(e){
		if(e.value == 0){
			return "";
		}
		if(e.value){
			return DateUtil.numStrToTimeStr(e.value);
		}
		return "";
	}
	
	//重置指令/建议信息
	function resetDire_CPJZ(){
		var form = new nui.Form("form_CPJZ");
		form.reset();
	}
	
	
</script>
</body>
</html>