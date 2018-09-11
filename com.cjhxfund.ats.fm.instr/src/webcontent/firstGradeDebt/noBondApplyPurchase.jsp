<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/common/js/commscripts.jsp" %>

<!-- 
  - Author(s):杨敏
  - Date: 2016-07-19 15:18:15
  - Description:这里之前为无债券申购，现在合并为一个
-->
<head>
<title>债券申购</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        
	<script src="<%= request.getContextPath() %>/fm/instr/processUtil/instr.js" type="text/javascript"></script>
	<script	src="<%=request.getContextPath() %>/fm/instr/processUtil/process.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/riskMgr/js/riskMgrComm.js"></script>
	<style type="text/css">
	   .td{
	      border-bottom: 1px solid #D3D3D3;
	   }
	   .form_label label{
	   	color:red;
	   }
	   .form_label{
	   	text-align: right;
	   }
	   #footer {z-index:999; position:fixed; bottom:0; left:0; width:100%; _position:absolute;
 _top: expression_r(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); overflow:visible;
		    } 
		#dataform2 tr{
			border-top:0px;
		}
		    
	</style>
</head>
<body style="width: 100%;height: 100%;overflow: hidden;">
<div id="layout1" class="nui-layout" style="width:100%;height:100%;" >
	<div title="center" region="center"  >
	<div id="dataform1" style="padding-top:5px;">
		<table style="width:100%; table-layout:fixed;" border="0" class="nui-form-table">
			<tr>
			  <td colspan="1" width="18%"  class="form_label">
				<label>*</label>业务日期:
			  </td>
			  <td colspan="1" width="32%">
        	   <input style="width:100%" class="nui-datepicker"  id="bdApplicationTime" name="bizProcess.dApplicationTime" 
			          format="yyyy-MM-dd" required="true" />
			    	 
			    <!-- 存储报量临时数据 -->
			  	<input class="nui-hidden" type="hidden" id="report.enReport" name="report.enReport" value="0" />
			    <!-- 债券代码  债券名称--> 
			    
			    <!-- 证券投资编号 -->
			    <input class="nui-hidden" type="hidden" id="applyInst.lStockInvestNo" name="applyInst.lStockInvestNo" />
			    <!-- 证券投资编号 -->
			    <input class="nui-hidden" type="hidden" id="applyInst.lInvestNo" name="applyInst.lInvestNo" />
			    <!-- 流程业务表 -->
			    <input class="nui-hidden" type="hidden" id="bizProcess.lProcessInstId" name="bizProcess.lProcessInstId" />
			    <input class="nui-hidden" type="hidden" id="bizProcess.lBizId" name="bizProcess.lBizId" />
			  </td>
			  <td colspan="1"  class="form_label" width="18%">
				<label>*</label>投标截止日期:
			  </td>
			  <td colspan="1"  width="32%">
			     <!-- 日期和时间分开显示 -->
			     <input style="width: 98px;"  id="dApplicationDate" onvaluechanged="onTimeValueChanged"  required="true" class="mini-datepicker" showTodayButton="true" format="yyyy-MM-dd"  />
			      <!--<input style="width: 62px;" name="Time" id="dApplicationTime" onvaluechanged="onTimeValueChanged" class="mini-timespinner" format="HH:mm" required="true" />
			     -->
		         <input style="width: 40px;" url="../processUtil/timeHH.txt" class="nui-dictcombobox" required="true"  id="dApplicationTimeHH" onvaluechanged="onTimeValueChanged" />
			                 时
			     <input style="width: 40px;" url="../processUtil/timeMM.txt" class="nui-dictcombobox" required="true" id="dApplicationTimeMM" onvaluechanged="onTimeValueChanged" />
			                 分
			     <!-- 提醒的时间 -->
			     <input class="nui-hidden" type="hidden"    id="bidRemind"  />		   
			   </td>
			</tr>
			<tr>
			<td colspan="1" class="form_label" >
				<label>*</label>产品名称:
			  </td>
			  <td colspan="1">
		  		<input style="width: 100%;" id="productCombo" class="mini-combobox" name="applyInst.vcProductName"  textField="TEXT" valueField="ID" 
		      value="cn" showNullItem="false" required="true" allowInput="true"
		     emptyText="请选择"  onvalidation="onComboValidation" onvaluechanged="onProductChanged"/> 
			  	<input class="nui-hidden" type="hidden" id="vcProductName" name="applyInst.vcProductName"/>
			  	<input class="nui-hidden" type="hidden" id="vcProductCode" name="applyInst.vcProductCode"/>
			  </td>
		      <td colspan="1" class="form_label">
				<label>*</label>组合名称:
			  </td>
			  <td colspan="1">
			  	<input style="width: 100%;" id="combiCombo" class="mini-combobox" name="applyInst.vcCombiNo"  textField="TEXT" valueField="ID"
		     value="cn" showNullItem="false" required="true" allowInput="true"
		   emptyText="请选择" onvalidation="onComboValidation1" /> 
   				<!-- 指令类型-->
			  	<input class="nui-hidden" type="hidden" id="cApplyInstType" name="applyInst.cApplyInstType"/>
			  	<input class="nui-hidden" type="hidden" id="cApplyAuthStatus" name="applyInst.cApplyAuthStatus"/>
			  	<input class="nui-hidden" type="hidden" id="cPaymentAuthStatus" name="applyInst.cPaymentAuthStatus"/>
			  	<!-- 组合信息 -->
			  	<input class="nui-hidden" type="hidden" id="lCombiId" name="applyInst.lCombiId"/>
			  	<input class="nui-hidden" type="hidden" id="vcCombiName" name="applyInst.vcCombiName"/>
			  	<!-- 资产单元 -->
			  	<input class="nui-hidden" type="hidden" id="lAssetId" name="applyInst.lAssetId"/>
			  	<input class="nui-hidden" type="hidden" id="vcAssetNo" name="applyInst.vcAssetNo"/>
			  	<input class="nui-hidden" type="hidden" id="vcAssetName" name="applyInst.vcAssetName"/>
			  	
			  </td>
			  
			</tr>
			<tr>
			  <td colspan="1"  class="form_label">
				债券代码:	 
			  </td>
			  <td colspan="1" >
			  	<input style="width: 100%;" class="nui-textbox" onvaluechanged="onvalidationkCode()" id="applyInst.vcStockCode"  name="applyInst.vcStockCode" />
			  </td>
			  <td colspan="1"  class="form_label">
				<label>*</label>债券简称:	 
			  </td>
			  <td colspan="1" >
			  	<input style="width: 70%;" class="nui-textbox" required="true" id="vcStockName" 
			  	onvaluechanged="onStockNameFull" name="applyInst.vcStockName"   /> 	
			  	<a class='nui-button' plain='false' iconCls="icon-search" onclick="queryOpen()"></a>
			  	<a class='nui-button' plain='false' iconCls="icon-remove" id="cleanStock" onclick="stockIssueInfoClean()"></a>
			  </td>
			</tr>
			<tr>
			  <td colspan="1" class="form_label">
				<label>*</label>登记托管机构:
			  </td>
			  <td colspan="1">
			  	
			  <!-- 交易市场 根据托管机构查询债券，然后带出 -->
			  <input class="nui-hidden" type="hidden" id="applyInst.cMarketNo" name="applyInst.cMarketNo"/>
			  <!-- 登记托管机构 -->
			  <input style="width: 100%;" class="nui-dictcombobox" required="true"  id="applyInst.vcPaymentPlace" onvaluechanged="onMarketValueChanged" name="applyInst.vcPaymentPlace"  dictTypeId="CF_JY_DJTGCS" />
			  </td>
			  <td colspan="1"  class="form_label">
				<label>*</label>债券类别:	 
			    </td>
				<td colspan="1" >
			  	<input style="width: 100%;" id="stockissueinfo.vcStockType" name="stockissueinfo.vcStockType" class="mini-treeselect"  multiSelect="false" 
			        textField="text" valueField="id" parentField="pid" checkRecursive="false" 
			        showFolderCheckBox="true"   expandOnLoad="true" showTreeIcon="false" onbeforenodeselect="beforenodeselect" onvaluechanged="onAccountTypeChanged"
			        popupWidth="200"  required="true" />
			  </td>
			</tr>
			<tr>
			  <td colspan="1"  class="form_label">
				<label id="lIssuerId_lab" style="display:none">*</label>发行主体:	 
			  </td>
			  <td colspan="1" >
			    <!--<input class="nui-dictcombobox" name="stockissueinfo.lIssuerId" allowInput="true"
			     onvalidation="onIssuerId" 
			  	 url="com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadIssueInfo.biz.ext"   emptyText="请选择" textField="TEXT" valueField="ID"  required="true" showNullItem="false"  />
			      	控件内容  开始-->
			     <input id="lookup" style="width: 100%;" name="stockissueinfo.lIssuerId" class="mini-lookup"  
			        textField="vcIssueNameFull" valueField="lIssuerId" popupWidth="auto"  
			        popup="#gridPanel"   onvalidation="onIssuerId" grid="#datagrid1" multiSelect="false"  onclick="onClearClick();onSearchClick()"/>
			     
			     <div id="gridPanel" class="mini-panel" title="header" iconCls="icon-add" style="width:450px;height:250px;" 
			        showToolbar="true" showCloseButton="true" showHeader="false" bodyStyle="padding:0" borderStyle="border:0" >
			        <div property="toolbar" style="padding:5px;padding-left:8px;text-align:center;">   
			            <div style="float:left;padding-bottom:2px;">
			                <span>发行主体：</span>                
			                <input id="keyText" class="mini-textbox" style="width:160px;" onenter="onSearchClick"/>
			                <a class="mini-button" onclick="onSearchClick">查询</a>
			                <a class="mini-button" id="add" iconCls='icon-add' onclick="onAddClick">添加</a>
			                <a class="mini-button" id="cleanLookup1" onclick="cleanLookup1()">清空</a>
			            </div>
			            <div style="float:right;padding-bottom:2px;">
			            </div>
			            <div style="clear:both;"></div>
			        </div>
			        <div id="datagrid1"   class="mini-datagrid" style="width:100%;height:100%;" 
			            borderStyle="border:0" showPageSize="false" showPageIndex="false"
			            url="com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadIssueInfo.biz.ext" onRowdblclick="onCloseClickLookup">
			            <div property="columns" >
			                <div field="vcIssueName" width="80"    headerAlign="center" allowSort="true">简称</div>
				            <div field="vcIssueNameFull" width="120"    headerAlign="center" allowSort="true">全称</div>
			            </div>
			        </div>  
			    </div>
			     <!-- 控件内容  结束-->
			     <input class="nui-hidden" type="hidden" id="vcIssuerName" name="stockissueinfo.vcIssuerName"/>
			     <input class="nui-hidden" type="hidden" id="vcIndustry" name="stockissueinfo.vcIndustry"/>
			     <input class="nui-hidden" type="hidden" id="vcProvince" name="stockissueinfo.vcProvince"/>
			     <input class="nui-hidden" type="hidden" id="vcIssuerNameFull" name="stockissueinfo.vcIssuerNameFull"/>
			     
			     
			  </td>
			  <td colspan="1"  class="form_label">
				<label id="vcStockNameFull_lab" style="display:none">*</label>债券全称:	 
			  </td>
			  <td colspan="1" >
			  	<input style="width: 100%;" class="nui-textbox"  id="vcStockNameFull" name="stockissueinfo.vcStockNameFull" />
			  </td>
			  
			</tr>
			
			<tr>
				
			  <td colspan="1"  class="form_label">
				<label>*</label>发行日期:
			  </td>
			  <td colspan="1">
			    <input style="width: 100%;"  id="lIssueBeginDate" required="true" name="stockissueinfo.lIssueBeginDate"  class="mini-datepicker" showTodayButton="true"  />
			   </td>
			  <td colspan="1"  class="form_label">
				<label id="enIssueBalance_lab" style="display:none">*</label>发行规模(亿):
			  </td>
			  <td colspan="1">
			    <input style="width: 100%;" id="enIssueBalance" vtype="float" onvaluechanged="checkInt" name="stockissueinfo.enIssueBalance"  class="nui-textbox"  value="0" />
			   </td>
			</tr>
		</table>
		
	
	   <div style="height: 5px"></div>
	   
	   
	    <div id="panel1" class="mini-panel" title="其他信息" iconCls="icon-edit" style="width:100%;" 
    		showToolbar="true" showCollapseButton="true" showFooter="true" allowResize="true" collapseOnTitleClick="true">
		<table style="width:100%; table-layout:fixed;" border="0" class="nui-form-table">
		    <tr>
			  <td colspan="1"  class="form_label" width="18%">
				主承销商:	 
			  </td>
			  <td colspan="3" width="82%">
			  	<!-- 控件开始 -->
				  	<input style="width: 95%;" class="nui-textbox"  id="stockissueinfo.vcMainUnderwriter" name="stockissueinfo.vcMainUnderwriter"/>
				  	<input id="lookup2" style="width: 25px;"    class="mini-lookup"  
				        textField="vcIssueNameFull" valueField="lIssuerId" popupWidth="auto"  
				        popup="#gridPanel2"  onvalidation="onIssuerId2" allowInput="true" showNullItem="true"  grid="#datagrid2" multiSelect="true" />
								     
				     <div id="gridPanel2" class="mini-panel" title="header" iconCls="icon-add" style="width:450px;height:250px;" 
				        showToolbar="true" showCloseButton="true" showHeader="false" bodyStyle="padding:0" borderStyle="border:0" >
				        <div property="toolbar" style="padding:5px;padding-left:8px;text-align:center;">   
				            <div style="float:left;padding-bottom:2px;">
				                <span>主承销商：</span>                
				                <input id="keyText2" class="mini-textbox" style="width:160px;" onenter="onSearchClick2"/>
				                <a class="mini-button" onclick="onSearchClick2">查询</a>
				                <a class="mini-button" id="add" iconCls='icon-add' onclick="onAddClick2">添加</a>
				            </div>
				            <div style="float:right;padding-bottom:2px;">
				            </div>
				            <div style="clear:both;"></div>
				        </div>
				        <div id="datagrid2"   class="mini-datagrid" style="width:100%;height:100%;" 
				            borderStyle="border:0" showPageSize="false" showPageIndex="false"
				            url="com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadIssueInfo.biz.ext" onRowdblclick="onCloseClickLookup">
				            <div property="columns" >
				            <div type="checkcolumn"></div>
				                <div field="vcIssueName" width="80"    headerAlign="center" allowSort="true">简称</div>
				                <div field="vcIssueNameFull" width="120"    headerAlign="center" allowSort="true">全称</div>
				            </div>
				        </div>  
				    </div>
				    <!-- 控件结束 -->
				    <input class="nui-hidden" type="hidden" id="vcMainUnderwriterId"  name="stockissueinfo.vcMainUnderwriterId"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="1"  class="form_label" width="18%">
				副主承销商:	 
			  </td>
			  <td colspan="3" width="82%">
			  	<!-- 控件开始 -->
				  	<input style="width: 95%;" class="nui-textbox"  id="stockissueinfo.vcDeputyUnderwriter" name="stockissueinfo.vcDeputyUnderwriter"/>
				  	<input id="lookup4" style="width: 25px;"    class="mini-lookup"  
				        textField="vcIssueNameFull" valueField="lIssuerId" popupWidth="auto"  
				        popup="#gridPanel4"  onvalidation="onIssuerId4" allowInput="true" showNullItem="true"  grid="#datagrid4" multiSelect="true" />
								     
				     <div id="gridPanel4" class="mini-panel" title="header" iconCls="icon-add" style="width:450px;height:250px;" 
				        showToolbar="true" showCloseButton="true" showHeader="false" bodyStyle="padding:0" borderStyle="border:0" >
				        <div property="toolbar" style="padding:5px;padding-left:8px;text-align:center;">   
				            <div style="float:left;padding-bottom:2px;">
				                <span>副主承销商：</span>                
				                <input id="keyText4" class="mini-textbox" style="width:160px;" onenter="onSearchClick4"/>
				                <a class="mini-button" onclick="onSearchClick4">查询</a>
				                <a class="mini-button" id="add" iconCls='icon-add' onclick="onAddClick4">添加</a>
				            </div>
				            <div style="float:right;padding-bottom:2px;">
				            </div>
				            <div style="clear:both;"></div>
				        </div>
				        <div id="datagrid4"   class="mini-datagrid" style="width:100%;height:100%;" 
				            borderStyle="border:0" showPageSize="false" showPageIndex="false"
				            url="com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadIssueInfo.biz.ext" onRowdblclick="onCloseClickLookup">
				            <div property="columns" >
				            <div type="checkcolumn"></div>
				                <div field="vcIssueName" width="80"    headerAlign="center" allowSort="true">简称</div>
				                <div field="vcIssueNameFull" width="120"    headerAlign="center" allowSort="true">全称</div>
				            </div>
				        </div>  
				    </div>
				    <!-- 控件结束 -->
				    <input class="nui-hidden" type="hidden" id="vcDeputyUnderwriterId"  name="stockissueinfo.vcDeputyUnderwriterId"/>
			    </td>
			</tr>
			<tr>
			  <td colspan="1"  class="form_label" width="18%">
			  	承销团:
			  </td>
			  <td colspan="3" width="82%">
			  	<!-- 控件开始 -->
				  	<input style="width: 95%;" class="nui-textbox"  id="stockissueinfo.vcGroupUnderwriter" name="stockissueinfo.vcGroupUnderwriter"/>
				  	<input id="lookup5" style="width: 25px;"    class="mini-lookup"  
				        textField="vcIssueNameFull" valueField="lIssuerId" popupWidth="auto"  
				        popup="#gridPanel5"  onvalidation="onIssuerId5" allowInput="true" showNullItem="true"  grid="#datagrid5" multiSelect="true" />
								     
				     <div id="gridPanel5" class="mini-panel" title="header" iconCls="icon-add" style="width:450px;height:250px;" 
				        showToolbar="true" showCloseButton="true" showHeader="false" bodyStyle="padding:0" borderStyle="border:0" >
				        <div property="toolbar" style="padding:5px;padding-left:8px;text-align:center;">   
				            <div style="float:left;padding-bottom:2px;">
				                <span>承销团：</span>                
				                <input id="keyText5" class="mini-textbox" style="width:160px;" onenter="onSearchClick5"/>
				                <a class="mini-button" onclick="onSearchClick5">查询</a>
				                <a class="mini-button" id="add" iconCls='icon-add' onclick="onAddClick5">添加</a>
				            </div>
				            <div style="float:right;padding-bottom:2px;">
				            </div>
				            <div style="clear:both;"></div>
				        </div>
				        <div id="datagrid5"   class="mini-datagrid" style="width:100%;height:100%;" 
				            borderStyle="border:0" showPageSize="false" showPageIndex="false"
				            url="com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadIssueInfo.biz.ext" onRowdblclick="onCloseClickLookup">
				            <div property="columns" >
				            <div type="checkcolumn"></div>
				                <div field="vcIssueName" width="80"    headerAlign="center" allowSort="true">简称</div>
				                <div field="vcIssueNameFull" width="120"    headerAlign="center" allowSort="true">全称</div>
				            </div>
				        </div>  
				    </div>
				    <!-- 控件结束 -->
				    <input class="nui-hidden" type="hidden" id="vcGroupUnderwriterId"  name="stockissueinfo.vcGroupUnderwriterId"/>
			  </td>
			</tr>
		 	<tr>
			  <td colspan="1"  class="form_label" width="18%">
			  	交易对手:
			  </td>
			  <td colspan="1"  width="32%">
			     <input class="nui-hidden" type="hidden" id="hlRivalId" name="applyInst.lRivalId"/>
			  	<input id="lookup3" style="width: 100%;" name="applyInst.vcBusinessObject" class="mini-lookup"  
			        textField="vcAllName" valueField="lRivalId" popupWidth="auto"  
			        popup="#gridPanel3" onvalidation="onIssuerId3"   grid="#datagrid3" multiSelect="false"  onclick="onClearClick3();onSearchClick3()"/>
			     <div id="gridPanel3" class="mini-panel" title="header" iconCls="icon-add" style="width:450px;height:250px;" 
			        showToolbar="true" showCloseButton="true" showHeader="false" bodyStyle="padding:0" borderStyle="border:0" >
			        <div property="toolbar" style="padding:5px;padding-left:8px;text-align:center;">   
			            <div style="float:left;padding-bottom:2px;">
			                <span>交易对手：</span>                
			                <input id="keyText3" class="mini-textbox" style="width:160px;" onenter="onSearchClick3"/>
			                <a class="mini-button" onclick="onSearchClick3">查询</a>
			                <a class="mini-button" id="add" iconCls='icon-add' onclick="onAddClick3">添加</a>
			                <a class="mini-button" id="cleanLookup3" onclick="cleanLookup3()">清空</a>
			            </div>
			            <div style="float:right;padding-bottom:2px;">
			            </div>
			            <div style="clear:both;"></div>
			        </div>
			        <div id="datagrid3"   class="mini-datagrid" style="width:100%;height:100%;" 
			            borderStyle="border:0" showPageSize="false" showPageIndex="false"
			            url="com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.LoadCounterpartyInfo.biz.ext" onRowdblclick="onCloseClickLookup">
			            <div property="columns" >
			            	<div field="lRivalId" width="80"    headerAlign="center" allowSort="true" visible=false>id</div>
			                <div field="vcName" width="80"    headerAlign="center" allowSort="true">简称</div>
				            <div field="vcAllName" width="120"    headerAlign="center" allowSort="true">全称</div>
			            </div>
			        </div>  
			    </div>
			  </td>
			  <td colspan="1" class="form_label" width="18%">
				主体类型:	 
			  </td>
			  <td colspan="1" width="32%">
			  	<input style="width: 100%;" class="nui-dictcombobox" id="vcIssueProperty" name="stockissueinfo.vcIssueProperty"  dictTypeId="ATS_FM_ISSUE_PROPERTY" />
			  </td>
			</tr>
			<tr>
			  <td colspan="1" class="form_label">
				<label id="cIssueAppraise_lab" style="display:none">*</label>主体评级:	 
			  </td>
			  <td colspan="1">
			  	<input style="width: 100%;" class="nui-dictcombobox" id="cIssueAppraise" name="stockissueinfo.cIssueAppraise"  dictTypeId="issuerRating" />
			  </td>
			  <td colspan="1"  class="form_label">
				<label id="cBondAppraise_lab" style="display:none">*</label>债券评级:	 
			  </td>
			  <td colspan="1" >
			  	<input style="width: 100%;" class="nui-dictcombobox" name="stockissueinfo.cBondAppraise" id="cBondAppraise" dictTypeId="creditRating" />
			  </td>
			</tr>
			
			<tr>
			  <td colspan="1"  class="form_label">
				<label id="vcIssueAppraiseOrgan_lab" style="display:none">*</label>主体评级机构:	 
			  </td>
			  <td colspan="1" >
			  	<input style="width: 100%;" class="nui-dictcombobox" name="stockissueinfo.vcIssueAppraiseOrgan" id="vcIssueAppraiseOrgan" dictTypeId="outRatingOrgan" />
			  </td>
			  <td colspan="1"  class="form_label">
				<label id="vcBondAppraiseOrgan_lab" style="display:none">*</label>债券评级机构:	 
			  </td>
			  <td colspan="1" >
			  	<input style="width: 100%;" class="nui-dictcombobox" name="stockissueinfo.vcBondAppraiseOrgan" id="vcBondAppraiseOrgan" dictTypeId="outRatingOrgan" />
			  </td> 
			</tr>
			<tr>
			  <td colspan="1" class="form_label">
				特殊条款:	
			 </td>
			 <td colspan="1">
			 	<input style="width: 100%;" class="nui-dictcombobox" id="vcSpecialText" name="stockissueinfo.vcSpecialText"  valueField="dictID" textField="dictName" dictTypeId="specialText"  
					emptyText="请选择" nullItemText="请选择" multiSelect="true" showClose="true" valueFromSelect="true" width="100%" oncloseclick="onCloseClickValueEmpty1" onvaluechanged="checkvcSpecialText" />
			 </td>	 
			  <td colspan="1"  class="form_label">
				<label id="enExistLimite_lab" style="display:none">*</label>发行期限(年):	 
			  </td>
			  <td colspan="1" >
			  	<input style="width: 100%;" class="nui-textbox" vtype="float" onvaluechanged="checkInt" id="enExistLimite" name="stockissueinfo.enExistLimite"  value="0"/>
			  </td>
			</tr>
			<tr>
			  <td colspan="1" class="form_label">
				特殊期限:
			  	</td>
			  	<td colspan="1"  >
			  		<input style="width: 100%;" class="nui-textbox" id="vcSpecialLimite" name="stockissueinfo.vcSpecialLimite" />
			    </td>
				<td colspan="1"  class="form_label">
				下一行权日:
				</td>
				<td colspan="1">
					<input style="width: 100%;" class="nui-datepicker"  id="lNextExerciseDate" name="stockissueinfo.lNextExerciseDate" style="width: 170px;"/>
				</td>
			</tr>
			<tr>
				 <td colspan="1" class="form_label">
				  下一利率跳升点数:
			  </td>
			  <td colspan="1">
			    <input style="width: 100%;" class="nui-textbox" onblur="checkIntValue(this,lNInterestRateJumpPoints)" vtype="float" id="lNInterestRateJumpPoints" name="stockissueinfo.lNInterestRateJumpPoints" />
			  </td>
			<td colspan="1"  class="form_label">
				首次付息日:	 
			  </td>
			  <td colspan="1" >
			  	<input style="width: 100%;" class="mini-datepicker" showTodayButton="true"  name="applyInst.dInitInterestPaymentDate" />
			  </td>
			</tr>
			<tr>
			  <td colspan="1" class="form_label">
				  公司净资产（元）:
			  </td>
			  <td colspan="1"  >
			  	<input style="width: 100%;" class="nui-textbox" vtype="float" onvaluechanged="checkInt" id="enIssuerNetValue" name="stockissueinfo.enIssuerNetValue" />
			  </td>
			  <td colspan="1" class="form_label">
				城投行政级别:
			  </td>
			  <td colspan="1"  >
			  	<input style="width: 100%;" id="vcCityLevel" class="nui-dictcombobox" name="stockissueinfo.vcCityLevel" 
			     showNullItem="true"  emptyText="---请选择---" nullItemText="---请选择---" dictTypeId="cityLevel" />
			  </td>
			</tr>
			<tr>
			  <td colspan="1" class="form_label">
				  所属行业(证监会二级):
			  </td>
			  <td colspan="1">
			    <!-- <input style="width: 100%;" class="nui-textbox" id="vcIssueAppraiseCsrc" name="stockissueinfo.vcIssueAppraiseCsrc" /> -->
			    <input style="width: 100%;" id="vcIssueAppraiseCsrc" name="stockissueinfo.vcIssueAppraiseCsrc" class="mini-treeselect"  multiSelect="false" 
										        textField="text" valueField="id" parentField="pid" checkRecursive="false" virtualScroll="true" 
										        expandOnLoad="true" showTreeIcon="false" showFolderCheckBox="true" allowInput="true" />
			  </td>
				  <td colspan="1"  class="form_label">
					投标区间:	 
				  </td>
				  <td colspan="1" >
				  	<input style="width: 100%;" class="nui-textbox"  id="vcTenderInterval" name="stockissueinfo.vcTenderInterval" />
				  </td>
			</tr>
			<tr id="mortInfo" style="display:none">
			  <td colspan="1" class="form_label">
				<label>*</label>股票名称:
			  </td>
			  <td colspan="1"  >
			  	<input style="width: 100%;" class="nui-textbox" required="true" id="vcMortStockName" name="stockissueinfo.vcMortStockName" />
			  </td>
			  <td colspan="1" class="form_label">
				   <label>*</label>股票代码:
			  </td>
			  <td colspan="1">
			    <input style="width: 100%;" class="nui-textbox" required="true" id="vcMortStockCode" name="stockissueinfo.vcMortStockCode" />
			  </td>
			</tr>
			<tr id="mortAmount" style="display:none">
			  <td colspan="1" class="form_label">
				<label>*</label>股票抵押数量(万股):
			  </td>
			  <td colspan="1"  >
			  	<input style="width: 100%;" class="nui-textbox" vtype="float" required="true" id="vcMortStockAmount" name="stockissueinfo.vcMortStockAmount" />
			  </td>
			  <td colspan="1" class="form_label">
				  
			  </td>
			  <td colspan="1">
			    
			  </td>
			</tr>
			
			
			<tr>
			  <td colspan="1" class="form_label">
				ABS类型:
			  </td>
			  <td colspan="1"  >
			  	<input style="width: 100%;" id="vcAbsType" class="mini-combobox" name="stockissueinfo.vcAbsType" 
			     showNullItem="true"  emptyText="---请选择---" nullItemText="---请选择---"   textField="text" valueField="id"/>
			  </td>
			  <td colspan="1" class="form_label">
				主体评级展望:
			  </td>
			  <td colspan="1"  >
			  	<input style="width: 100%;" id="vcIssueAppraiseProspect" class="nui-dictcombobox" name="stockissueinfo.vcIssueAppraiseProspect" 
			     showNullItem="true"  emptyText="---请选择---" nullItemText="---请选择---" dictTypeId="vcIssueAppraiseProspect" />
			  </td>
			</tr>
			
			
			
			<tr>
			  <td colspan="1"  class="form_label">
				是否具有回售权:	 
			  </td>
			  <td colspan="1" class="radio-border-top-none">
			  	<div   value="0" onValueChanged="vcResaleYear" id="cIsHaveSaleback" name="stockissueinfo.cIsHaveSaleback" class="nui-dictradiogroup"  dictTypeId="COF_YESORNO" >
			   </td>
			  <td colspan="1"  class="form_label">
				是否具有赎回权:	 
			  </td>
			  <td colspan="1" class="radio-border-top-none">
			    <div value="0" onValueChanged="cIsHaveBuyback" id="cIsHaveBuyback" name="stockissueinfo.cIsHaveBuyback" class="nui-dictradiogroup"  dictTypeId="COF_YESORNO" >
			  </td>
			</tr>
			
			
			
			
			<tr>
			  <td colspan="1"  class="form_label">
				是否城投债:	 
			  </td>
			  <td colspan="1" class="radio-border-top-none">
			  	<div   value="0" onValueChanged="cIsHaveCityInvestmentBond" id="cIsHaveCityInvestmentBond" name="stockissueinfo.cIsHaveCityInvestmentBond" class="nui-dictradiogroup"  dictTypeId="COF_YESORNO" >
			   </td>
			  <td colspan="1"  class="form_label">
				是否担保债:	 
			  </td>
			  <td colspan="1" class="radio-border-top-none">
			    <div value="0" onValueChanged="cIsGuarantyBond" id="cIsGuarantyBond" name="stockissueinfo.cIsGuarantyBond" class="nui-dictradiogroup"  dictTypeId="COF_YESORNO" >
			  </td>
			</tr>
			
			
			<tr>
			  <td colspan="1"  class="form_label">
				是否次级债:	 
			  </td>
			  <td colspan="1" class="radio-border-top-none">
			  	<div   value="0" onValueChanged="cIsSubordinatedBond" id="cIsSubordinatedBond" name="stockissueinfo.cIsSubordinatedBond" class="nui-dictradiogroup"  dictTypeId="COF_YESORNO" >
			   </td>
			  <td colspan="1"  class="form_label">
				是否永续债:	 
			  </td>
			  <td colspan="1" class="radio-border-top-none">
			    <div value="0" onValueChanged="cIsPerpetualBond" id="cIsPerpetualBond" name="stockissueinfo.cIsPerpetualBond" class="nui-dictradiogroup"  dictTypeId="COF_YESORNO" >
			  </td>
			</tr>
			
			
			
			
			
			
			<tr>
			  <td colspan="1" class="form_label td">
				备注:	
			  </td>
			  <td colspan="3" class="td">
			  	<input class="nui-textarea" width="90%" name="applyInst.vcRemarks"/>
			  </td>
			</tr>
		</table>
	    <table style="width:100%; table-layout:fixed;" border="0" class="nui-form-table">	
				<tr>          
                   <td width="215px" class="form_label" style="padding:5px 5px;">
		                                            已投资该发行主体债券存量(万元):
		            </td>
		            <td colspan="1"  style="padding:5px 0px;">
						<input class="nui-textbox"  id="fsumamount"  onvaluechanged="BondAccountedCalculation"/>
						<a class='nui-button' plain='false' style="margin-left: 0;" onclick="queryScaleDaet()" iconCls="icon-reload">刷新</a>
		             </td>  
		             
		            <td width="230px"  class="form_label" style="padding:5px 5px;">
		                                             产品净值规模(万元):
                    </td>
                    <td colspan="1" style="padding:5px 0px;">
						<input class="nui-textbox" id="enNetScale"  width="170px"  onvaluechanged="BondAccountedCalculation"/>
                    </td>  
      
                </tr>
                <tr>
                   <td class="form_label" style="padding:5px 5px;">
                                                                       该笔债券投资占发行规模比例(%):
                    </td>
                    <td colspan="1" style="padding:5px 0px;">
						<input class="nui-textbox"  id="enInvestScaleRatio" inputStyle="background-color:#f0f0f0;" readonly="readonly"/>
                    </td> 
                    <td  class="form_label" style="padding:5px 5px;">
		                                            同一发行主体占产品净值规模比例(%):
		            </td>
		            <td colspan="1" style="padding:5px 0px;">
						<input class="nui-textbox"  id="enIssuerNetRatio" width="170px" inputStyle="background-color:#f0f0f0;" readonly="readonly"/>
		             </td>
	                 
	              </tr>
	              <tr>
	              <td class="form_label" style="padding:5px 5px;">
                                                                       该笔债券投资占产品净值规模比例(%):
                    </td>
                    <td colspan="1"  style="padding:5px 0px;">
						<input class="nui-textbox" id="enInvestNetRatio" inputStyle="background-color:#f0f0f0;" readonly="readonly"/>
                    </td> 
                    <td  class="form_label" style="padding:5px 5px;">
		                                            弱流动性资产规模占产品净值规模比例(%):
		            </td>
		            <td colspan="1" style="padding:5px 0px;">
						<input class="nui-textbox"  id="enWeakNetRatio" width="170px" inputStyle="background-color:#f0f0f0;" readonly="readonly"/>
		             </td>
	              </tr>
			 </table> 
	   </div>
		<div title="报量录入">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;margin-top: 2px;height: 25px;">
				<table style="width:100%;">
					<tr>
						<td style="width:100%;">
			          		&nbsp;&nbsp;报量录入
						</td>
						<td>
							<a class="nui-button " plain="false" iconCls="icon-add" onclick="gridAddRow('datagrid')"  plain="false" tooltip="增加">
			            		&nbsp;
			          		</a>
			        	</td>
			        	<td >
			          		<a class="nui-button " plain="false" iconCls="icon-remove" onclick="gridRemoveRow('datagrid')"  plain="false" tooltip="删除">
			            		&nbsp;
			          		</a>
			        	</td>
			        	<td >
	                  		<a class="nui-button " plain="false" iconCls="icon-reload" onclick="gridReload('datagrid')"  plain="false" tooltip="刷新">
	                    		&nbsp;
	                  		</a>
	                	</td>
	                	<td >
	                  		<a class="nui-button " plain="false" iconCls="icon-help" onclick="showTips()"  plain="false" tooltip="帮助">
	                    		&nbsp;
	                  		</a>
	                	</td>
					</tr>
				</table>
			</div>
			<div style="font-size:10px;color:red;">
				<div style="width:65%;float: left;padding-left: 10px;line-height: 30px;"><b>说明：</b>①报量为100万整数倍。②特殊说明请在报量说明中填写。③报价待定时为空即可。</div>
				<div style="width:30%;float: right;padding-right: 10px;text-align: right;line-height: 30px;">
				  <label>*</label>报量方式：<input style="width: 140px;" id="reportType"  name="applyInst.cReportType" url="<%= request.getContextPath() %>/fm/instr/processUtil/reportData.txt" 
				class="nui-dictcombobox"  value="<b:write property="firstGradeBond/cReportType" />" required="true"  />
				</div>
			</div>
			
			<div class="nui-datagrid" id="datagrid"  url="" height="120px" showPager="false" allowSortColumn="false" allowCellSelect="true" 
			allowCellEdit="true" multiSelect="true" allowCellValid="true" oncellvalidation="reportEdit" >
				<div property="columns">
					<div field="enReport"  headerAlign="center" allowSort="true">
						<label style="color:red">*</label>报量(万元)
						<input id="enReport" class="nui-textbox"  name="enReport" property="editor" required="true"/>
					</div>
					<div field="enOffer"  headerAlign="center" allowSort="true">
						报价(%)
						<input id="enOffer" class="nui-textbox" name="enOffer" property="editor" />
					</div>
					<!-- <div field="enEnsureGold"  headerAlign="center" allowSort="true">
						保证金(万元)
						<input id="enEnsureGold" class="nui-textbox" name="enEnsureGold" property="editor" />
					</div> -->
					<div field="vcReportRemark"  headerAlign="center" allowSort="true">
						报量说明
						<input id="vcReportRemark" class="nui-textbox" name="vcReportRemark" property="editor" />
					</div>
				</div>
			</div>
		</div>	 
		<table style="width:100%; table-layout:fixed;margin-top: 2px;" border="0" class="nui-form-table">
		    <tr>
			    <td class="form_label td" align="right" width="15%">
	                        附件上传:
				</td>
				<td colspan="3" class="td">
					<iframe id="prodIfm" width="590"  height="130px" frameborder="no" border="0" marginwidth="0" marginheight="0" scolling="no" 
					  ></iframe>
				</td>
			</tr>
		</table>
		<div id="attachmentListShow">
			<div  style="margin-top: 10px">
				<privilege:operation sourceId="ATS_JYGL_ZXBJ" sid="editorFile"  clazz="nui-button" onClick="editorFile()" lableName="编辑文档"  iconCls="icon-edit" ></privilege:operation>
				<privilege:operation sourceId="ATS_JYGL_ZXBJ" sid="generateFile"  clazz="nui-button" onClick="generatePurchaseOrder()" lableName="生成申购函"  iconCls="icon-add" ></privilege:operation>
			    <label style="color: red; margin-left: 50px;">发送传真时请"勾选"需要传真的附件</label>
			</div>
	
			<div id="file_Form">
				<input class="nui-hidden" id="mapBizId" name="map/bizId" value="" /> 
				<input class="nui-hidden" id="mapAttachBusType" name="map/attachBusType" value="1" /> 
			</div>
			<!-- 附件用印 -->
			<div id="file_grid" class="mini-datagrid"
				style="width: 100%; height: 150px;"
				url="com.cjhxfund.ats.fm.comm.attachUitlFunction.queryProcrssAttachment.biz.ext"
				showPager="false" dataField="attachments" pageSize="50"
				showPageInfo="fase" multiSelect="true" allowSortColumn="false"
				allowCellEdit="true">
				<div property="columns">
					<div type="checkcolumn" width="20"></div>
					<div field="lAttachId" headerAlign="center" visible="false">编号</div>
					<div field="vcAttachName" headerAlign="center" style="width: 70%;"
						allowSort="true">文件名</div>
					<div field="vcAnnexSeal" type="checkboxcolumn" trueValue="1"
						falseValue="0" width="30" headerAlign="center">是否用印</div>
					<div field="vcWhetherIndia" type="checkboxcolumn" trueValue="1"
						falseValue="0" width="40" headerAlign="center" readOnly="true">是否用过印</div>
					<div field="cWhetherArchiving" type="checkboxcolumn" trueValue="1"
						falseValue="0" width="40" headerAlign="center">是否需要归档</div>
				</div>
			</div>
		</div>
		<div style="height: 30px;">&nbsp;</div>
	</div>
	</div>
	<!-- 可投资范围 -->
	<!-- 居右east，据左west -->
	<div  title="投资范围" region="east" width="220" showCloseButton="false"
		showSplitIcon="true">
		<div id="dataform2">
			<!-- hidden域 -->
			<input type="hidden" class="nui-hidden" name="cfjyProductInvestRange.productid" />
			
			<table style="width: 100%; height: 100%; table-layout: fixed;"
				class="nui-form-table" >
				<tr>
					<td colspan="3">产品名称：
					<input class="nui-textbox" width="100%" name="ProductInvestRange.combProductName" inputStyle="background-color:#f0f0f0;" readonly/>
					</td>
				</tr>
				<tr>
					<td colspan="3">可投范围：
					<input class="nui-textarea" width="100%"
						height="120" name="ProductInvestRange.voteRange" inputStyle="background-color:#f0f0f0;" readonly /> 
					</td>
				</tr>
				<tr>
					<td colspan="3">禁投范围：
					<input class="nui-textarea" width="100%"
						height="120" name="ProductInvestRange.noCastRange" inputStyle="background-color:#f0f0f0;" readonly /> 
					</td>
				</tr>
				<tr>
					<td colspan="3">投资限制：
					<input class="nui-textarea" width="100%"
						height="120" name="ProductInvestRange.investmentLimit" inputStyle="background-color:#f0f0f0;" readonly />
					</td>
				</tr>
				
			</table>
		</div>
	</div>
  </div>
  
  <div id="footer" class="nui-toolbar" style="padding:0px;" borderStyle="border:0;">
	<table width="100%">
		<tr>
			<td style="text-align:center;" colspan="4">
				<a class='nui-button' plain='false' iconCls="icon-save" onclick="onOk()">
                                                                    保存
				</a>
				<span style="display:inline-block;width:25px;"></span>
				<a id="windControlTrial" style="display:none" class='nui-button' plain='false' iconCls="icon-save" onclick="windControlTrial()">
                                                                    风控试算
				</a>
				<span style="display:inline-block;width:25px;"></span>
				<a class='nui-button' plain='false' iconCls="icon-cancel" onclick="onCancel()">
                                                                      取消
				</a>
			</td>
		</tr>
	</table>
