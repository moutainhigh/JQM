<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/common.jsp" %>
<!-- 
  - Author(s): 吴艳飞
  - Date: 2016-09-03 14:04:50
  - Description: 上交所固收平台
-->
<head>
	<title>上交所固收平台</title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <style type="text/css">
    	.mini-buttonedit-border{
    		padding-right:1px;
    	}
    </style>
</head>
<body>
	<!-- 查询条件开始 -->
	<div class="search-condition">
		<div class="list">
			<div id="bank_between_instruct_condition" class="nui-form" style="padding:2px;height:10%;" align="left">
				<input class="nui-hidden"  name="vcMarket" value="SS" id="vcMarket"/>
				<input class="nui-hidden"  name="vcBusinType" value="4" id="vcBusinType"/>
				<input class="nui-hidden"  name="businClass" value="I" id="businClass"/>
				<input class="nui-hidden"  name="vcInvestType" value="1" id="vcInvestType"/>
				<input class="nui-hidden"  name="vcMarketNo" value="1" id="vcMarketNo"/>
				<table border="0" cellpadding="1" cellspacing="1" style="width:100%;table-layout:fixed;">
					<tr>
						<td width="60px" align="right">产品名称:</td>
						<td align="left">
                        <div name="vcFundCode" class="mini-autocomplete" pinyinField="ID" id="vcFundCode"
		                             textField="TEXT" valueField="ID"
		                             searchField="productCode"
		                             url="com.cjhxfund.commonUtil.applyInstUtil.QueryTAtsProductInfoMatchSort.biz.ext"
		                             showNullItem="false"
		                             style="width:95%;"
		                             allowInput="true"
		                             emptyText="请输入产品代码或产品名称..."
		                             nullItemText="请输入产品代码或产品名称..."
		                             valueFromSelect="true"
		                             showClose="true"
		                             onvaluechanged="selectFund"
		                             oncloseclick="onCloseClick"
		                             popupWidth="300"
		                             required="true">
		                            <div property="columns">
		                                <div header="产品代码" field="ID" width="40px"></div>
		                                <div header="产品名称" field="TEXT"></div>
		                            </div>
		                        </div>
		                        
						<td width="100px" align="right">组合:</td>
						<td align="left">
							<input name="vcCombiNo" class="nui-combobox" id="vcCombiNo"
                                   textField="TEXT" valueField="ID"
                                   dataField="data"
                                   url="com.cjhxfund.commonUtil.applyInstUtil.queryCombiInfo.biz.ext"
                                   showNullItem="false"
                                   allowInput="false"
                                   emptyText="全部"
                                   nullItemText="全部"
                                   showClose="true"
                                   oncloseclick="onCloseClick"
                                   style="width:283px"/>
                                   
						</td>
						<td></td>
					</tr>
					<tr>
						<td width="60px" align="right">债项评级:</td>
						<td align="left">
							<input class="nui-dictcombobox"
		                                   id="vcBondAppraise"
		                                   name="vcBondAppraise"
		                                   multiSelect="true"
		                                   valueField="dictName"
		                                   textField="dictName"
		                                   dictTypeId="CF_JY_PRODUCT_PROCESS_SUBJECT_RATING"
		                                   emptyText="全部"
		                                   showClose="true"
		                                   allowInput="false"
		                                   oncloseclick="onCloseClick"
		                                   style="width:95%"/>
						</td>
						<td width="100px" align="right">剩余期限(年):</td>
						<td align="left">
							<input class="nui-textbox" name="minLimiteLeft" id="minLimiteLeft"  vtype="float"  onvalidation="numberCheck" requiredErrorText="必须是整数" style="width:45%;"/>
							<span style="width:5%;">-</span>
							<input class="nui-textbox" name="maxLimiteLeft" id="maxLimiteLeft" vtype="float"  onvalidation="numberCheck" requiredErrorText="必须是整数" style="width:45%;" />
						</td>
						 <td align="left">
                            <input class="nui-button" text="查询" iconCls="icon-search" onclick="search()"/>
                            <a class="nui-button" iconCls="icon-reset" onclick="reset()">重置</a>
                        </td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<%-- 查询条件结束!!! --%>
	<div  class="nui-fit">
		<%-- 列表开始... --%>
	<div id="datagrid_tbond_trade" 
			dataField="dealPosition"
			url="com.cjhxfund.ats.sm.comm.TBondBaseInfoManager.queryPositionsBonds.biz.ext" 
			showTreeLines="true" multiSelect="true"
			class="nui-datagrid" 
			style="width:100%;height:100%;"
			idField="id"
			pageSize="10"
			sizeList="[10,30,50,100]" 
			showPageInfo="true"
			multiSelect="true"
			allowSortColumn="true"
			frozenStartColumn="0"
			frozenEndColumn="2"
			sortMode="client"
	 		allowSortColumn="true"
			enableHotTrack="false">
		<div property="columns" >
			<div name="action" width="100" headerAlign="center" >操作</div>
			<div field="vcFundName"  headerAlign="center"  align="left"  width="85px">
				产品名称
			</div>
			<div field="vcCombiName"  headerAlign="center"  align="left"  width="85px">
				组合名称
			</div>
			<div field="vcStockCode" headerAlign="center" align="left" width="85px">
				债券代码
			</div>
			<div field="vcStockName" headerAlign="center" align="left" width="85px">
				债券简称
			</div>
			<div field="lCurrentAmount" headerAlign="center" align="right" width="85px" allowSort="true" numberFormat="n0" >
				持仓数量
			</div>
			<div field="vcAvailablequantityT0" headerAlign="center" align="right" width="85px" allowSort="true" dataType="int" decimalPlaces="0" numberFormat="n0">
				T+0可卖数量
			</div>
			<div field="vcAvailablequantityT1" headerAlign="center" align="right" width="85px" allowSort="true" dataType="int" decimalPlaces="0" numberFormat="n0">
				T+1可卖数量
			</div>
			<div field="cnSell" headerAlign="center" align="center" numberFormat="n0" renderer="cnSellRD" >
				锁定数量
			</div>
			<div field="vcBondAppraise" headerAlign="center" align="center" width="85px" allowSort="true" renderer="renderBondAppraise">
				债项评级
			</div>
			<div field="vcIssueAppraise" headerAlign="center" align="center" width="85px" allowSort="true" renderer="renderIssueAppraise">
				主体评级
			</div>
			<div field="lLimiteLeft" headerAlign="center" align="center" width="85px" allowSort="true">
				剩余期限
			</div>
			<div field="enBondAsset" headerAlign="center" align="right" width="85px" numberFormat="#,0.00" >
				市值(元)
			</div>
			<div field="positionRatio" headerAlign="center" align="center" width="85px">
				市值占净值比(%)
			</div>
		</div>
	</div>
	<%-- 列表结束... --%>
	</div>

	<script type="text/javascript">
    	nui.parse();
    	var commandInformation = null;
    	var tabDealRole = new nui.Form("#bank_between_instruct_condition");
		var conditionForm = nui.get("datagrid_tbond_trade");
        
    	function clicksearch(e,text){
    	var positionInfo = {};
	    				if(e){//点买入或卖出的传参
	    					positionInfo = conditionForm.getRow(parseInt(e)); 
	    					if(text == "sell" ){									//判断客户是点的卖出还是卖出 sell：卖出 否则为买入
		    					positionInfo["vcEntrustDirection"] = "4";//添加指令/建议下达的委托方向字段
	    					}else{
	    						positionInfo["vcEntrustDirection"] = "3";
	    					}
	    					positionInfo["vcProductCode"] = positionInfo["vcFundCode"]; //产品代码
	    					positionInfo["vcProductName"] = positionInfo["vcFundName"]; //产品名称
	    					positionInfo["vcCombiCode"] = positionInfo["vcCombiNo"]; //组合代码
	    				}
	    				positionInfo["vcBizType"] = "3"; //业务类别 2：上海大宗 3：上海固收
	    				window.Owner.SetData(positionInfo);
	    					window.CloseOwnerWindow();
    	}
    	function SetSearchField(data){
    		var vcFundCode = nui.get('vcFundCode');
    		var vcCombiNo = nui.get('vcCombiNo');
    		vcFundCode.setValue(data.vcProductCode);
    		vcFundCode.setText(data.vcProductCodeText);
    		vcCombiNo.setValue(data.vcCombiCode);
    		vcCombiNo.setText(data.vcCombiCodeText);
    		search();
    	}
        $(function(){
        	//初始化改变债券代码选择提示语句
    	$("#vcStockCode > span > input").attr("placeholder","全部");
		})
		         //重置功能
         function reset(){
                tabDealRole.reset();
          }
    </script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/inquiry/inquiryResultManage/inquiryResultEntering/transaction/inquiryInput_zqmm/HoldingPages/js/interbankHolding.js"></script>
</body>
</html>