</div>
	<!--隐藏表单-->
	<form action="" name="openForm" method="post" target="_blank">
	  <input type="hidden" name="workItemID" id="workItemID">
	  <input type="hidden" name="processInstID" id="processInstID">
	  <input type="hidden" name="bizId" id="bizId1">
	  <input type="hidden" name="pageType" id="pageType" value="1"/>
	</form>
	<script type="text/javascript">
    	nui.parse();
    	var grid = nui.get("datagrid");
    	var processInstID="<%=request.getParameter("processInstID") %>";
    	
    	nui.get("bdApplicationTime").setValue((new Date()));
    	//nui.get("bdApplicationTime").setEnabled(false);
    	var blgrid = nui.get(datagrid);
    	blgrid.addRows([{},{},{}]);//默认3行
    	var generateFileSwitch = false;
		
		/*下拉 datagrgid 控件 开始*/
		var grid1 = mini.get("datagrid1");
		var grid2 = nui.get("datagrid2");
		var grid3 = nui.get("datagrid3");
		var grid4 = nui.get("datagrid4");
		var grid5 = nui.get("datagrid5");
        var keyText = mini.get("keyText");
        var keyText2 = mini.get("keyText2");
        var keyText3 = mini.get("keyText3");
        var keyText4 = mini.get("keyText4");
        var keyText5 = mini.get("keyText5");

        grid5.load();
        //grid1.load();
        grid2.load();
        //grid3.load();
        grid4.load();
        

        function onSearchClick(e) {
            grid1.load({
                key: keyText.value
            });
        }
        function onSearchClick2(e) {
            grid2.load({
                key: keyText2.value
            });
        }
        function onSearchClick3(e) {
            grid3.load({
                key: keyText3.value
            });
        }
        function onSearchClick4(e) {
            grid4.load({
                key: keyText4.value
            });
        }
        function onSearchClick5(e) {
            grid5.load({
                key: keyText5.value
            });
        } 
        function cleanLookup3() {
            nui.get("keyText3").setValue("");
            nui.get("lookup3").setValue("");
           	nui.get("lookup3").setText("");
        }
        function cleanLookup1() {
            nui.get("keyText").setValue("");
            nui.get("lookup").setValue("");
           	nui.get("lookup").setText("");
        }
        function onCloseClickLookup(e) {
            var lookup = mini.get("lookup");
            lookup.hidePopup();
            var lookup2 = mini.get("lookup2");
            lookup2.hidePopup();
            var lookup3 = mini.get("lookup3");
            lookup3.hidePopup();
            var lookup4 = mini.get("lookup4");
            lookup4.hidePopup();
            var lookup5 = mini.get("lookup5");
            lookup5.hidePopup();
        }
        function onClearClick(e) {
            /*var lookup2 = mini.get("lookup2");
            lookup2.deselectAll();*/
             //修改为情况查询条件
            nui.get("keyText").setValue("");
        }
		function onClearClick2(e) {
             //修改为情况查询条件
            nui.get("keyText").setValue("");
        }
        function onClearClick3(e) {
            //var lookup2 = mini.get("lookup2");
            //lookup2.deselectAll();
            //nui.get("applyInst.vcBusinessObject").setValue("");
            //修改为情况查询条件
            nui.get("keyText3").setValue("");
        }
        function onIssuerId3(e){
        	nui.get("hlRivalId").setValue(e.value);
        	nui.get("lookup3").setValue(e.source.text);
        }
        function onIssuerId2(e){
        	nui.get("stockissueinfo.vcMainUnderwriter").setValue(e.source.text);
        	var vcMainUnderwriterId2= nui.get("lookup2").getValue();
        	nui.get("vcMainUnderwriterId").setValue(vcMainUnderwriterId2);
        }
        function onIssuerId4(e){
        	nui.get("stockissueinfo.vcDeputyUnderwriter").setValue(e.source.text);
        	var vcMainUnderwriterId4= nui.get("lookup4").getValue();
        	nui.get("vcDeputyUnderwriterId").setValue(vcMainUnderwriterId4);
        }
        function onIssuerId5(e){
        	nui.get("stockissueinfo.vcGroupUnderwriter").setValue(e.source.text);
        	var vcMainUnderwriterId5= nui.get("lookup5").getValue();
        	nui.get("vcGroupUnderwriterId").setValue(vcMainUnderwriterId5);
        }
		/*下拉 datagrgid 控件 结束*/
		//登记托管机构,改变后更新债券类型
	     function onMarketValueChanged(e){
	     	onvalidationkCode();//校验长度
	        var cMarketNo=e.value;
	        if(cMarketNo==3){
	        	cMarketNo=1;
	        }else if(cMarketNo==4){
	        	cMarketNo=2;
	        }else{
	        	cMarketNo=5;
	        }
	        //将登记场所转换为交易场所 赋值 到交易场所
	        nui.get("applyInst.cMarketNo").setValue(cMarketNo);
	        //查询债券类型
	     	/*var vcStockType = mini.get("stockissueinfo.vcStockType");
	        vcStockType.setValue("");
            var url = "com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadStockType.biz.ext?cMarketNo=" + cMarketNo;
            vcStockType.setUrl(url);
            vcStockType.select(0);*/
	     } 
		var productCombo = mini.get("productCombo");
        var combiCombo = mini.get("combiCombo");
        
        //是否交易
        function cIsRelateTrade(e){
        	
        	//console.log(e.value);
        	if(e.value=="1"){
        		//console.log($("#vcRelateTradeRemark"));
        		$("#vcRelateTradeRemark").css("display","");
        	}else{
        		$("#vcRelateTradeRemark").css("display","none");
        	}
        	
        }
        /*验证债劵代码长度*/
        function onvalidationkCode(){
			var place=nui.get("applyInst.vcPaymentPlace").getValue();
			var code=nui.get("applyInst.vcStockCode").getValue();
			var cMarketNo="";//交易场所
			//将等级机构转为交易场所
	        if(place==3){
	        	cMarketNo=1;
	        }else if(place==4){
	        	cMarketNo=2;
	        }else{
	        	cMarketNo=5;
	        }
			if(place!="" && cMarketNo!=5 && code!=""){
				var skReadOnly = nui.get("applyInst.vcStockCode").readOnly;
				//禁用状态不提示
				if(skReadOnly != "true"){
					return true;
				}
				if(code.length>6){
					nui.alert("当前登记托管机构下，债券代码不能超6位！");
					return false;
				}
			}
			return true;
		}
        //定义 判定 回售 回购选择信息
        var a=0,b=0;
        
        //回售年限
        function vcResaleYear(e){
        	
        	/*if(e.value=="1"){
        		a++;
        		$("#applyInst_nx").css("display","");
        		$(".vcResaleYear").css("display","");
        		//applyInst.vcResaleYear
				//applyInst.cIsHaveBuyback
        		
        	}else{
        	    //回购 没有被选择才隐藏
        		if(b==0){
        			$("#applyInst_nx").css("display","none");
        		}
        		$(".vcResaleYear").css("display","none");
        		a=0;
        	}*/
        	
        }
         //赎回年限
        function cIsHaveBuyback(e){
        	
        	/*if(e.value=="1"){
        		b++;
        		$("#applyInst_nx").css("display","");
        		$(".cIsHaveBuyback").css("display","");
        		//applyInst.vcResaleYear
				//applyInst.cIsHaveBuyback
        		
        	}else{
        	    //回购 没有被选择才隐藏
        		if(a==0){
        			$("#applyInst_nx").css("display","none");
        		}
        		$(".cIsHaveBuyback").css("display","none");
        		b=0;
        	}*/
        	
        }
		//产品下拉改变事件		
		function onProductChanged(e) {
            var vcProductCode = productCombo.getValue();
			//加载组合信息
            combiCombo.setValue("");
            var url = "com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.queryCombiInfo.biz.ext?vcProductCode=" + vcProductCode;
			var cManageType = e.selected.C_MANAGE_TYPE;
			if(checkrole!= "2"){
				if(cManageType != null && cManageType != "" && cManageType == "0"){
					url = "com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.queryCombiInfoByManageType.biz.ext?vcProductCode="
					+ vcProductCode;
					nui.get("cApplyInstType").setValue("2");
				}else{
					nui.get("cApplyInstType").setValue("1");
					nui.get("cApplyAuthStatus").setValue("1");
					nui.get("cPaymentAuthStatus").setValue("3");
				}
			}
            combiCombo.setUrl(url);
            combiCombo.select(0);
             //设置投资范围界面参数
            //nui.get("tabs").tabs[1].url="<%=request.getContextPath() %>/fm/comm/ProductInvestmentRange.jsp?vcProductCode="+vcProductCode;
            //因参数改变重新tabs
            //nui.get("tabs").reloadTab(nui.get("tabs").tabs[1]);
            //装载组合相关信息
            var com=nui.get("combiCombo").getSelected();
            var data=nui.get("combiCombo").data;
        	//获取选中产品的其他数据
        	for(var i=0;i<data.length;i++){
        		//查找选中的数据
        		if(data[i].ID==com.ID){
        			//产品组合
        			nui.get("lCombiId").setValue(data[i].L_COMBI_ID);
        			nui.get("vcCombiName").setValue(data[i].VC_COMBI_NAME);
        			
        			//资产单元
        			nui.get("lAssetId").setValue(data[i].L_ASSET_ID);
        			nui.get("vcAssetNo").setValue(data[i].VC_ASSET_NO);
	        	    nui.get("vcAssetName").setValue(data[i].VC_ASSET_NAME);
        		}
        	}
        	//查询、填充投资范围
        	Init(vcProductCode);
        }
        //查询投资范围
        function Init(vcProductCode){
            var json = nui.encode({vcProductCode : vcProductCode});
	        $.ajax({
	            url:"com.cjhxfund.ats.fm.comm.common.expandProductInvestRange.biz.ext",
	            type:'POST',
	            data:json,
	            cache:false,
	            contentType:'text/json',
	            success:function(text){
	                var returnJson = nui.decode(text);
	                var form = new nui.Form("#dataform2");//将普通form转为nui的form
	                    form.setData(returnJson);
	                   	form.setChanged(false);
	           }
			});
        }
        //控制 产品限制输入
		function onComboValidation(e){
			var items = this.findItems(e.value);
            if (!items || items.length == 0) {
                e.isValid = false;
                e.errorText = "输入值不在下拉数据中";
            }else{
            	//设置申购相关产品信息
            	var data=e.source.data;
            	//获取选中产品的其他数据
            	for(var i=0;i<data.length;i++){
            		//查找选中的数据
            		if(data[i].ID==e.value){
            			nui.get("vcProductCode").setValue(data[i].VC_PRODUCT_CODE);
            			nui.get("vcProductName").setValue(data[i].VC_PRODUCT_NAME);
            		}
            	}
            }
		}
		//限制组合输入
		function onComboValidation1(e){
			var items = this.findItems(e.value);
            if (!items || items.length == 0) {
                e.isValid = false;
                e.errorText = "输入值不在下拉数据中";
            }else{
            	//设置申购相关产品信息
            	
            	//console.log(e.source.data);
            	var data=e.source.data;
            	//获取选中产品的其他数据
            	for(var i=0;i<data.length;i++){
            		//查找选中的数据
            		if(data[i].ID==e.value){
            			//产品组合
            			nui.get("lCombiId").setValue(data[i].L_COMBI_ID);
            			nui.get("vcCombiName").setValue(data[i].VC_COMBI_NAME);
            			//资产单元
	        			nui.get("lAssetId").setValue(data[i].L_ASSET_ID);
	        			nui.get("vcAssetNo").setValue(data[i].VC_ASSET_NO);
	        			nui.get("vcAssetName").setValue(data[i].VC_ASSET_NAME);
            		}
            	}
            }
		}
		
		var IssueronCkData=new Array();//发行人选中的历史数据
		//控制 发行人限制输入
		function onIssuerId(e){
			var dataIssuer=grid1.data;
        	//设置发行人信息,累加查询结果，防止用户查询新数据后不选择
        	if(IssueronCkData!=null){
        		dataIssuer=dataIssuer.concat(IssueronCkData);
        	}
        	//获取发行人的其他数据
        	for(var i=0;i<dataIssuer.length;i++){
        		
        		//查找选中的数据
        		if(dataIssuer[i].lIssuerId==e.value){
        			
        			if(IssueronCkData!=null){
        				IssueronCkData=IssueronCkData.concat(dataIssuer[i]);
        			}else{
        				IssueronCkData[0]=dataIssuer[i];
        			}
        			
        			//回填相关发行人信息
        			nui.get("vcIssuerName").setValue(dataIssuer[i].vcIssueName);
        			nui.get("vcIssueProperty").setValue(dataIssuer[i].vcIssueProperty);
        			nui.get("vcIndustry").setValue(dataIssuer[i].vcIndustry);
        			nui.get("vcProvince").setValue(dataIssuer[i].vcProvince);
        			nui.get("vcIssuerNameFull").setValue(dataIssuer[i].vcIssueNameFull);
        			
        		}
        	}
          
		}
		//投标截止日期处理
		function onTimeValueChanged(e){
			//debugger;
			//获取日期和时间
			var dApplicationDate=nui.get("dApplicationDate").getValue().substr(0,10);
			var dApplicationHH=nui.get("dApplicationTimeHH").getValue();
			var dApplicationMM=nui.get("dApplicationTimeMM").getValue();
			
			var dApplicationTime1=dApplicationHH+":"+dApplicationMM+":00";
			//转换为毫秒数
			var startdata=dApplicationDate+" "+dApplicationTime1;
			//注意 new date(); IE8以下 不兼容，必须将 “-” 转换  “/”
			startTime=Date.parse(new Date(startdata.replace(/-/g,"/")));
			//获取的当前时间毫秒数 .getTime() 和  Date.parse（） 作用一样
			var myDate = (new Date()).getTime();
			var bidRemind=nui.get("bidRemind").getValue();
			bidRemind=(bidRemind==""||bidRemind==null)?120:bidRemind;
			var tempTime=startTime-myDate;
			if(tempTime<=0){
				//提交校验
				if(e==""){
					nui.confirm("当前时间已过投标截止时间:"+startdata+"，是否继续提交？","申购提醒",function(act){
						if(act=="ok"){
							applySubmit();
						}
					});
					return false;
				}else{
					//改变事件校验
					nui.alert("当前时间已过投标截止时间:"+startdata+"，请确认！");
					return false;
				}
			}
			if(tempTime<=(bidRemind*60000)){
				//提交校验
				if(e==""){
					nui.confirm("距离截标时间只剩 ："+parseInt(tempTime/60000)+" 分钟,不足： "+bidRemind+" 分钟，存在投标修改失败的风险，请知悉风险并确认是否需要继续提交？","申购提醒",function(act){
						if(act=="ok"){
							applySubmit();
						}
					});
					return false;
				}else{
					//改变事件校验
					nui.alert("距离截标时间只剩 ："+parseInt(tempTime/60000)+" 分钟,不足： "+bidRemind+" 分钟，存在投标修改失败的风险，请知悉风险并确认！");
					return false;
				}
			}
			return true;
			
		}
		var loadInfo="";
		var bizId;
		//loadData();
		//加载相关key
		function loadData(){
			//默认一个投标初始时间
		    nui.get("dApplicationTimeHH").setValue((new Date()).getHours());
		    nui.get("dApplicationTimeMM").setValue((new Date()).getMinutes());
			//不考虑回退
			$.ajax({
				url:"com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadApplyInstKeys.biz.ext",
				type:'POST',
				/*data:json,*/
				cache:false,
				contentType:'text/json',
				success:function(text){
					//
					nui.get("stockissueinfo.vcStockType").loadList(text.stockTypeData);//设置债券信息
					nui.get("vcIssueAppraiseCsrc").loadList(text.issueAppCrscData);//设置所属行业证监会二级
					//nui.get("stockissueinfo.vcStockType").setValue("99");//设置债券类型的默认值
					nui.get("lIssueBeginDate").setValue((new Date()));//设置默认发行日期
					nui.get("dApplicationDate").setValue(GetDateStr(1));//设置默认投标截止日期
					//nui.get("applyInst.vcStockCode").setValue(text.vcStockCode);//插入式在获取
					nui.get("applyInst.lStockInvestNo").setValue(text.lStockInvestNo);
					nui.get("applyInst.lInvestNo").setValue(text.lInvestNo);
					bizId=text.bizProcess.lBizId;
					nui.get("bizProcess.lBizId").setValue(bizId);
					nui.get("bidRemind").setValue(text.timeParam);
					loadInfo=text;//保存加载的信息
					//console.log(nui.get("bizProcess.lBizId").getValue());
					stockIssueInfoStr=text.stockIssueInfoStr;//获取债券变量数据
					$("#prodIfm").attr("src","<%=request.getContextPath() %>/fm/comm/fileupload/any_upload.jsp?bizId="+bizId+"&attachType=3&attachBusType=1");
					
					
				}
			});	
		
		}
		//定义存储债券字段变量
		var stockIssueInfoStr;
		
		//获取校验债券的数据
		function getCheckStockIssueInfo(){
			//定义存储变量
			var stockIssueInfoEnt={};
			if(stockIssueInfoStr=="" || stockIssueInfoStr==null){
				nui.alert("没有获取到债券校验信息，请刷新！");
				return "";
			}else{
				var strs=stockIssueInfoStr.split(",");
				for(var i=0;i<strs.length;i++){
				//vc_issuer_name,vc_stock_name_full,vc_stock_type,en_exist_limite,en_issue_balance
				//,l_issue_begin_date,c_issue_appraise,vc_issue_property vc_issuer_name_full,vc_stock_name_full
					if(strs[i]=="vc_issuer_name_full"){
						//发行人
						var vcIssuerNameFull=nui.get("vcIssuerNameFull").getValue();
						stockIssueInfoEnt.vcIssuerNameFull=vcIssuerNameFull;
					}
					if(strs[i]=="vc_stock_name_full"){
						//债券全称
						var vcStockNameFull=nui.get("vcStockNameFull").getValue();
						stockIssueInfoEnt.vcStockNameFull=vcStockNameFull;
					}
					if(strs[i]=="vc_stock_type"){
						//债券类型
						var vcStockType=nui.get("stockissueinfo.vcStockType").getValue();
						stockIssueInfoEnt.vcStockType=vcStockType;
					}
					if(strs[i]=="en_exist_limite"){
						//发行期限
						var enExistLimite=nui.get("enExistLimite").getValue();
						stockIssueInfoEnt.enExistLimite=enExistLimite;
					}
					if(strs[i]=="en_issue_balance"){
						//发行额度
						var enIssueBalance=nui.get("enIssueBalance").getValue();
						stockIssueInfoEnt.enIssueBalance=enIssueBalance;
					}
					if(strs[i]=="l_issue_begin_date"){
						//发行日期
						var lIssueBeginDate=nui.get("lIssueBeginDate").getValue();
						lIssueBeginDate=getIntDate(lIssueBeginDate);
						stockIssueInfoEnt.lIssueBeginDate=lIssueBeginDate;
					}
					if(strs[i]=="c_issue_appraise"){
						//主体评级
						var cIssueAppraise=nui.get("cIssueAppraise").getValue();
						stockIssueInfoEnt.cIssueAppraise=cIssueAppraise;
					}
					if(strs[i]=="vc_issue_property"){
						//主体类型
						var vcIssueProperty=nui.get("vcIssueProperty").getValue();
						stockIssueInfoEnt.vcIssueProperty=vcIssueProperty;
					}
				}
				
				return stockIssueInfoEnt;
			}
		}
		 
		//跨页面参数传递参数
		function setFormData(data){
    	    //跨页面传递的数据对象，克隆后才可以安全使用
	   		var infos = nui.clone(data);
	   		var data = {StockIssueId:infos.lStockIssueId};
	   		//判定回退
	   		if(processInstID!="null" && processInstID!="" && processInstID!=null){
	   			data = {StockIssueId:infos.lStockIssueId,processInstID:processInstID};
	   		}else{
	   			processInstID="";
	   		}
			var json = nui.encode(data);
			$.ajax({
				url:"com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadApplyInstBiz.biz.ext",
				type:'POST',
				data:json,
				cache:false,
				contentType:'text/json',
				success:function(text){
					var returnJson = nui.decode(text);
					var form = new nui.Form("#dataform1");//将普通form转为nui的form
					nui.get("stockissueinfo.vcStockType").loadList(returnJson.stockTypeData);//设置债券信息
					nui.get("vcIssueAppraiseCsrc").loadList(text.issueAppCrscData);//设置所属行业证监会二级
					var nextDate =returnJson.stockissueinfo.lNextExerciseDate;
					returnJson.stockissueinfo.lNextExerciseDate = dateTemp(nextDate);			
					form.setData(returnJson);
					form.setChanged(false);
					stockIssueInfoTemp=returnJson.stockissueinfo;
					//获取投标截止时间
					var dApplicationTime=returnJson.stockissueinfo.dBidLimitTime;
					if(dApplicationTime!="" && dApplicationTime!=null){
						nui.get("dApplicationDate").setValue(dApplicationTime);
						//设置时间
						nui.get("dApplicationTimeHH").setValue(dApplicationTime.getHours());
						nui.get("dApplicationTimeMM").setValue(dApplicationTime.getMinutes());
					}
					//通过债券类别控制股票信息展示stockissueinfo.vcStockType
					var vcStockType1=returnJson.stockissueinfo.vcStockType;
					if(vcStockType1!="" && vcStockType1!=null){
						onAccountTypeChanged1(vcStockType1);
					}
					//设置发行日期lIssueBeginDate
					nui.get("lIssueBeginDate").setValue(dateTemp(returnJson.stockissueinfo.lIssueBeginDate));
					var bdApplicationTime =returnJson.bdApplicationTime;
					//设置业务时间
					nui.get("bdApplicationTime").setValue(bdApplicationTime);
					bizId=returnJson.bizProcess.lBizId;
					//投标截止提醒时间
					nui.get("bidRemind").setValue(text.timeParam);
					//债券简称
					nui.get("vcStockName").setValue(returnJson.stockissueinfo.vcStockName);
					//债券代码
					nui.get("applyInst.vcStockCode").setValue(returnJson.stockissueinfo.vcStockCode);
					//登记托管机构
					nui.get("applyInst.vcPaymentPlace").setValue(returnJson.stockissueinfo.vcPaymentPlace);
					//发行主体
					nui.get("lookup").setText(returnJson.stockissueinfo.vcIssuerNameFull);
					nui.get("applyInst.lStockInvestNo").setValue(returnJson.stockissueinfo.lStockInvestNo);
					if(isReadonly){
						readonly();
					}
					//有债券申购时显示风控试算按钮
					document.getElementById("windControlTrial").style.display= "";
					//禁用债券简称清空按钮
					document.getElementById("cleanStock").style.display= "none";
                   	if(returnJson.stockissueinfo.cIsHaveBuyback=="" || returnJson.stockissueinfo.cIsHaveBuyback==null){
                   		//赎回权
		           		nui.get("cIsHaveBuyback").setValue("0");
                   	}
                   	if(returnJson.stockissueinfo.cIsHaveSaleback=="" || returnJson.stockissueinfo.cIsHaveBuyback==null){
			           	//回售权
			           	nui.get("cIsHaveSaleback").setValue("0");
                   	}
                   	//定义有债券申购
					biztype=2;
					//加载附件
					$("#prodIfm").attr("src","<%=request.getContextPath() %>/fm/comm/fileupload/any_upload.jsp?bizId="+bizId+"&attachType=3&attachBusType=1");
				}
			});	
    	}
		
		//提交数据
		function onOk(){
		
		
			nui.confirm("确认提交申购？","系统提示",function(action){
			    if(action == "ok"){
					//获取表单提交数据
					var form = new mini.Form("#dataform1"); 
					var lIssueBeginDate= dateTemp(nui.get("lIssueBeginDate").getValue()).substr(0,10);//发行日期
					if(lIssueBeginDate=="" || lIssueBeginDate=="null"){
					        nui.alert("发行日期不能为空，请确认!","提示");
			    			return;
			    		}
		    		 lIssueBeginDate=Date.parse(new Date(lIssueBeginDate.replace(/-/g,"/")));
		    		var bdApplicationTime1= dateTemp(nui.get("bdApplicationTime").getValue()).substr(0,10);//业务日期
					if(bdApplicationTime1=="" || bdApplicationTime1=="null"){
					        nui.alert("业务日期不能为空，请确认!","提示");
			    			return;
			    		}
		    		bdApplicationTime1=Date.parse(new Date(bdApplicationTime1.replace(/-/g,"/")));
					
		        	if(bdApplicationTime1>lIssueBeginDate){
		        			nui.alert("业务日期不能大于发行日期!","提示");
		        			return;
		        		}
					//vcMainUnderwriter form.validate()后重新赋值，解决校验后值消失问题
					var vcMainUnderwriter=nui.get("stockissueinfo.vcMainUnderwriter").getValue();
					var vcDeputyUnderwriter=nui.get("stockissueinfo.vcDeputyUnderwriter").getValue();
					var vcGroupUnderwriter=nui.get("stockissueinfo.vcGroupUnderwriter").getValue();
					var vcMainUnderwriterId=nui.get("vcMainUnderwriterId").getValue();
					var vcDeputyUnderwriterId=nui.get("vcDeputyUnderwriterId").getValue();
					var vcGroupUnderwriterId=nui.get("vcGroupUnderwriterId").getValue();
					var hlRivalId=nui.get("hlRivalId").getValue();
					form.validate();
					nui.get("stockissueinfo.vcMainUnderwriter").setValue(vcMainUnderwriter);
				    nui.get("stockissueinfo.vcDeputyUnderwriter").setValue(vcDeputyUnderwriter);
				    nui.get("stockissueinfo.vcGroupUnderwriter").setValue(vcGroupUnderwriter);
				    nui.get("vcMainUnderwriterId").setValue(vcMainUnderwriterId);
				    nui.get("vcDeputyUnderwriterId").setValue(vcDeputyUnderwriterId);
				    nui.get("vcGroupUnderwriterId").setValue(vcGroupUnderwriterId);
				    nui.get("hlRivalId").setValue(hlRivalId);
					if(form.isValid() == false){
						nui.alert("有数据为空或者格式不对，请确认！");
						return;
					}
					if(onvalidationkCode()==false){return;}//校验债券code
					//无债券时验证
					if(biztype==1){
						var stockIssueInfo=getCheckStockIssueInfo();
						//校验数据不能为空
						if(stockIssueInfo==""){
							return;
						}
					}
					var vcStockCode=nui.get("applyInst.vcStockCode").getValue();
					//债券未空 则不校验债券是否存在
					if(vcStockCode==""){
						//验证投标时间
						if(onTimeValueChanged("")==false){
							return;
						}
		                applySubmit();
						return;
					}
					if(biztype==1){
						form.loading();//加载遮罩
						//交易债券是否存在
						nui.ajax({
						    url: "com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.checkStockIssueInfo.biz.ext",
						    type: "post",
						    data: {stockIssueInfo:stockIssueInfo,
						    	vcStockCode:vcStockCode,
						    	cMarketNo:nui.get("applyInst.cMarketNo").getValue(),
						    	lStockInvestNo:nui.get("applyInst.lStockInvestNo").getValue()},
						    dataType:"json",
						    success: function (text) {
						       form.unmask();//取消遮罩
						       if(text.out==false){
						       		/*nui.confirm("当前债券已经存在，是否继续发起？","系统提醒",function(a){
						       			if(a=="ok"){
						       				applySubmit();
						       			}
						       			
						       		});*/
						       		nui.alert("当前债券已经存在，请点击<债券简称>输入框旁边的查询按钮，选择您待申购的债券！","申购提醒");
						       		return;
						       }else{
						       		//验证投标时间
									if(onTimeValueChanged("")==false){
										return;
									}
					                applySubmit();
						       }
						       
						    }
						});
					}else{
						//验证投标时间
						if(onTimeValueChanged("")==false){
							return;
						}
		                applySubmit();
					}
				
				}
			});	
			
		}
		
		var biztype=1;//定义申购类型
		function applySubmit(){
		
			//获取表单提交数据
			var form = new mini.Form("#dataform1"); 
			//定义报量存储
			var applyInstReport=new Array();
			var reportData=getReportDatagrid(grid,form);
			if(reportData==false){
				//数据不通过校验
				return;
			}
			
			//赋值获取报量相关信息
			applyInstReport=reportData.applyInstReport;
			
			/**---------------表单数据处理--------------------**/      
			var data = form.getData(false,true);      //获取表单多个控件的数据
			var bizprocess;
			stockissueinfo=data.stockissueinfo;
			//获取投标金额和投标利率
			var applyInst=getReportBidInfo(applyInstReport,data.applyInst);
			//applyInst=data.applyInst;
			bizprocess=data.bizProcess;//注意“P”是大写
		  	//设置债券信息
		  	stockissueinfo.lStockInvestNo=applyInst.lStockInvestNo;//证券投资编号
		  	if((applyInst.vcStockCode).indexOf(" ")> -1){
		  		nui.alert("债券代码不能包含空格！","申购提示");
				return;
		  	}
		  	stockissueinfo.vcStockCode=applyInst.vcStockCode;//债券代码
		  	stockissueinfo.vcStockName=applyInst.vcStockName;//债券简称
		  	stockissueinfo.cStatus=0;//新债发行数据状态,0草稿，2有效
 			stockissueinfo.lValidStatus=0;//指令/建议单状态
 			//验证非空
 			if(stockissueinfo.enExistLimite==""){
 				stockissueinfo.enExistLimite=0;
 			}
 			if(stockissueinfo.enIssueBalance==""){
 				stockissueinfo.enIssueBalance=0;
 			}
			
 			
 			//stockissueinfo.lDate=new Date();//新债录入时间
 			applyInst.vcStockType=stockissueinfo.vcStockType;//债券类型
 			stockissueinfo.vcPaymentPlace=applyInst.vcPaymentPlace;//登记托管机构
 			var PcMarketNo=applyInst.vcPaymentPlace;
 			//债券表登记托管机构转换
 			if(PcMarketNo==3){
	        	PcMarketNo=1;
	        }else if(PcMarketNo==4){
	        	PcMarketNo=2;
	        }else{
	        	PcMarketNo=5;
	        }
	        stockissueinfo.cMarketNo=PcMarketNo;//交易市场
 			applyInst.cMarketNo=PcMarketNo;//交易市场
 			
		  	//设置指令/建议信息
			applyInst.vcBusinessType=1;//非可转
			if(biztype==1){
				bizprocess.vcProcessType=5;//流程类型:1-一级债券申购,2-新债录入,3-新债修改,4-新债查重,5-一级债无债券申购
				bizprocess.vcAbstract="一级债无债券申购";
			}else{
				bizprocess.vcProcessType=1;//流程类型:1-一级债券申购,2-新债录入,3-新债修改,4-新债查重,5-一级债无债券申购
				bizprocess.vcAbstract="一级债有债券申购";
			}
			
			applyInst.cStatus=1;//复核状态 0草稿,1待复核,2正常,3合并中,4失效
			applyInst.lValidStatus=0;//指令/建议单状态:0-有效;1-无效-修改;2-无效-废弃;3-有效-退回;4-无效-退回;
			applyInst.vcStockNameFull=stockissueinfo.vcStockNameFull;
			//applyInst.dBidLimitTime=stockissueinfo.dBidLimitTime;////投标截止日
			//组装时间
			var sBidLimitTime=nui.get("dApplicationDate").text + " " + nui.get("dApplicationTimeHH").text+":"+nui.get("dApplicationTimeMM").text+":00";
			stockissueinfo.dBidLimitTime=sBidLimitTime;
			applyInst.dBidLimitTime=stockissueinfo.dBidLimitTime;//投标截止日
			
			//获取附件数量
			applyInst.lAttchCount=getAttachCount(bizId);//通过查询获取该zhi
			stockissueinfo.lIssueBeginDate=getIntDate(stockissueinfo.lIssueBeginDate);//发行日期
			stockissueinfo.lNextExerciseDate = stockissueinfo.lNextExerciseDate.replace(/-/gi,'').substr(0,8); //下一行权日
			applyInst.lIssueBeginDate=stockissueinfo.lIssueBeginDate;//发行日期
			//流程实例ID
			bizprocess.lProcessInstId=processInstID=="null"?"":processInstID;
			var date=new Date();
			var dApplicationTime=nui.get("bdApplicationTime").text+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
			bizprocess.dApplicationTime=dApplicationTime;
			applyInst.dApplicationTime=dApplicationTime;
			//净值规模和发行主体存量 
			applyInst.enNetScale = nui.get("enNetScale").getValue().replace(/,/gi,'');
			stockissueinfo.enCategoryMoney = nui.get("fsumamount").getValue().replace(/,/gi,'');
			applyInst.enInvestScaleRatio = nui.get("enInvestScaleRatio").getValue();
			applyInst.enIssuerNetRatio = nui.get("enIssuerNetRatio").getValue();
			applyInst.enInvestNetRatio = nui.get("enInvestNetRatio").getValue();
			applyInst.enWeakNetRatio = nui.get("enWeakNetRatio").getValue();
			applyInst.cApplyInstType="F1";//业务类别（全）
			//已被切换为有债券，定义需要提交的新债数据，注意是需要提交的（登记托管机构更改、投标截止时间，债券类型,主承商），不是所有 
			if(biztype!=1){
			var stockissueinfo={lStockIssueId:stockIssueInfoTemp.lStockIssueId,dBidLimitTime:stockissueinfo.dBidLimitTime,vcStockType:stockissueinfo.vcStockType,
			vcPaymentPlace:stockissueinfo.vcPaymentPlace,enCategoryMoney:stockissueinfo.enCategoryMoney,vcMainUnderwriter:stockissueinfo.vcMainUnderwriter,lNextExerciseDate:stockissueinfo.lNextExerciseDate,
			vcDeputyUnderwriter:stockissueinfo.vcDeputyUnderwriter,vcGroupUnderwriter:stockissueinfo.vcGroupUnderwriter,vcTenderInterval:stockissueinfo.vcTenderInterval,
			lIssueBeginDate:stockissueinfo.lIssueBeginDate,vcSpecialText:stockissueinfo.vcSpecialText,vcSpecialLimite:stockissueinfo.vcSpecialLimite,vcMainUnderwriterId:stockissueinfo.vcMainUnderwriterId,vcDeputyUnderwriterId:stockissueinfo.vcDeputyUnderwriterId,
			vcGroupUnderwriterId:stockissueinfo.vcGroupUnderwriterId,cIssueAppraise:stockissueinfo.cIssueAppraise,
			cBondAppraise:stockissueinfo.cBondAppraise,vcBondAppraiseOrgan:stockissueinfo.vcBondAppraiseOrgan,vcIssueAppraiseOrgan:stockissueinfo.vcIssueAppraiseOrgan,enExistLimite:stockissueinfo.enExistLimite,lStockInvestNo:applyInst.lStockInvestNo};
			}
			
			/**风控管理开始**/
			if(bizprocess.vcProcessType!=5){	//	一级债无债券申购只在交易员2校验风控
				applyInst.vcCombiCode = applyInst.vcCombiNo;
				if(judgeRiskTest(null, applyInst)){	//判断是否接入风控管理
					//风控参数
					applyInst.lBizId = bizId;  //业务主表
					applyInst.vcIssuePrice=stockissueinfo.vcIssuePrice;//发行价格
					applyInst.enInterestRate=stockissueinfo.enFaceRate;//投标利率--票面利率
				    applyInst.enCouponRate=stockissueinfo.enFaceRate;//票面利率--票面利率
					applyInst.enPayInteval=stockissueinfo.vcFrequency;//付息频率
					applyInst.vcBusinessObject=nui.get("hlRivalId").getValue();//交易对手需要传ID
					//后面风控回调方法中使用
					applyInstRiskParam = applyInst;
					stockissueinfoRiskParam = stockissueinfo;
					bizprocessRiskParam = bizprocess;
					applyInstReportRiskParam = applyInstReport;
					//序列化成JSON
					var riskJson = mini.encode({applyInst:applyInst}); 
					//console.log(riskJson);
					//校验风控
					checkRiskInfoApplyStock(riskJson);
					return;
				}
			}
			/**风控管理结束**/
			
			
			//获取用印信息
		    var attachments = nui.get("file_grid").getData();
			//bizprocess.lBizId=bizId;
			 //序列化成JSON
			
			
			var json = mini.encode({attachments:attachments,applyInst:applyInst,applyInstReport:applyInstReport,bizprocess:bizprocess,stockIssueInfo:stockissueinfo}); 
			
			var loadingForm = new nui.Form("#layout1");//获取全屏
			//
			loadingForm.loading();//加载遮罩
			//提交
			nui.ajax({
			    url: "com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.saveFirstGradeDabt.biz.ext",
			    type: "post",
			    data: json,
			    dataType:"json",
			    success: function (text) {
			    	loadingForm.unmask();//取消遮罩
			    	if(text.out==1){
			    		var processId = text.processId;
			    		//console.log(processId);
						if(generateFileSwitch){
							generateFile(processId,bizId,stockissueinfo.lStockInvestNo);
						}
			    		if(text.ret==1){
			    			var workItem = text.workItem;
		    				nui.confirm("申购录入成功，是否前往复核？","申购提示",function(act){
		    					if(act=="ok"){
		    						var actionUrl = "/com.cjhxfund.ats.fm.instr.FirstGradeBond.flow";
		    						wfOpenWin(actionUrl,workItem.processInstID,workItem.workItemID,bizId);
		    					}
		    					//关闭界面
		    					CloseWindow("cancel");
		    				});
		    			}else{
			    			nui.alert("提交成功","申购提醒",function (a){
			    				//关闭界面
			    				CloseWindow("cancel");
			    			});
		    			}
			    	}else if(text.out==2){
			    		nui.alert("提交失败,该债券被修改或者不可用!");
			    	}else{
			    		if(text.fixStart==false){
			    			nui.alert("fix验证失败，原因为："+msg);
			    		}else{
			    			nui.alert("网络错误，请确认！");
			    		}
			    	}
			    	
			        //alert("提交成功，返回结果:" + text.out);    
			    }
			});
		}
		
		
		/**风控管理开始**/
		var applyInstRiskParam;
		var stockissueinfoRiskParam;
		var bizprocessRiskParam;
		var applyInstReportRiskParam;
		var riskFlagRiskParam;
		var lResultIdRiskParam;
		var lRiskmgrIdRiskParam;
		function subData(riskReturn){
        	var riskFlag = showRiskInfoApplyStock(riskReturn, applyInstRiskParam);
        	riskControl(riskFlag);
        }
        function riskControl(riskFlag, lResultId, lRiskmgrId){
        	riskFlagRiskParam = riskFlag;
        	lResultIdRiskParam = lResultId;
        	lRiskmgrIdRiskParam = lRiskmgrId;
        	if(riskFlag=='-1'){
        		return;
        	}else if(riskFlag=='1' || riskFlag=='2'){
        		applySubmitRisk();
        	}
        }
        function applySubmitRiskFinish(){
        	if(riskFlagRiskParam=='2'){
        		startRiskProcessInstruct(lResultIdRiskParam, lRiskmgrIdRiskParam, "1","F1");
        	}
        }
        
        function applySubmitRisk(){
        	//获取用印信息
		    var attachments = nui.get("file_grid").getData();
		    applyInstRiskParam.lResultIdRiskParam = lResultIdRiskParam;
			 //序列化成JSON
			var json = mini.encode({attachments:attachments,applyInst:applyInstRiskParam,applyInstReport:applyInstReportRiskParam,bizprocess:bizprocessRiskParam,stockIssueInfo:stockissueinfoRiskParam}); 
			//console.log(json);
			var loadingForm = new nui.Form("#layout1");//获取全屏
			//
			loadingForm.loading();//加载遮罩
			//提交
			nui.ajax({
			    url: "com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.saveFirstGradeDabt.biz.ext",
			    type: "post",
			    data: json,
			    dataType:"json",
			    success: function (text) {
			    	loadingForm.unmask();//取消遮罩
			    	if(text.out==1){
			    		var processId = text.processId;
			    		//console.log(processId);
						if(generateFileSwitch){
							generateFile(processId,bizId,stockissueinfo.lStockInvestNo);
						}
			    		if(text.ret==1){
			    			applySubmitRiskFinish();
			    			var workItem = text.workItem;
		    				nui.confirm("申购录入成功，是否前往复核？","申购提示",function(act){
		    					if(act=="ok"){
		    						var actionUrl = "/com.cjhxfund.ats.fm.instr.FirstGradeBond.flow";
		    						wfOpenWin(actionUrl,workItem.processInstID,workItem.workItemID,bizId);
		    					}
		    					//关闭界面
		    					CloseWindow("cancel");
		    				});
		    			}else{
			    			nui.alert("提交成功","申购提醒",function (a){
			    				//关闭界面
			    				applySubmitRiskFinish();
			    				CloseWindow("cancel");
			    			});
		    			}
			    	}else if(text.out==2){
			    		nui.alert("提交失败,该债券被修改或者不可用!");
			    	}else{
			    		if(text.fixStart==false){
			    			nui.alert("fix验证失败，原因为："+msg);
			    		}else{
			    			nui.alert("网络错误，请确认！");
			    		}
			    	}
			    	
			        //alert("提交成功，返回结果:" + text.out);    
			    }
			});
        }
        
        /**风控管理结束**/
        
        
		var contextPath = "<%=request.getContextPath() %>";
		function wfOpenWin(url,processInstID,workItemID,bizId) {
			var winFrm=document.openForm;
			document.getElementById("processInstID").value=processInstID;
			document.getElementById("workItemID").value=workItemID;
			document.getElementById("bizId1").value=bizId;
			var actionURL=contextPath+"/"+url; //目标页面
			winFrm.action=actionURL;
					
			var newwin = window.open('about:blank', 'newWindow' + bizId, '');
			winFrm.target = 'newWindow' + bizId;//这一句是关键
			winFrm.submit();
		}
		function onStockNameFull(e){
			if(nui.get("vcStockNameFull").getValue()==""){
				nui.get("vcStockNameFull").setValue(e.value);
			}
		}
		function GetDateStr(AddDayCount) { 
			var dd = new Date(); 
			dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期 
			var y = dd.getFullYear(); 
			var m = dd.getMonth()+1;//获取当前月份的日期 
			var d = dd.getDate(); 
			return y+"-"+m+"-"+d; 
		}
		//将时间格式字符串转换为int类型
		function getIntDate(dateStr){
			if(dateStr=="" || dateStr==null){
				return "";
			}
			
			dateStr=dateStr.substr(0,10);//0开始，取后面10位
			dateStr=dateStr.replace(/-/g, "");
			return dateStr;
		}
		//关闭窗口
		function CloseWindow(action) {
			if (action == "close" && form.isChanged()) {
				if(confirm("数据被修改了，是否先保存？")) {
					saveData();
				}
			}
			if (window.CloseOwnerWindow)
				return window.CloseOwnerWindow(action);
			else window.close();
		}
		
		//清空债券类型选择
		function onCloseClick(e) {
            var obj = e.sender;
            obj.setText("");
            obj.setValue("");
        }
		//取消
		function onCancel() {
			CloseWindow("cancel");
		}
		function onAddClick(){
	  	var url = "<%= request.getContextPath() %>/fm/baseinfo/issuerInfo/addIssuerInfo.jsp";
			var title = "新增发行主体";
			var width = "400";
			var height = "390";
			nui.open({
				url: url,
				title: title, width: width, height: height,
				onload: function () {//弹出页面加载完成
					
				},
				ondestroy: function (action) {//弹出页面关闭前,把新增的主体简称返回赋值给查询框
					onSearchClick();
					keyText.setValue(action);
				}
			});
	  }
	  function onAddClick2(){
	  	var url = "<%= request.getContextPath() %>/fm/baseinfo/issuerInfo/addIssuerInfo.jsp";
			var title = "新增发行主体";
			var width = "400";
			var height = "390";
			nui.open({
				url: url,
				title: title, width: width, height: height,
				onload: function () {//弹出页面加载完成
					
				},
				ondestroy: function (action) {//弹出页面关闭前,把新增的主体简称返回赋值给查询框
					onSearchClick();
					keyText2.setValue(action);
				}
			});
	  }
	  function onAddClick3(){
	  	var url = "<%= request.getContextPath() %>/fm/baseinfo/issuerInfo/addTraderivalInfo.jsp";
			var title = "新增交易对手";
			var width = "450";
			var height = "330";
			nui.open({
				url: url,
				title: title, width: width, height: height,
				onload: function () {//弹出页面加载完成
					
				},
				ondestroy: function (action) {//弹出页面关闭前
					keyText3.setValue(action);
					onSearchClick3();
				}
			});
	  }
	  function onAddClick4(){
	  	var url = "<%= request.getContextPath() %>/fm/baseinfo/issuerInfo/addIssuerInfo.jsp";
			var title = "新增发行主体";
			var width = "400";
			var height = "390";
			nui.open({
				url: url,
				title: title, width: width, height: height,
				onload: function () {//弹出页面加载完成
					
				},
				ondestroy: function (action) {//弹出页面关闭前,把新增的主体简称返回赋值给查询框
					onSearchClick();
					keyText4.setValue(action);
				}
			});
	  }
	  function onAddClick5(){
	  	var url = "<%= request.getContextPath() %>/fm/baseinfo/issuerInfo/addIssuerInfo.jsp";
			var title = "新增发行主体";
			var width = "400";
			var height = "390";
			nui.open({
				url: url,
				title: title, width: width, height: height,
				onload: function () {//弹出页面加载完成
					
				},
				ondestroy: function (action) {//弹出页面关闭前,把新增的主体简称返回赋值给查询框
					onSearchClick();
					keyText5.setValue(action);
				}
			});
	  }
	  function beforenodeselect(e) {
            //禁止选中父节点
            if (e.isLeaf == false) e.cancel = true;
      }
	  
		//提供给附件上传调用
		function refreshFile(){}
		
		//债券简称回车事件
		$("#vcStockName").keyup(function(e){
	        if(e.which == 13){
	            //这里写你要执行的事件;
	            queryOpen();
	        }
	    });
		var stockIssueInfoTemp;//如果为有债券 存放选择的债券
		//打开查询债券界面
		function queryOpen(){
			var name=nui.get("vcStockName").getValue();
			nui.open({
                    url: "<%=request.getContextPath() %>/fm/instr/firstGradeDebt/queryStockName.jsp",
                    title: "查询债券", width: 620, height: 350,
                    onload: function () {
                        //弹出页面加载完成
	                    var iframe = this.getIFrameEl();
	                    var data = {vcStockName:name};//传入页面的json数据
	                    iframe.contentWindow.setFormData(data);
                    },
                    ondestroy: function (data) {//弹出页面关闭前
                    //console.log(data);
                    //判定回填数据
                    if(data!=null && data!="" && data!="close"){
                    	var form = new nui.Form("#dataform1");//将普通form转为nui的form
                    	var formData = form.getData(false,true);      //获取表单多个控件的数据
                    	stockIssueInfoTemp=data;//存储 ，提交时使用
	                    form.setData({stockissueinfo:data,bizProcess:formData.bizProcess,applyInst:formData.applyInst});
	                    //form.setData({applyInst:data});
	                   	form.setChanged(false);
	                   	nui.get("applyInst.vcPaymentPlace").setValue(data.vcPaymentPlace);
	                   	nui.get("applyInst.vcStockCode").setValue(data.vcStockCode);
	                   	nui.get("vcStockName").setValue(data.vcStockName);
	                   	var vcStockType1=data.vcStockType;
					    //通过债券类别控制股票信息展示stockissueinfo.vcStockType
					    if(vcStockType1!="" && vcStockType1!=null){
						  onAccountTypeChanged1(vcStockType1);
					    }
	                   	
	                   	nui.get("lookup2").setText(data.vcMainUnderwriter);
	                   	nui.get("lookup").setText(data.vcIssuerNameFull);
	                   	var lIssueBeginDate=data.lIssueBeginDate;
				        nui.get("lIssueBeginDate").setValue(dateTemp(lIssueBeginDate));
	                   	
	                   	nui.get("bdApplicationTime").setValue((new Date()));
    					//nui.get("bdApplicationTime").setEnabled(false);
    					
    					nui.get("applyInst.lStockInvestNo").setValue(stockIssueInfoTemp.lStockInvestNo);
						nui.get("applyInst.lInvestNo").setValue(stockIssueInfoTemp.lInvestNo);
    					
	                   	biztype=2;//设置为有债券申购
	                   	//改变表单相关债券数据为不可以操作
	                   	if(isReadonly){
							readonly();
						}
	                   	//有债券申购时显示风控试算按钮
                        document.getElementById("windControlTrial").style.display= "";
	                   	if(stockIssueInfoTemp.cIsHaveBuyback=="" || stockIssueInfoTemp.cIsHaveBuyback==null){
	                   		//赎回权
			           		nui.get("cIsHaveBuyback").setValue("0");
	                   	}
	                   	if(stockIssueInfoTemp.cIsHaveSaleback=="" || stockIssueInfoTemp.cIsHaveBuyback==null){
				           	//回售权
				           	nui.get("cIsHaveSaleback").setValue("0");
	                   	}
	                   	
                    }
                }
             });
		}
		/*清理有债券信息，将有债券切换为无债券*/
		function stockIssueInfoClean(){
			var form = new nui.Form("#dataform1");//将普通form转为nui的form
        	var formData = form.getData(false,true);      //获取表单多个控件的数据
        	var bidRemind=nui.get("bidRemind").getValue();
        	form.reset();
            form.setData({stockissueinfo:{},bizProcess:formData.bizProcess,applyInst:formData.applyInst});
           	form.setChanged(false);
           	//vcProductName  vcProductCode
           	nui.get("productCombo").setValue(formData.applyInst.vcProductCode);
           	
           	biztype=1;//设置为无债券申购
           	readonlyClean();
           	//清理有债券的数据 lookup
           	nui.get("lookup").setValue("");
           	nui.get("lookup").setText("");
           	
           	nui.get("lookup2").setValue("");
           	nui.get("lookup2").setText("");
           	nui.get("stockissueinfo.vcStockType").setValue("");
           	nui.get("applyInst.vcStockCode").setValue("");
           	nui.get("vcStockName").setValue("");
           	nui.get("applyInst.vcPaymentPlace").setValue("");
           	nui.get("bidRemind").setValue(bidRemind);
           	//发行规模默认0
           	nui.get("enIssueBalance").setValue("0");
           	//发行期限默认0
           	nui.get("enExistLimite").setValue("0");
           	//赎回权
           	nui.get("cIsHaveBuyback").setValue("0");
           	//回售权
           	nui.get("cIsHaveSaleback").setValue("0");
           	
           	//默认一个投标初始时间
            nui.get("dApplicationDate").setValue(GetDateStr(1));//设置默认投标截止日期
		    nui.get("dApplicationTimeHH").setValue((new Date()).getHours());
		    nui.get("dApplicationTimeMM").setValue((new Date()).getMinutes());
		    nui.get("lIssueBeginDate").setValue((new Date()));//设置默认发行日期
           	
           	//置回原有无债券的信息
           	nui.get("applyInst.lStockInvestNo").setValue(loadInfo.lStockInvestNo);
			nui.get("applyInst.lInvestNo").setValue(loadInfo.lInvestNo);
			var bizId=loadInfo.bizProcess.lBizId;
			nui.get("bizProcess.lBizId").setValue(bizId);
			stockIssueInfoStr=loadInfo.stockIssueInfoStr;//获取债券变量数据
			//无债券申购时隐藏风控试算按钮
            document.getElementById("windControlTrial").style.display= "none";
			//隐藏股票信息
           	onAccountTypeChanged1("0");
		}
		//清理有债券的禁用信息
		function readonlyClean(){
			//债券类型stockissueinfo.vcStockType
			addInput("stockissueinfo.vcStockType","stockissueinfo\\.vcStockType");
			$("#stockissueinfo\\.vcStockType").addClass("mini-required");//添加必填样式
			nui.get("stockissueinfo.vcStockType").setRequired(true);//添加必填
			//债券代码
			addInput("applyInst.vcStockCode","applyInst\\.vcStockCode");
			//$("#applyInst\\.vcStockCode").addClass("mini-required");//添加必填样式
			//nui.get("applyInst.vcStockCode").setRequired(true);//添加必填
			
			//债券简称
			addInput("vcStockName","vcStockName");
			$("#vcStockName").addClass("mini-required");//添加必填样式
			nui.get("vcStockName").setRequired(true);//必填
			
			//债券全称
			addInput("vcStockNameFull","vcStockNameFull");
			//赎回权
			addInput("cIsHaveBuyback","cIsHaveBuyback");
			//回售权
			addInput("cIsHaveSaleback","cIsHaveSaleback");
			
			//债券评级机构
			addInput("vcBondAppraiseOrgan","vcBondAppraiseOrgan");
			
			//主体评级机构
			addInput("vcIssueAppraiseOrgan","vcIssueAppraiseOrgan");
			
			//债券评级
			addInput("cBondAppraise","cBondAppraise");
			
			//发行期限
			addInput("enExistLimite","enExistLimite");
			
			//主体评级
			addInput("cIssueAppraise","cIssueAppraise");
			
			//发行规模
			addInput("enIssueBalance","enIssueBalance");
			
			//发行主体
			addInput("lookup","lookup");
			//特殊条款
			addInput("vcSpecialText","vcSpecialText");
			//特殊期限
			addInput("vcSpecialLimite","vcSpecialLimite");
			//主体类型
			addInput("vcIssueProperty","vcIssueProperty");
			//所属行业（证监会二级）
			addInput("vcIssueAppraiseCsrc","vcIssueAppraiseCsrc");
			//公司净资产
			addInput("enIssuerNetValue","enIssuerNetValue");
			//城投行政级别
			addInput("vcCityLevel","vcCityLevel");
			//下一利率跳升点数
			addInput("lNInterestRateJumpPoints","lNInterestRateJumpPoints");
		}
		
		//有债券禁用数据
		function readonly(){
			//债券类型stockissueinfo.vcStockType
			readonlyInput("stockissueinfo.vcStockType","stockissueinfo\\.vcStockType");
			$("#stockissueinfo\\.vcStockType").removeClass("mini-required");//删除必填样式
			nui.get("stockissueinfo.vcStockType").setRequired(false);//取消必填
			//债券代码
			readonlyInput("applyInst.vcStockCode","applyInst\\.vcStockCode");
			$("#applyInst\\.vcStockCode").removeClass("mini-required");//删除必填样式
			nui.get("applyInst.vcStockCode").setRequired(false);//取消必填
			//债券简称
			readonlyInput("vcStockName","vcStockName");
			$("#vcStockName").removeClass("mini-required");//删除必填样式
			nui.get("vcStockName").setRequired(false);//取消必填

			//债券全称
			readonlyInput("vcStockNameFull","vcStockNameFull");
			//赎回权
			readonlyInput("cIsHaveBuyback","cIsHaveBuyback");
			//回售权
			readonlyInput("cIsHaveSaleback","cIsHaveSaleback");
			
			//债券评级机构
			readonlyInput("vcBondAppraiseOrgan","vcBondAppraiseOrgan");
			
			//主体评级机构
			readonlyInput("vcIssueAppraiseOrgan","vcIssueAppraiseOrgan");
			
			//债券评级
			readonlyInput("cBondAppraise","cBondAppraise");
			
			//发行期限
			readonlyInput("enExistLimite","enExistLimite");
			
			//主体评级
			readonlyInput("cIssueAppraise","cIssueAppraise");
			
			//发行规模
			readonlyInput("enIssueBalance","enIssueBalance");
			
			//发行主体
			readonlyInput("lookup","lookup");
			//特殊条款
			readonlyInput("vcSpecialText","vcSpecialText");
			//特殊期限
			readonlyInput("vcSpecialLimite","vcSpecialLimite");
			//主体类型
			readonlyInput("vcIssueProperty","vcIssueProperty");
			//所属行业（证监会二级）
			readonlyInput("vcIssueAppraiseCsrc","vcIssueAppraiseCsrc");
			//公司净资产
			readonlyInput("enIssuerNetValue","enIssuerNetValue");
			//城投行政级别
			readonlyInput("vcCityLevel","vcCityLevel");
			//下一利率跳升点数
			readonlyInput("lNInterestRateJumpPoints","lNInterestRateJumpPoints");
			
		}
		//还原必填
		function addInput(inputNuiId,inputJQId){
			nui.get(inputNuiId).readOnly="";//nui 取消禁用
			$("#"+inputJQId+" input").attr("readonly","");// 取消 解决nui禁用IE兼容
			$("#"+inputJQId+" input").css("background-color","");//取消 置灰
		}
		/*禁用nui的input文本框，达到效果为：不可修改，可复制，置灰
		*inputNuiId nui使用的id 即 控件的id属性值
		*inputJQId jquery使用的id,jquery id不支持特殊符号 如“。”需要转义，即传入控件的id属性值转义的值
		*/
		function readonlyInput(inputNuiId,inputJQId){
			nui.get(inputNuiId).readOnly="readonly";//nui禁用
			$("#"+inputJQId+" input").attr("readonly","readonly");//解决nui禁用IE兼容
			$("#"+inputJQId+" input").css("background-color","#f0f0f0");//置灰
		}
		
		
		function showTips() {
			var reportTypeMark = "";
			var json = '{"paramKey":"REPORT_TYPE_MARK"}';
			var url = "<%= request.getContextPath() %>/fm/instr/firstGradeDebt/reportMark.jsp";
			var title = "报量方式说明";
			var width = "610";
			var height = "618";
			//从系统参数获得报量方式
			$.ajax({
				url:"com.cjhxfund.ats.fm.comm.zhfwptparamconfbiz.getParamValue.biz.ext",
				type:'POST',
				data:json,
				cache:false,
				async:false,
				contentType:'text/json',
				success:function(data){
					reportTypeMark = data.paramValue;
				}
			});
			nui.open({
				url: url,
				title: title, width: width, height: height,
				onload: function () {//弹出页面加载完成
					 var iframe = this.getIFrameEl(); 
        			//调用弹出页面方法进行初始化
        			iframe.contentWindow.SetData(reportTypeMark); 
				},
				ondestroy: function (action) {//弹出页面关闭前,把新增的主体简称返回赋值给查询框
				}
			});
	}
	        //时间转换
	    	function dateTemp(oldData){
	    		oldData=oldData+"";
	    		if(oldData==0 || oldData=="" || oldData=="null"){
	    			return "";
	    		}
	    		
	    		var datas=oldData.indexOf("-");
	    		if(datas>=0){
	    			return oldData;
	    		}
	    		var yy=oldData.substr(0,4);//0开始，截取后面4位
	    		var mm=oldData.substr(4,2);//4开始，截取后面2位
	    		var dd=oldData.substr(6,2);
	    		
	    		return yy+"-"+mm+"-"+dd;
	    	}
	    	
	     var vcAbsTypes = [{ id: 1, text: '优先' }, { id: 2, text: '次级'}];	
	    	
	    //新增；若债券类别选择了资产支持证券，则出现ABS类型的细分选择，选项：优先、次级，必填项	
		function onAccountTypeChanged(e) { 
		
		     var vcAbsType=   nui.get("vcAbsType");
	         vcAbsType.setData();
	         vcAbsType.setRequired(false);
	         
	         
	        if(e.value == 'Q' || e.value == 'O' ){
		       document.getElementById( "mortInfo").style.display= "";
		       document.getElementById( "mortAmount").style.display= "";  
	        }else if(e.value == 'M1' || e.value == 'M2'|| e.value == 'M3'){
	       
	       
	         vcAbsType.setData(vcAbsTypes);
	         vcAbsType.setRequired(true);
	        
	        }else{
		       document.getElementById( "mortInfo").style.display= "none";
		       document.getElementById( "mortAmount").style.display= "none";  
		       
		       nui.get("vcMortStockName").setValue("");
		       nui.get("vcMortStockCode").setValue("");
		       nui.get("vcMortStockAmount").setValue("");
	        }
        }
        
        
        
        
        function onAccountTypeChanged1(eid) {
	        if(eid == 'Q' || eid == 'O' ){
		       document.getElementById( "mortInfo").style.display= "";
		       document.getElementById( "mortAmount").style.display= "";  
		       
	        }else{
		       document.getElementById( "mortInfo").style.display= "none";
		       document.getElementById( "mortAmount").style.display= "none";  
		       
		       nui.get("vcMortStockName").setValue("");
		       nui.get("vcMortStockCode").setValue("");
		       nui.get("vcMortStockAmount").setValue("");
	        }
        }
        //校验输入是否为正整数
	    function checkInt(number){
	            //验证输入是否为正数
		     	var reg = /^([0-9]+)(\.\d{1,4})?$/;
				if (!reg.test(number.value))
				{
					nui.alert("输入不能包含负数、字母、特殊字符，请输入正数！","系统提示");
					return;
				}
	     }
	     function checkIntValue(obj,name){  
	       var reg = new RegExp("^[0-9]*[1-9][0-9]*$");  
		    if(!reg.test(obj.value)){ 
		        nui.alert("请检查数据,该项只能输入整数!");  
		        nui.get(name).setValue("");
		        return;
		    }  
	  }
	     //查询净值规模和发行存量 
        function queryScaleDaet(){
        	var vcProductCode = productCombo.getValue();
        	var lIssuerId =  nui.get("lookup").getValue();
        	var json = nui.encode({vcProductCode : vcProductCode,lIssuerId : lIssuerId});

	        $.ajax({
	            url:"com.cjhxfund.ats.fm.instr.atsFmBiz.getVfundasset.biz.ext",
	            type:'POST',
	            data:json,
	            cache:false,
	            async:false,
	            contentType:'text/json',
	            success:function(text){
	                var returnJson = nui.decode(text);
	                if(returnJson.returnCode != 1){
		                if(null == returnJson.enFundValue[0].ENFUNDVALUE){
		                	nui.get("enNetScale").setValue(0);
		                }else{
		                	nui.get("enNetScale").setValue(returnJson.enFundValue[0].ENFUNDVALUE/10000);
		                	formatNumberCommon("enNetScale",4);
		                }
		                if(null == returnJson.fsumamount[0].FSUMAMOUNT){
		                	nui.get("fsumamount").setValue(0);
		                }else{
		                	nui.get("fsumamount").setValue(returnJson.fsumamount[0].FSUMAMOUNT);
		                }
		             }else{
	                   nui.get("enNetScale").setValue(0);
	                   nui.get("fsumamount").setValue(0);
	               }
	                BondAccountedCalculation();
	           }
			});
        }
         //人工风控控制计算比例值
		function BondAccountedCalculation(){
			var enIssueBalance = nui.get("enIssueBalance").getValue().replace(/,/gi,'');        //发行规模
			var form = new mini.Form("#dataform1");
			//vcMainUnderwriter form.validate()后重新赋值，解决校验后值消失问题
			var vcMainUnderwriter=nui.get("stockissueinfo.vcMainUnderwriter").getValue();
			var vcDeputyUnderwriter=nui.get("stockissueinfo.vcDeputyUnderwriter").getValue();
			var vcGroupUnderwriter=nui.get("stockissueinfo.vcGroupUnderwriter").getValue();
			var vcMainUnderwriterId=nui.get("vcMainUnderwriterId").getValue();
			var vcDeputyUnderwriterId=nui.get("vcDeputyUnderwriterId").getValue();
			var vcGroupUnderwriterId=nui.get("vcGroupUnderwriterId").getValue();
			var hlRivalId=nui.get("hlRivalId").getValue();
			form.validate();
			nui.get("stockissueinfo.vcMainUnderwriter").setValue(vcMainUnderwriter);
		    nui.get("stockissueinfo.vcDeputyUnderwriter").setValue(vcDeputyUnderwriter);
		    nui.get("stockissueinfo.vcGroupUnderwriter").setValue(vcGroupUnderwriter);
		    nui.get("vcMainUnderwriterId").setValue(vcMainUnderwriterId);
		    nui.get("vcDeputyUnderwriterId").setValue(vcDeputyUnderwriterId);
		    nui.get("vcGroupUnderwriterId").setValue(vcGroupUnderwriterId);
		    nui.get("hlRivalId").setValue(hlRivalId);
			if(form.isValid() == false){
				nui.alert("有数据为空或者格式不对，请确认！");
				return;
			}
			var reportData= getReportDatagrid(grid,form);
			if(reportData==false){
				//数据不通过校验
				return;
			}
			var data = form.getData(false,true);      //获取表单多个控件的数据
		    var enInvestBalance = getReportBidInfo(reportData.applyInstReport,data.applyInst).enInvestBalance; 	    //投标金额		   
		    var enNetScale = nui.get("enNetScale").getValue().replace(/,/gi,'');  				//净值规模
		    var enCategoryMoney = nui.get("fsumamount").getValue().replace(/,/gi,'');      		//债券存量		
		    //当发行规模与投标金额不为空并且不为0时计算该笔债券投资占发行规模比例
			//公式为投标金额/发行规模
			if(enIssueBalance != "" && enInvestBalance != "" && enIssueBalance != 0 && enInvestBalance != 0){
			   nui.get("enInvestScaleRatio").setValue(((enInvestBalance/(enIssueBalance * 10000)) * 100).toFixed(6));
			}else{
			   nui.get("enInvestScaleRatio").setValue(0);
			}
			       
			//当投标金额、债券存量与净值规模都不为空并且都不为0时计算同一发行人占产品净值规模比例
			//公式为(本次投标金额+主体发行债券存量)/净值规模
			if(enNetScale != "" && (enInvestBalance != "" || enCategoryMoney != "")){
			    if(enNetScale != 0){
			       nui.get("enIssuerNetRatio").setValue((((Number(enInvestBalance) + Number(enCategoryMoney))/enNetScale) * 100).toFixed(6));
			    }
			}else{
			   nui.get("enIssuerNetRatio").setValue(0);
			}
			       
			//当净值规模与投标金额不为空并且不为0时计算该笔债券投资占产品净值规模比例
			//公式为投标金额/净值规模
			if(enNetScale != "" && enInvestBalance != "" && enNetScale !=0 && enInvestBalance != 0){
			   nui.get("enInvestNetRatio").setValue(((enInvestBalance/enNetScale) * 100).toFixed(6));
			}else{
			   nui.get("enInvestNetRatio").setValue(0);
			}	
		}
		//风控试算
		function windControlTrial(){
		
			//获取表单提交数据
			var form = new mini.Form("#dataform1"); 
			
			//vcMainUnderwriter form.validate()后重新赋值，解决校验后值消失问题
			var vcMainUnderwriter=nui.get("stockissueinfo.vcMainUnderwriter").getValue();
			var vcDeputyUnderwriter=nui.get("stockissueinfo.vcDeputyUnderwriter").getValue();
			var vcGroupUnderwriter=nui.get("stockissueinfo.vcGroupUnderwriter").getValue();
			var vcMainUnderwriterId=nui.get("vcMainUnderwriterId").getValue();
			var vcDeputyUnderwriterId=nui.get("vcDeputyUnderwriterId").getValue();
			var vcGroupUnderwriterId=nui.get("vcGroupUnderwriterId").getValue();
			var hlRivalId=nui.get("hlRivalId").getValue();
			form.validate();
			nui.get("stockissueinfo.vcMainUnderwriter").setValue(vcMainUnderwriter);
		    nui.get("stockissueinfo.vcDeputyUnderwriter").setValue(vcDeputyUnderwriter);
		    nui.get("stockissueinfo.vcGroupUnderwriter").setValue(vcGroupUnderwriter);
		    nui.get("vcMainUnderwriterId").setValue(vcMainUnderwriterId);
		    nui.get("vcDeputyUnderwriterId").setValue(vcDeputyUnderwriterId);
		    nui.get("vcGroupUnderwriterId").setValue(vcGroupUnderwriterId);
		    nui.get("hlRivalId").setValue(hlRivalId);
			if(form.isValid() == false){
				nui.alert("有数据为空或者格式不对，请确认！");
				return;
			}
			
			//存储报量信息
			var applyInstReport=new Array();
			var reportData=getReportDatagrid(grid,form);
			
			if(reportData==false){
				//数据不通过校验
				return;
			}
			
			//赋值获取报量相关信息
			/*vcInvestCount=reportData.vcInvestCount;
			vcInterestRate=reportData.vcInterestRate;*/
			
			applyInstReport=reportData.applyInstReport;
			
			var data = form.getData(false,true);      //获取表单多个控件的数据
			var stockissueinfo,applyInst;
			stockissueinfo=data.stockissueinfo;
			applyInst=data.applyInst;
			
			var applyInst=getReportBidInfo(reportData.applyInstReport,applyInst);
		    
			//组装时间
			var sBidLimitTime=nui.get("dApplicationDate").text + " " + nui.get("dApplicationTimeHH").text+":"+nui.get("dApplicationTimeMM").text+":00";
			applyInst.dBidLimitTime=sBidLimitTime;//投标截止日
			applyInst.lBizId = bizId;  //业务主表
			applyInst.vcIssuePrice=stockissueinfo.vcIssuePrice;//发行价格
			applyInst.enInterestRate=stockissueinfo.enFaceRate;//投标利率--票面利率
			applyInst.enCouponRate=stockissueinfo.enFaceRate;//票面利率--票面利率
			applyInst.enPayInteval=stockissueinfo.vcFrequency;//付息频率
			
			applyInst.enInvestBalance=applyInst.enInvestBalance;//投标金额
			applyInst.enInterestRate=applyInst.enInterestRate;//投标利率
				
			//applyInst.enInterestRate=applyInstReport.enInterestRate;
			
			applyInst.vcStockNameFull=stockissueinfo.vcStockNameFull;
			
			applyInst.vcBusinessObject=nui.get("hlRivalId").getValue();//交易对手需要传ID
			//获取附件数量
			var attachCount = getAttachCount(bizId);
			applyInst.lAttchCount=attachCount;//通过查询获取该zhi
			var PcMarketNo=applyInst.vcPaymentPlace;
	 		//债券表登记托管机构转换
	 		if(PcMarketNo==3){
		        PcMarketNo=1;
		    }else if(PcMarketNo==4){
		        PcMarketNo=2;
		     }else{
		        PcMarketNo=5;
		     }
	 		applyInst.cMarketNo=PcMarketNo;//交易市场

			 //序列化成JSON
			var json = mini.encode({applyInst:applyInst}); 
			form.loading();//加载遮罩
			//提交
			nui.ajax({
			    url: "com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.windControlTrial.biz.ext",
			    type: "post",
			    data: json,
			    dataType:"json",
			    success: function (text) {
			    	var returnJson = nui.decode(text);
			    	form.unmask();//取消遮罩
			    	if(returnJson.returnCode == 4){
		    			var userName='<%=userId %>';          //拼音ID
	                    //获得当前参与者
						var json = nui.encode({userId:userName});
						$.ajax({
							url:"com.cjhxfund.ats.fm.instr.FirstGradeBond.isDealer.biz.ext",
							type:'POST',
							data:json,
							cache:false,
							async:false,
							contentType:'text/json',
							success:function(text){
						       //1为交易员
					           if(text.isInvestment==1){
						           nui.confirm("O32没有该债券，是否将债券推送至待导出O32列表！","系统提示",function(action){
					    				if(action=="ok"){
					    					var lStockIssueId=nui.get("stockissueinfo.lStockIssueId").getValue();
					    					//调用推送喔O32方法
					    					exportTempUtil(lStockIssueId);
					    				}
					    			});
					    			return;
						        }else{
						    	    nui.alert(returnJson.rtnMsg,"系统提示");
						            return;
		    					}
							}
						});	
		    		}else if(returnJson.returnCode == 0){
		    			if(returnJson.ishave==false){
			    			nui.alert("O32没有该债券，只能调用本地风控！","系统提示",function (){
			    				nui.alert("风控试算成功,未触发风控。","系统提示");
			    			});
		    			}else{
		    				nui.alert("风控试算成功,未触发风控。","系统提示");
		    			}
			    	 	return;
			    	}else if (returnJson.returnCode == -1){
			    			nui.alert(returnJson.rtnMsg,"系统提示");
			    			return;
			    	}else if(returnJson.returnCode != 0){
			    	
			    		if(checkRiskRet(returnJson.riskMsg)==false){
			    			return;
			    		}
			    		//判断债券是否存在o32
			    		if(returnJson.ishave==false){
			    			nui.alert("O32没有该债券，只能调用本地风控！","系统提示",function (){
			    			
			    				nui.open({
				    	  			url: "<%=request.getContextPath() %>/fix/riskApiControlDetailList.jsp",
				                    title: "风控试算反馈消息展示", width: 800, height: 390,
				                    onload: function () {
				                        //弹出页面加载完成
					                    var iframe = this.getIFrameEl();
					                    iframe.contentWindow.SetData(returnJson.riskMsg,3);
				                    },
				                    ondestroy: function (action) {//弹出页面关闭前
					                 
				                	}
			    	  			});
			    			});
		    	  			
			    		}else{
			    			nui.open({
				    	  			url: "<%=request.getContextPath() %>/fix/riskApiControlDetailList.jsp",
				                    title: "风控试算反馈消息展示", width: 800, height: 390,
				                    onload: function () {
				                        //弹出页面加载完成
					                    var iframe = this.getIFrameEl();
					                    iframe.contentWindow.SetData(returnJson.riskMsg,3);
				                    },
				                    ondestroy: function (action) {//弹出页面关闭前
					                 
				                	}
			    	  		});
			    		}
		    			
			    		
			    	}
			    	   
			    }
			});
			
		}
		//查询附件个数
		function getAttachCount(bizid){
			var json = nui.encode({lbizid : bizid});
			var attachCount = null;
			$.ajax({
				url:"com.cjhxfund.ats.fm.baseinfo.attachInfoManager.queryAttachCount.biz.ext",
				type:'POST',
				data:json,
				cache:false,
				async: false,
				contentType:'text/json',
				success:function(data){
					attachCount = data.attachCount;
				}
			});
			return attachCount;
		}
		function onCloseClickValueEmpty1(e){
			//赎回权
			nui.get("stockissueinfo.cIsHaveBuyback").setValue("0");
			readonlyInput("stockissueinfo.cIsHaveBuyback","stockissueinfo\\.cIsHaveBuyback");
			//回售权
			nui.get("stockissueinfo.cIsHaveSaleback").setValue("0");
			readonlyInput("stockissueinfo.cIsHaveSaleback","stockissueinfo\\.cIsHaveSaleback");
			onCloseClickValueEmpty(e);
		}
		function checkvcSpecialText(e){
		   var cIsHave=e.value;
		   if(cIsHave.indexOf("2") >= 0){
           		//赎回权
           		nui.get("cIsHaveBuyback").setValue("1");
           		readonlyInput("cIsHaveBuyback","cIsHaveBuyback");
           	}else{
           	   //赎回权
           		nui.get("cIsHaveBuyback").setValue("0");
           		addInput("cIsHaveBuyback","cIsHaveBuyback");
           	}
           	if(cIsHave.indexOf("1") >= 0){
	           	//回售权
	           	nui.get("cIsHaveSaleback").setValue("1");
	           	readonlyInput("cIsHaveSaleback","cIsHaveSaleback");
           	}else{
           	    //回售权
	           	nui.get("cIsHaveSaleback").setValue("0");
	           	addInput("cIsHaveSaleback","cIsHaveSaleback");
           	}
		}
		
		var isReadonly = true;
		var checkrole = "";
		//判断角色，交易员可以修改新债信息0:投资经理,1:交易员,2:投顾
		$(function(){
				$.ajax({
					url:"com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.queryTAtsProductInfo.biz.ext",
					type:'POST',
					data:null,
					cache:false,
					async:false,
					contentType:'text/json',
					success:function(result){
					var returnJson = nui.decode(result);
						var data = returnJson.data;
						checkrole = returnJson.checkrole;
						if(data != null){
							productCombo.setData(data);
						}
						if(checkrole == "1"){
							readonlyCleanAndRequired();
							isReadonly = false;
						}
						
						if(isReadonly ==  true){
							//非纸质指令隐藏
							$("#attachmentListShow").hide();
						}
					}
				});
		});
		
		//清理有债券的禁用信息
		function readonlyCleanAndRequired(){
			//债券类型stockissueinfo.vcStockType
			addInput("stockissueinfo.vcStockType","stockissueinfo\\.vcStockType");
			$("#stockissueinfo\\.vcStockType").addClass("mini-required");//添加必填样式
			nui.get("stockissueinfo.vcStockType").setRequired(true);//添加必填
			//债券代码
			addInput("applyInst.vcStockCode","applyInst\\.vcStockCode");
			//$("#applyInst\\.vcStockCode").addClass("mini-required");//添加必填样式
			//nui.get("applyInst.vcStockCode").setRequired(true);//添加必填
			
			//债券简称
			addInput("vcStockName","vcStockName");
			$("#vcStockName").addClass("mini-required");//添加必填样式
			nui.get("vcStockName").setRequired(true);//必填
			
			//债券全称
			addInput("vcStockNameFull","vcStockNameFull");
			$("#vcStockNameFull").addClass("mini-required");//添加必填样式
			nui.get("vcStockNameFull").setRequired(true);//必填
			$("#vcStockNameFull_lab").show();
			//赎回权
			addInput("cIsHaveBuyback","cIsHaveBuyback");
			//回售权
			addInput("cIsHaveSaleback","cIsHaveSaleback");
			
			//债券评级机构
			addInput("vcBondAppraiseOrgan","vcBondAppraiseOrgan");
			$("#vcBondAppraiseOrgan").addClass("mini-required");//添加必填样式
			nui.get("vcBondAppraiseOrgan").setRequired(true);//必填
			$("#vcBondAppraiseOrgan_lab").show();
			//主体评级机构
			addInput("vcIssueAppraiseOrgan","vcIssueAppraiseOrgan");
			$("#vcIssueAppraiseOrgan").addClass("mini-required");//添加必填样式
			nui.get("vcIssueAppraiseOrgan").setRequired(true);//必填
			$("#vcIssueAppraiseOrgan_lab").show();
			
			//债券评级
			addInput("cBondAppraise","cBondAppraise");
			$("#cBondAppraise").addClass("mini-required");//添加必填样式
			nui.get("cBondAppraise").setRequired(true);//必填
			$("#cBondAppraise_lab").show();
			//发行期限
			addInput("enExistLimite","enExistLimite");
			$("#enExistLimite").addClass("mini-required");//添加必填样式
			nui.get("enExistLimite").setRequired(true);//必填
			$("#enExistLimite_lab").show();
			//主体评级
			addInput("cIssueAppraise","cIssueAppraise");
			$("#cIssueAppraise").addClass("mini-required");//添加必填样式
			nui.get("cIssueAppraise").setRequired(true);//必填
			$("#cIssueAppraise_lab").show();
			//发行规模
			addInput("enIssueBalance","enIssueBalance");
			$("#enIssueBalance").addClass("mini-required");//添加必填样式
			nui.get("enIssueBalance").setRequired(true);//必填
			$("#enIssueBalance_lab").show();
			//发行主体
			addInput("lookup","lookup");
			$("#lookup").addClass("mini-required");//添加必填样式
			nui.get("lookup").setRequired(true);//必填
			$("#lIssuerId_lab").show();
			//特殊条款
			addInput("vcSpecialText","vcSpecialText");
			//特殊期限
			addInput("vcSpecialLimite","vcSpecialLimite");
			//主体类型
			addInput("vcIssueProperty","vcIssueProperty");
			//所属行业（证监会二级）
			addInput("vcIssueAppraiseCsrc","vcIssueAppraiseCsrc");
			//公司净资产
			addInput("enIssuerNetValue","enIssuerNetValue");
			//城投行政级别
			addInput("vcCityLevel","vcCityLevel");
			//下一利率跳升点数
			addInput("lNInterestRateJumpPoints","lNInterestRateJumpPoints");
		}
	    function editorFile(){
	    	var  rows = nui.get("file_grid").getSelecteds();   //获取选中的附件信息
			if(rows.length == 0){
				nui.alert("请选择一条附件！","系统提示");
	    		return;
			}
			if(rows.length > 1){
				nui.alert("只能选择一条附件！","系统提示");
	    		return;
			}
			
	    	var type = 4;  //文档编辑类型
	    	var vcProductCode = nui.get("vcProductCode").getValue(); //产品编号
	    	var lBizId = bizId;  //业务ID
	    	
	    	if(vcProductCode==null || vcProductCode==""){
	    		nui.alert("请先选择产品信息，才能打开附件查阅。","系统提示");
	    		return;
	    	}
	    	var vcStockCode = nui.get("applyInst.vcStockCode").getValue();
	    	var vcStockName = nui.get("vcStockName").getValue();
	    	var cApplyInstType = nui.get("cApplyInstType").getValue();
	    	for(var i = 0;i<rows.length;i++){
	    		//encodeURI 可解决IE的url中文乱码问题
		    	var actionURL = encodeURI(contextPath + "/commonUtil/iWebOffice/Judgment_document_type.jsp?sysid="+rows[i].lAttachId+"&fileName="+rows[i].vcAttachName+"&type="+type+"&vcProductCode="+vcProductCode+"&vcStockName="+vcStockName+"&vcStockCode="+vcStockCode+"&bizId="+lBizId+"&cApplyInstType="+cApplyInstType); //目标页面
		    
		    	var winFrm=document.openForm;
		    	winFrm.action=actionURL;
		    	var newwin = window.open('about:blank', 'newWindow'+lBizId);
				winFrm.target = 'newWindow'+lBizId;//这一句是关键
				winFrm.submit();
    	   }     
    }
    function loademployeeGrid(){ 
    	//用印附件列表 设置参数
		nui.get("mapBizId").setValue(bizId);
		//附件列表查询
    	var file_grid = nui.get("file_grid");
		var file_Form = new nui.Form("#file_Form").getData(false,false);
		file_grid.load(file_Form);
     }
     //刷新附件列表
	function refreshFile(){
		//用印附件列表 设置参数
		nui.get("mapBizId").setValue(bizId);
		//附件列表
		var file_grid = nui.get("file_grid");
		var file_Form = new nui.Form("#file_Form").getData(false,false);
		file_grid.load(file_Form);
	}
	//生成申购函
     function generateFile(processInstID,bizId,stockInvestNo){
     	//console.log("生成申购函");
     	var productCode = nui.get("vcProductCode").getValue();
     	var params = new Array();
 		var map = {};
 		map['bizId']=bizId;
 		map['processInstId']=processInstID;
 		map['stockInvestNo']=stockInvestNo;
 		params[0] = map;
 		var json1 = nui.encode({templateFilePath:templeatePath,productCode:productCode,params:params});
 		//console.log("json1 = "+json1);
		$.ajax({
			  url:'com.cjhxfund.ats.fm.instr.FirstGradeBond.generatePurchaseOrder.biz.ext',
			  type:'POST',
			  data:json1,
			  cache:false,
			  contentType:'text/json',
			  success:function(data){
				  var returnJson = nui.decode(data);
				  if(returnJson.exception == null){
	              	//nui.alert("申购函生成成功");
	              	//console.log(returnJson.attachmentIds);
	              	window.parent.frames[0].location.reload();
		          }else{
		            nui.alert("申购函生成失败");
		          }
			  }
		  });
     	
     }
     var templeatePath=null; 
    function generatePurchaseOrder(){
    	var form = new mini.Form("#dataform1");
     	//vcMainUnderwriter form.validate()后重新赋值，解决校验后值消失问题
		var vcMainUnderwriter=nui.get("stockissueinfo.vcMainUnderwriter").getValue();
		var vcDeputyUnderwriter=nui.get("stockissueinfo.vcDeputyUnderwriter").getValue();
		var vcGroupUnderwriter=nui.get("stockissueinfo.vcGroupUnderwriter").getValue();
		var vcMainUnderwriterId=nui.get("vcMainUnderwriterId").getValue();
		var vcDeputyUnderwriterId=nui.get("vcDeputyUnderwriterId").getValue();
		var vcGroupUnderwriterId=nui.get("vcGroupUnderwriterId").getValue();
		var hlRivalId=nui.get("hlRivalId").getValue();
		form.validate();
		nui.get("stockissueinfo.vcMainUnderwriter").setValue(vcMainUnderwriter);
	    nui.get("stockissueinfo.vcDeputyUnderwriter").setValue(vcDeputyUnderwriter);
	    nui.get("stockissueinfo.vcGroupUnderwriter").setValue(vcGroupUnderwriter);
	    nui.get("vcMainUnderwriterId").setValue(vcMainUnderwriterId);
	    nui.get("vcDeputyUnderwriterId").setValue(vcDeputyUnderwriterId);
	    nui.get("vcGroupUnderwriterId").setValue(vcGroupUnderwriterId);
	    nui.get("hlRivalId").setValue(hlRivalId);
		if(form.isValid() == false){
			nui.alert("有数据为空或者格式不对，请确认！");
			return;
		}
    
		//无债券时验证
	    if(biztype==1){
	    	nui.alert("无债券申购录入，提交流程后转至新债投标页面生成申购函!","提示");
    			return;
    		//暂不支无债券生成申购函，以下代码暂时废弃
			var data = form.getData(false,true);
			var stockissueinfo=data.stockissueinfo;
			var bizprocess=data.bizProcess;
			var applyInst=data.applyInst;
			stockissueinfo.lStockInvestNo=applyInst.lStockInvestNo;//证券投资编号
			stockissueinfo.vcStockCode=applyInst.vcStockCode;//债券代码
			stockissueinfo.vcStockName=applyInst.vcStockName;//债券简称
			stockissueinfo.cStatus=0;//新债发行数据状态,0草稿，2有效
			stockissueinfo.lValidStatus=0;//指令/建议单状态
			//验证非空
			if(stockissueinfo.enExistLimite==""){
				stockissueinfo.enExistLimite=0;
			}
			if(stockissueinfo.enIssueBalance==""){
				stockissueinfo.enIssueBalance=0;
			}
			stockissueinfo.vcPaymentPlace=applyInst.vcPaymentPlace;//登记托管机构
			var PcMarketNo=applyInst.vcPaymentPlace;
			//债券表登记托管机构转换
			if(PcMarketNo==3){
				PcMarketNo=1;
			}else if(PcMarketNo==4){
				PcMarketNo=2;
			}else{
				PcMarketNo=5;
			}
			stockissueinfo.cMarketNo=PcMarketNo;//交易市场
			bizprocess.vcProcessType=5;//流程类型:1-一级债券申购,2-新债录入,3-新债修改,4-新债查重,5-一级债无债券申购
			bizprocess.vcAbstract="一级债无债券申购";
			var sBidLimitTime=nui.get("dApplicationDate").text + " " + nui.get("dApplicationTimeHH").text+":"+nui.get("dApplicationTimeMM").text+":00";
			stockissueinfo.dBidLimitTime=sBidLimitTime;
			stockissueinfo.lIssueBeginDate=getIntDate(stockissueinfo.lIssueBeginDate);//发行日期
			stockissueinfo.lNextExerciseDate = stockissueinfo.lNextExerciseDate.replace(/-/gi,'').substr(0,8); //下一行权日
			bizprocess.lProcessInstId=processInstID=="null"?"":processInstID;
			var json1 = nui.encode({stockIssueInfo:stockissueinfo,saveType:'1',bizprocess:bizprocess});
			nui.confirm("当前为无债券录入，是否保存债券信息？","缴款提示",function(act){
				if(act=="ok"){
					$.ajax({
			            url:'com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.saveDraftStockIssueInfo.biz.ext',
			            type:'POST',
			            data:json1,
			            cache:false,
			            contentType:'text/json',
			            success:function(data){
         					var templateQueryParams = new Array();
					 		var queryMap={};
					 		queryMap['stockInvestNo'] = nui.get("applyInst.lStockInvestNo").getValue();
					 		templateQueryParams[0] = queryMap;
					     	var json = nui.encode({templateQueryParams:templateQueryParams});
					     	//console.log("json = " + json);
					     	$.ajax({
						            url:'com.cjhxfund.ats.fm.baseinfo.tatsstocktemplatebiz.queryTemplateFilePath.biz.ext',
						            type:'POST',
						            data:json,
						            cache:false,
						            contentType:'text/json',
						            success:function(data){
						             	var returnJson = nui.decode(data);
					             		if(returnJson.templateFilePath=="erro"){
						         			nui.alert("选中的债券对应多个申购函模板。");
						         			generateFileSwitch=false;
						         			return;
						         		}
						         		if(returnJson.templateFilePath==null||returnJson.templateFilePath=="null"){
						         			nui.alert("选中的债券还没有配置对应的申购函模板。");
						         			generateFileSwitch=false;
						         			return;
								     	}
								     	templeatePath=returnJson.templateFilePath;
								     	nui.confirm("保存该页面后会自动生成申购函","申购提示",function(act){
											if(act=="ok"){
												generateFileSwitch=true;
												//console.log("生成申购函");
											}else{
												generateFileSwitch=false;
											}
										});
						     		}
					 			});
     					}
 					});
				}
				//关闭界面
				return;
			});
		}else{
			var templateQueryParams = new Array();
	 		var queryMap={};
	 		queryMap['stockInvestNo'] = nui.get("applyInst.lStockInvestNo").getValue();
	 		templateQueryParams[0] = queryMap;
	     	var json = nui.encode({templateQueryParams:templateQueryParams});
	     	//console.log("json = " + json);
	     	$.ajax({
		            url:'com.cjhxfund.ats.fm.baseinfo.tatsstocktemplatebiz.queryTemplateFilePath.biz.ext',
		            type:'POST',
		            data:json,
		            cache:false,
		            contentType:'text/json',
		            success:function(data){
		             	var returnJson = nui.decode(data);
	             		if(returnJson.templateFilePath=="erro"){
		         			nui.alert("选中的债券对应多个申购函模板。");
		         			generateFileSwitch=false;
		         			return;
		         		}
		         		if(returnJson.templateFilePath==null||returnJson.templateFilePath=="null"){
		         			nui.alert("选中的债券还没有配置对应的申购函模板。");
		         			generateFileSwitch=false;
		         			return;
				     	}
				     	templeatePath=returnJson.templateFilePath;
				     	nui.confirm("保存该页面后会自动生成申购函","申购提示",function(act){
							if(act=="ok"){
								generateFileSwitch=true;
								//console.log("生成申购函");
							}else{
								generateFileSwitch=false;
							}
						});
		     		}
	 			});

		}
     }
    </script>
</body>
</html>