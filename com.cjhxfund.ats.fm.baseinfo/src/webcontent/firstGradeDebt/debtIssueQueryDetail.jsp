<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/common/js/commscripts.jsp" %>

<!-- 
  - 黄燕
  - Description:
-->
<head>
<title>详细信息查看</title>
    <style type="text/css">
      .td1{
        border-right: 1px solid #D3D3D3;
        border-left: 1px solid #D3D3D3;
      }
      .td2{
        border-right: 1px solid #D3D3D3;
      }
      .asLabel .mini-textbox-input{
        color: red;
        background:none;cursor:default;
      }
      .asLabel_gray .mini-textbox-input{
         color: black;
         background:none;cursor:default;
      }
      
      .p{
           border-bottom: 1px solid #D3D3D3;     
        }
        P{
          margin: 0px;padding: 0px;
        }

    </style>
</head>

<%
    /* Object rootObj= com.eos.web.taglib.util.XpathUtil.getDataContextRoot("request", pageContext); 
    String pid = (String)com.eos.web.taglib.util.XpathUtil.getObjectByXpath(rootObj,"processinstid");
    String workItemID =(String)com.eos.web.taglib.util.XpathUtil.getObjectByXpath(rootObj,"workItemID");
    String bizId = (String)com.eos.web.taglib.util.XpathUtil.getObjectByXpath(rootObj,"bizId");
    String investNo = (String)com.eos.web.taglib.util.XpathUtil.getObjectByXpath(rootObj,"investNo");  */
    String pid = request.getParameter("lStockIssueId");
    String investNo = request.getParameter("lStockInvestNo");
 %>
<body style="width: 100%;height: 100%;overflow: hidden;">

   <div id="tabs" class="nui-tabs" style="width: 100%;height: 95%;">
   		<div title="基本信息">
		  	<div id="dataform1" style="padding-top:5px;">
              	<input class="nui-hidden" name="debtIssue.lOperatorNo"  />
              
	            <!-- hidden域 -->
	            <input class="nui-hidden" id="lStockIssueId"  name="debtIssue.lStockIssueId" />
	            <input class="nui-hidden" id="lBizId" name="debtIssue.lBizId"/>
	            <input class="nui-hidden" id="cStatus" name="debtIssue.cStatus"/>
	            <input class="nui-hidden" id="cSource" name="debtIssue.cSource"/>
	            <input class="nui-hidden" id="lStockInvestNo" name="debtIssue.lStockInvestNo"/>
	            <input class="nui-hidden" id="lValidStatus" name="debtIssue.lValidStatus"/>
	            <input class="nui-hidden" id="vcInterCode" name="debtIssue.vcInterCode"/>
	            <input class="nui-hidden" id="lDate" name="debtIssue.lDate"/>
	            <table style="width:100%;height:100%;table-layout:fixed;" class="nui-form-table">
	                <tr>
	                    <td class="form_label" align="right" width="20%" >
	                        	登记托管机构:
	                    </td>
	                    <td colspan="1" width="30%">
								<input class="nui-dictcombobox" 
	                           dictTypeId="CF_JY_DJTGCS"
	                          name="debtIssue.vcPaymentPlace" readonly="true"
	                         id="vcPaymentPlace" width="90%" />
	                    </td>
	                    <td class="form_label" align="right" width="15%">
	                        	利率类型:
	                    </td>
	                    <td colspan="1" width="30%">
	                    	 <input class="nui-dictcombobox" readonly="true" dictTypeId="rateType" width="90%" id="cInterestType" name="debtIssue.cInterestType"  />
	                    </td>
	                </tr>
	                <tr>
	                   <td class="form_label" align="right" width="20%">
	                       	 债券类别:
	                  </td>
	                  <td colspan="1" width="30%">
	                  	 <!--  <input class="nui-combobox"  readonly="true" width="90%" id="vcStockType" name="debtIssue.vcStockType"  textField="vcStocktypeName" valueField="cStockType"
	                     	     dataField="stockTypes"/> -->
	                     <input style="width: 90%;" id="vcStockType" readonly="true" name="debtIssue.vcStockType" class="mini-treeselect"  multiSelect="false" 
										        textField="text" valueField="id" parentField="pid" checkRecursive="false"  showFolderCheckBox="false"
										        url="com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadStockType.biz.ext" emptyText="全部" nullItemText="全部"
										        showFolderCheckBox="true"   expandOnLoad="true" showTreeIcon="false" showClose="true" 
										        popupWidth="200" oncloseclick="onCloseClickValueEmpty"/>
	                  </td>
	                  <td class="form_label" width="15%" align="right">
	                        	息票品种:
	                  </td>
	                  <td colspan="1" width="30%">
	                   	<input class="nui-dictcombobox" readonly="true" dictTypeId="payInterestType" width="90%" id="cPayInterestType" name="debtIssue.cPayInterestType"/>
	                  </td>
	                </tr>
	                <tr>
	                   <td class="form_label" align="right">
	                       	 债券代码:
	                    </td>
	                    <td colspan="1">
	                    		<input class="nui-textbox" readonly="true" id="vcStockCode"  width="90%" name="debtIssue.vcStockCode"/>
	                    </td>
	                    <td class="form_label" align="right">
	                        	付息频率(次/年):
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-dictcombobox" readonly="true" dictTypeId="ATS_CF_JY_FREQUENCY" id="enPayInteval"  width="90%" name="debtIssue.enPayInteval"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="form_label" align="right">
	                       	 债券简称:
	                    </td>
	                    <td colspan="1">
	                    		<input class="nui-textbox" readonly="true" id="vcStockName"  width="90%" name="debtIssue.vcStockName"/>
	                    </td>
	                    <td class="form_label" align="right">
	                        	债券评级:
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-dictcombobox" readonly="true" dictTypeId="creditRating"  id="cBondAppraise"  width="90%" name="debtIssue.cBondAppraise"/>
	                    </td>
	                </tr>
	                <tr>
	                     <td class="form_label" align="right">
	                        	债券全称:
	                    </td>
	                    <td colspan="1">
	                    	<input class="nui-textbox" id="vcStockNameFull" readonly="true" width="90%" name="debtIssue.vcStockNameFull"  />
	                    </td>
	                    <td class="form_label" align="right">
	                       	 债券评级机构:
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-dictcombobox" readonly="true" dictTypeId="outRatingOrgan"  width="90%" id="vcBondAppraiseOrgan" name="debtIssue.vcBondAppraiseOrgan" emptyText="---请选择---" nullItemText="---请选择---" showNullItem="true"/>
	                    </td>
	                </tr>
	                <tr id="tr1">
	                   <td class="form_label" align="right">
	                        	发行规模(亿):
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-textbox"  readonly="true" name="debtIssue.enIssueBalance" id="enIssueBalance" width="90%"  />
	                    </td>
	                     <td class="form_label" align="right">
	                        	发行期限(年):
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-textbox"  readonly="true" name="debtIssue.enExistLimite" id="enExistLimite"  width="90%" />
	                    </td>
	                </tr>
	                <tr  id="morStockNameAndCode">
	                    <td class="form_label  lableReq" align="right">
	                          股票名称:
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-textbox" name="debtIssue.vcMortStockName" readonly="true" id="vcMortStockName" width="90%" />
	                    </td>	                    
	                    <td class="form_label  lableReq" align="right">
	                          股票抵押数量(万股):
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-textbox" name="debtIssue.vcMortStockAmount" readonly="true" id="vcMortStockAmount" width="90%" />
	                    </td>
	                </tr>
	                <tr  id="morStockAmount">
	                    <td class="form_label   lableReq" align="right">
	                         股票代码:
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-textbox" name="debtIssue.vcMortStockCode" readonly="true" id="vcMortStockCode" width="90%" />
	                    </td>	                    
	                    
	                </tr>
	                 <tr id="tr1">
	                   <td class="form_label" align="right">
	                        	发行规模描述:
	                    </td>
	                    <td colspan="3">
	                    	<input class="nui-textarea" id="vcExistLimiteDesc" name="debtIssue.vcExistLimiteDesc" width="96%" readonly="true"/>
	                    </td>
	                </tr>
	                 
	                <tr>
	                    <td class="form_label" align="right">
	                       	 公告日:
	                    </td>
	                    <td colspan="1"> 
	                        <input class="nui-datepicker"  name="lIssuePostDate" id="lIssuePostDate" style="width: 90%;"  readonly="true"/>
	                    </td>
	                    <td class="form_label" align="right">
	                                                                                    主体简称:
	                    </td>
	                    <td colspan="1">
	                    	 <input class="nui-textbox"  id="vcIssuerName" readonly="true"  width="90%" name="debtIssue.vcIssuerName"/>
	                    	 <input  id="lIssuerId"  width="90%" class="nui-hidden" popupWidth="300" popupHeight="200" name="debtIssue.lIssuerId" searchField="name" dataField="issueInfos"
	                        	readonly="true" valueField="lIssuerId" onvaluechanged="enterSumbit" textField="vcIssueName" url="com.cjhxfund.ats.fm.baseinfo.IssueInfoManager.getIssueinfos.biz.ext"   enterQuery="false" onitemclick="issueInfoOnItemClick"/>
	                    </td>
	                </tr>
	                
	                 <tr>
	                    <td class="form_label" align="right">
	                       	 发行日:
	                    </td>
	                    <td colspan="1"> 
	                        <input class="nui-datepicker" name="lIssueBeginDate" id="lIssueBeginDate" style="width: 90%;"  readonly="true"/>
	                    </td>
	                    <td class="form_label" align="right">
	                                                                                   主体全称:
	                    </td>
	                    <td colspan="1">
	                    	 
	                    	 <!-- <input class="nui-hidden"  id="vcIssuerName" readonly="true"  width="90%" name="debtIssue.vcIssuerName"/> -->
	                    	 <input class="nui-textbox"  id="vcIssuerNameFull"  readonly="true"  width="90%" name="debtIssue.vcIssuerNameFull"/>
	                    </td>
	                </tr>
	                
	                <tr>
	                 	<td class="form_label" align="right">
	                       	 上市日期:
	                    </td>
	                    <td colspan="1"> 
	                        <input class="nui-datepicker" name="lPublishDate" id="lPublishDate" style="width: 90%;"  readonly="true"/>
	                    </td>
	                     <td class="form_label" align="right">
	                                                                                    主体评级:
	                    </td>
	                    <td colspan="1">
	                    	<input class="nui-dictcombobox" readonly="true"   dictTypeId="issuerRating" width="90%" id="cIssueAppraise"  name="debtIssue.cIssueAppraise" showNullItem="false"/>
	                    </td>
	                 </tr>
	                 
	                 <tr>
	                  	 <td class="form_label" align="right">
	                       	 起息日期:
	                    </td>
	                    <td colspan="1"> 
	                        <input class="nui-datepicker" name="lBegincalDate" id="lBegincalDate" style="width: 90%;"  readonly="true"/>
	                    </td>
	                    <td class="form_label" align="right">
	                                                                                    主体类型:
	                    </td>
	                    <td colspan="1">
	                    	<input  class="nui-dictcombobox" readonly="true"   dictTypeId="ATS_FM_ISSUE_PROPERTY" width="90%" id="vcIssueProperty" value="" name="debtIssue.vcIssueProperty" showNullItem="false"/>
	                    </td>
	                </tr>
	                
	                <tr>
	                	<td class="form_label" align="right">
	                       	 到期日期:
	                    </td>
	                    <td colspan="1"> 
	                        <input class="nui-datepicker" name="lEndincalDate" id="lEndincalDate" style="width: 90%;" readonly="true" />
	                    </td>
	                    <td class="form_label" align="right">
	                                                                                    主体评级机构:
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-dictcombobox" readonly="true"  dictTypeId="outRatingOrgan" width="90%" id="vcIssueAppraiseOrgan" name="debtIssue.vcIssueAppraiseOrgan" showNullItem="false"/>
	                    </td>
	                </tr>
	                
	                <tr>
	                 	<td class="form_label" align="right">
	                       	 缴款日期:
	                    </td>
	                    <td colspan="1"> 
	                        <input class="nui-datepicker" name="lPayDate" id="lPayDate" style="width: 90%;"  readonly="true"/>
	                    </td>
	                      <td class="form_label" align="right">
	                                                                                    所属行业:
	                    </td>
	                    <td colspan="1">
	                     	<!-- <input class="nui-textbox"  id="vcIndustry"  width="90%" name="debtIssue.vcIndustry" readonly="true" /> -->
	                     	<input style="width: 90%;" id="vcIndustry" name="debtIssue.vcIndustry" class="mini-treeselect"  multiSelect="false" 
										        textField="text" valueField="id" parentField="pid" checkRecursive="false" virtualScroll="true" 
										        expandOnLoad="true" showTreeIcon="false" showFolderCheckBox="true" allowInput="true" readonly="true" 
										        onvalidation="onComboValidation"/>
	                    </td>
	                </tr>
	                 <tr>
	                   <td class="form_label" align="right">
	                       	 发行方式:
	                    </td>
	                    <td colspan="1"> 
	                        <input class="nui-dictcombobox" dictTypeId="issueType" name="debtIssue.vcIssueType" readonly="true" id="vcIssueType" style="width: 90%;"  />
	                    </td> 
	                    <td class="form_label" align="right">
	                       	 所属省份:
	                    </td>
	                    <td colspan="1"> 
	                        <input class="nui-textbox"  id="vcProvince" width="90%" readonly="true"  name="debtIssue.vcProvince"/>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <td class="form_label" align="right">
	                       	 所属行业(证监会二级):
	                    </td>
	                    <td colspan="1"> 
	                        <!-- <input class="nui-textbox"  id="vcIssueAppraiseCsrc" width="90%" readonly="true" name="debtIssue.vcIssueAppraiseCsrc"/> -->
	                        <input style="width: 90%;" id="vcIssueAppraiseCsrc" name="debtIssue.vcIssueAppraiseCsrc" class="mini-treeselect"  multiSelect="false" 
										        textField="text" valueField="id" parentField="pid" checkRecursive="false" virtualScroll="true" 
										        expandOnLoad="true" showTreeIcon="false" showFolderCheckBox="true" allowInput="true" readonly="true" 
										        oncloseclick="onCloseClickValueEmpty" onvalidation="onComboValidation"/>
	                    </td>
	                    <td class="form_label" align="right">
	                       	 城投行政级别:
	                    </td>
	                    <td colspan="1"> 
	                        <input class="nui-dictcombobox" dictTypeId="cityLevel" id="vcCityLevel" width="90%" readonly="true" name="debtIssue.vcCityLevel"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="form_label" align="right">
	                       	 下一利率跳升点数(BP):
	                    </td>
	                    <td colspan="1"> 
	                        <input class="nui-textbox" onblur="check(this)" id="lNInterestRateJumpPoints" width="90%" readonly="true" name="debtIssue.lNInterestRateJumpPoints"/>
	                    </td>
	                    <td class="form_label" align="right">
	                       	 公司净资产(元):
	                    </td>
	                    <td colspan="1"> 
	                        <input class="nui-textbox"  vtype="float" onblur="check(this)" readonly="true" id="enIssuerNetValue" width="90%"  name="debtIssue.enIssuerNetValue"/>
	                    </td>
	                </tr>
	                <tr>
	                     <td class="form_label" align="right">
	                                                                                    主承销商:
	                    </td>
	                    <td colspan="3">
	                    	 <input class="nui-textbox"  id="vcMainUnderwriter" readonly="true"  width="96%" name="debtIssue.vcMainUnderwriter"/>
	                    	 <!-- <input  id="vcMainUnderwriter" readonly="true" width="90%" class="nui-autocomplete" popupWidth="300" popupHeight="200" name="debtIssue.vcMainUnderwriter" searchField="name" dataField="issueInfos"
	                        	valueField="vcIssueName" textField="vcIssueName" url="com.cjhxfund.ats.fm.baseinfo.IssueInfoManager.getIssueinfos.biz.ext"   enterQuery="false" onitemclick="issueInfoOnItemClick"/> -->
	                    </td>
	                </tr>
	                 <tr>
	                     <td class="form_label" align="right">
	                                                                                    副主承销商:
	                    </td>
	                    <td colspan="3">
	                    	 <input class="nui-textbox"  id="vcDeputyUnderwriter" readonly="true"  width="96%" name="debtIssue.vcDeputyUnderwriter"/>
	                    	 <!-- <input  id="vcDeputyUnderwriter"  width="90%" class="nui-autocomplete" popupWidth="300" popupHeight="200" 
	                    	 	name="debtIssue.vcDeputyUnderwriter" searchField="name" dataField="issueInfos"
	                        	valueField="vcIssueName" onvaluechanged="enterSumbit" textField="vcIssueName" 
	                        	url="com.cjhxfund.ats.fm.baseinfo.IssueInfoManager.getIssueinfos.biz.ext"  
	                        	value="" text="" enterQuery="false" readonly="true"/> -->
	                    </td>
	                </tr>
	                <tr>
	                    <td class="form_label" align="right">
	                       	 缴款方式:
	                    </td>
	                    <td colspan="1"> 
	                        <input class="nui-dictcombobox" readonly="true" dictTypeId="ATS_FM_PAYMENT" width="90%" id="cPayType" name="debtIssue.cPayType" showNullItem="false"/>
	                    </td>
	                     <td class="form_label" align="right">
	                                                                                    承销方式:
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-dictcombobox"  readonly="true" dictTypeId="underwriteType" width="90%" id="cUnderwriteType" name="debtIssue.cUnderwriteType" showNullItem="false"/>
	                    </td>
	                </tr>
	                <tr>
	                  	<td class="form_label" align="right">
	                       	投标截止时间:
	                    </td>
	                     <td colspan="1"> 
	                    	<input class="nui-datepicker" name="debtIssue.dBidLimitTime" readonly="true" id="dBidLimitTime" style="width: 100px;"  />
	                    	<input style="width: 40px;" url="<%=request.getContextPath() %>/fm/instr/processUtil/timeHH.txt" readonly="true" class="nui-dictcombobox"  id="dApplicationTimeHH" />时
			    			<input style="width: 40px;" url="<%=request.getContextPath() %>/fm/instr/processUtil/timeMM.txt"  readonly="true" class="nui-dictcombobox"  id="dApplicationTimeMM" />分
	                    </td>
	                    <td class="form_label" align="right">
	                                                                                    投标区间:
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-textbox" name="debtIssue.vcTenderInterval" id="vcTenderInterval" width="90%" readonly="true"/>
	                    </td>
	                </tr>
	                <tr id="tr1">
	                   <td class="form_label" align="right">
	                        	发行日期描述:
	                    </td>
	                    <td colspan="3">
	                    	<input class="nui-textarea" id="vcIssueBeginDateDesc" name="debtIssue.vcIssueBeginDateDesc" width="96%" readonly="true"/>
	                    </td>
	                </tr>
	                <tr id="tr1">
	                   <td class="form_label" align="right">
	                        	承销商联系人信息:
	                    </td>
	                    <td colspan="3">
	                    	<input class="nui-textarea" id="vcUnderwriterInfo" name="debtIssue.vcUnderwriterInfo" width="96%" readonly="true"/>
	                    </td>
	                 </tr>  
	                <tr>
	                <td class="form_label" align="right">
	                                                                                    承销团:
	                    </td>
	                     <td colspan="3">
	                    	<input class="nui-textbox"  id="vcGroupUnderwriter" readonly="true"  width="96%" name="debtIssue.vcGroupUnderwriter"/>
	                    </td>
	                </tr>
	                <tr>
	                 <td class="form_label" align="right">
	                        	特殊条款:
	                    </td>
	                    <td colspan="1">
	                    	<input class="nui-dictcombobox" dictTypeId="specialText" multiSelect="true" readonly="true" width="90%" id="vcSpecialText" name="debtIssue.vcSpecialText" />
	                    </td>
	                </tr>
	                 <tr id="tr1">
	                   <td class="form_label" align="right">
	                        	特殊条款说明:
	                    </td>
	                    <td colspan="3">
	                    	<input class="nui-textarea" readonly="true" id="vcSpecialTextDesc" name="debtIssue.vcSpecialTextDesc" width="96%"/>
	                    </td>
	                </tr>
	                
	                 <tr>
	                  	<td class="form_label" align="right">
	                                                                                    票面利率(%):
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-textbox" readonly="true" vtype="float" name="debtIssue.enFaceRate" id="enFaceRate" width="90%" />
	                    </td>
	                  	 <td class="form_label" align="right">
	                                                                                    招标方式:
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-dictcombobox" readonly="true" dictTypeId="tenderType" width="90%" id="cBidType" name="debtIssue.cBidType"  showNullItem="false"/>
	                    </td>
	                </tr>
	                <tr>
	                  <td class="form_label" align="right">
	                       	 担保人:
	                    </td>
	                    <td colspan="1"> 
	                    	<!-- input  id="lGuarantorId"  width="90%" class="nui-autocomplete" popupWidth="300" popupHeight="200" name="debtIssue.lGuarantorId" searchField="name" dataField="issueInfos"
	                        	readonly="true" valueField="lIssuerId" onvaluechanged="enterSumbit" textField="vcIssueName" url="com.cjhxfund.ats.fm.baseinfo.IssueInfoManager.getIssueinfos.biz.ext"  enterQuery="false" onitemclick="guarantorOnItemClick"/> -->
	                    	<!--  -->
	                    	<input class="nui-textbox" id="vcGuarantorName" readonly="true"  width="90%"  name="debtIssue.vcGuarantorName"/>
	                    </td>	 
	                  	 <td class="form_label" align="right">
	                                                                                    担保方式:
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-dictcombobox" readonly="true" dictTypeId="ATS_FM_ASSUER_TYPE" width="90%" id="cAssuerType" name="debtIssue.cAssureType"  showNullItem="false"/>
	                    </td>
	                </tr>
	                <tr>
	                 <td class="form_label" align="right">
	                                                                                    担保人简介:
	                    </td>
	                    <td colspan="3">
	                    	<input class="nui-textarea" readonly="true" name="debtIssue.vcGuarantorSummary"  id="vcGuarantorSummary" width="96%"/>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <td class="form_label" align="right">
	                       	 下一行权日:
	                    </td>
	                    <td colspan="1"> 
	                        <input class="nui-datepicker" name="lNextExerciseDate" id="lNextExerciseDate" style="width: 90%;" readonly="true" />
	                    </td>
	                    <td class="form_label" align="right">
	                                                                                    特殊期限:
	                    </td>
	                    <td colspan="1">
	                        <input class="nui-textbox" name="debtIssue.vcSpecialLimite" readonly="true" id="vcSpecialLimite" width="90%" />
	                    </td>
	                </tr>	                
	                <tr>
	                    <td class="form_label" align="right">
	                         是否具有赎回权:
	                    </td>
	                    <td colspan="1" class="radio-border-top-none">
							<input id="cIsHaveBuyback" readonly="true" name="debtIssue.cIsHaveBuyback" value="0" class="nui-radiobuttonlist" data="[{id: 1, text: '是'}, {id: 0, text: '否'}]"/>
	                    </td>
	                    <td class="form_label" align="right">
	                       	 是否具有回售权:
	                    </td>
	                    <td colspan="1" class="radio-border-top-none"> 
							<input id="cIsHaveSaleback" readonly="true" name="debtIssue.cIsHaveSaleback" value="0" class="nui-radiobuttonlist" data="[{id: 1, text: '是'}, {id: 0, text: '否'}]"/>
	                    </td>
	                </tr>
	                <tr>
	                 <td class="form_label" align="right">
	                                                                                   备注:
	                    </td>
	                    <td colspan="3">
	                    	<input class="nui-textarea" readonly="true" name="debtIssue.vcRemarks"  id="vcRemarks" width="96%"/>
	                    </td>
	                </tr>
	                <tr> 
		                 <td class="form_label" align="right">
		                                                                                    公告及说明书:
		                 </td>
		                 <td colspan="3" class="td">
							<iframe id="prodIfm1" name="prodIfm1" width="650px"  height="200px" frameborder="no" border="0" marginwidth="0" marginheight="0" scolling="no" 
							 	 >
							 </iframe>
						 </td>
		                <!-- <td>
		                <privilege:operation sourceId="ATS_RW_YB_FJXZ" sid="fileDownload" clazz="nui-button"
	                        onClick="window.frames['prodIfm1'].fileDownload()" lableName="附件下载" iconCls="icon-download">
	                        </privilege:operation>
	                    </td> -->
						 
	               </tr>
	               
	               <tr id="zhAttachs" style="display: none;"> 
						<td class="form_label" align="right">备注附件:</td>
						<td colspan="3" class="td">
							<iframe id="prodIfm" name="prodIfm" width="98%"  height="50px" frameborder="no" border="0" marginwidth="0" marginheight="0" scolling="no"></iframe>
						</td>
	               </tr>
	               
	               <tr> 
						<td class="form_label" align="right"></td>
						<td colspan="3" class="td">
							
						</td>
	               </tr>
	               
	            </table>
	            
	        </div>
	        </div>	
	        <div title="历史评级">
	        	<div class="nui-fit">
				<div id="datagrid2" class="nui-datagrid"
				 style="width: 100%; height: 100%;" 
				 pageSize="20"   sortField="lAppraiseDate"  dataField="appraise" sortOrder="desc"
				 showPageInfo="true" url = "com.cjhxfund.ats.fm.baseinfo.IssueInfoManager.getBondAppraise.biz.ext">
			
					<div property="columns">
					    <div type="indexcolumn" headerAlign="center" width="20px">序号</div>
						<div field="lAppraiseDate" headerAlign="center" width="30px" allowSort="true" >评级日期</div>
							
						<div field="vcBondAppraise" headerAlign="center" width="50px" allowSort="true" >债券评级</div>
							
						<div field="vcBondAppraiseOrgan" headerAlign="center" width="110px"  allowSort="true" >债券评级机构</div>
					</div>
				</div>
			</div>
			
	        </div>	
   </div>
 <div class="nui-toolbar" style="padding:0px;" borderStyle="border:0;">
	         <table width="100%">
	             <tr>
	               <td style="text-align:center;" colspan="4">
	                  
	                  <span style="display:inline-block;width:25px;"></span>
	                  <a class='nui-button' plain='false' iconCls="icon-cancel" onclick="onCancel()">
	                                关闭
	                  </a>
	                </td>
	              </tr>
	          </table>
	      </div>
	<script type="text/javascript">
    	nui.parse();
    	var context = '<%=request.getContextPath() %>';
    	var pid= '<%=pid %>';
    	var investNo = '<%=investNo %>';
    	var form = new nui.Form("dataform1");
    	/* $("#dataform1 .mini-buttonedit-buttons").remove();
		 $("#dataform1 .mini-buttonedit-border").css("background-color","#f0f0f0"); */
    	//初始化表单数据
    	function initForm(){
    	    var json = nui.encode({pid:pid});
	    	$.ajax({
					url:"com.cjhxfund.ats.fm.baseinfo.DebtIssueManager.getDebtIssueByLStockIssueId.biz.ext",
					type:'POST',
					data:json,
					cache:false,
					contentType:'text/json',
					success:function(text){
						var returnJson = nui.decode(text);
						var data = returnJson.debtIssue;
		            	 if(data.cIsHaveSaleback!='1') data.cIsHaveSaleback=0;
		            	 if(data.cIsHaveBuyback!='1') data.cIsHaveBuyback=0;
						form.setData({debtIssue:data});
						loadStockTypeAll(data.vcStockType);  //初始化债券类型   
						loadVcIndustryAll(data.vcIndustry);
						loadVcIssueAppraiseCsrcAll(data.vcIssueAppraiseCsrc);
            			changeDate(data); //转换日期类型
            	 		//showIssuerName(data);
            	 		nui.get("lIssuerId").setValue(data.lIssuerId);
            	 		issueInfoOnItemClick();
            	 		showFile(data);
            	 		if(checkRole("ATS_JS_QYJYY,ATS_JS_GSLJYSPYWJYY,ATS_JS_ZYJYY,ATS_JS_ZH_JYY,ATS_JS_ZH_TZJL")){
            	 			//招行需求-详情页面上传附件
            	 			showFileZH(data);
            	 		}
						form.setChanged(false);
						//处理付息频率，值满足数据字典则直接显示数据字典中对应值，否则直接显示值
						if(nui.get("enPayInteval").getText()=="" || nui.get("enPayInteval").getText()==null){
							nui.get("enPayInteval").setText(data.enPayInteval);
						}
						//手工新增债券时如果是可交换债还需要录入  抵押股票代码、抵押股票数量
				    	if(data.vcStockType=="Q" || data.vcStockType=="O"){
				    		$("#morStockNameAndCode").show();
					        $("#morStockAmount").show();
				    	}else{
				    		$("#morStockNameAndCode").hide();
					        $("#morStockAmount").hide();
				    	}
				    	var grid2 = nui.get("datagrid2"); 
         				grid2.load(data);
					}
				});	
		}
		
		
        	function changeDate(data){
        	    //转换公告日期
        	    
        	    var n_lIssuePostDate = data.lIssuePostDate;		  						//父页面lIssuePostDate值 为Number类型
        	    if(n_lIssuePostDate!=0){
	        	    var o_lIssuePostDate = nui.get("lIssuePostDate"); 						//当前页面lIssuePostDate对象
	            	var v_lIssuePostDate = nui.parseDate(n_lIssuePostDate+"");				//转换为Date类型
	            	var d_lIssuePostDate = nui.formatDate(v_lIssuePostDate, "yyyy-MM-dd");  //date格式化
	            	o_lIssuePostDate.setValue(d_lIssuePostDate);							//赋值
        	    }
        	    //发行日
        	    var n_lIssueBeginDate = data.lIssueBeginDate;		  						//父页面lIssueBeginDate值 为Number类型
				if(n_lIssueBeginDate!=0){
					var o_lIssueBeginDate = nui.get("lIssueBeginDate"); 						//当前页面lIssueBeginDate对象
					var v_lIssueBeginDate = nui.parseDate(n_lIssueBeginDate+"");				//转换为Date类型
					var d_lIssueBeginDate = nui.formatDate(v_lIssueBeginDate, "yyyy-MM-dd");  //date格式化
					o_lIssueBeginDate.setValue(d_lIssueBeginDate);							//赋值
				}
				//上市日期
				var n_lPublishDate = data.lPublishDate;		  						//父页面lPublishDate值 为Number类型
				if(n_lPublishDate!=0){
					var o_lPublishDate = nui.get("lPublishDate"); 						//当前页面lPublishDate对象
					var v_lPublishDate = nui.parseDate(n_lPublishDate+"");				//转换为Date类型
					var d_lPublishDate = nui.formatDate(v_lPublishDate, "yyyy-MM-dd");  //date格式化
					o_lPublishDate.setValue(d_lPublishDate);							//赋值
				}
				
				//到期日期
				var n_lEndincalDate = data.lEndincalDate;		  						//父页面lEndincalDate值 为Number类型
				if(n_lEndincalDate!=0){
					var o_lEndincalDate = nui.get("lEndincalDate"); 						//当前页面lEndincalDate对象
					var v_lEndincalDate = nui.parseDate(n_lEndincalDate+"");				//转换为Date类型
					var d_lEndincalDate = nui.formatDate(v_lEndincalDate, "yyyy-MM-dd");  //date格式化
					o_lEndincalDate.setValue(d_lEndincalDate);							//赋值
				}
				// 起息日期
				var n_lBegincalDate = data.lBegincalDate;		  						//父页面lBegincalDate值 为Number类型
				if(n_lBegincalDate!=0){
					var o_lBegincalDate = nui.get("lBegincalDate"); 						//当前页面lBegincalDate对象
					var v_lBegincalDate = nui.parseDate(n_lBegincalDate+"");				//转换为Date类型
					var d_lBegincalDate = nui.formatDate(v_lBegincalDate, "yyyy-MM-dd");  //date格式化
					o_lBegincalDate.setValue(d_lBegincalDate);							//赋值
				}
				//下一行权日
				var n_lNextExerciseDate = data.lNextExerciseDate;		  						//父页面lNextExerciseDate值 为Number类型
				if(n_lNextExerciseDate!=0){
					var o_lNextExerciseDate = nui.get("lNextExerciseDate"); 						//当前页面lNextExerciseDate对象
					var v_lNextExerciseDate = nui.parseDate(n_lNextExerciseDate+"");				//转换为Date类型
					var d_lNextExerciseDate = nui.formatDate(v_lNextExerciseDate, "yyyy-MM-dd");  //date格式化
					o_lNextExerciseDate.setValue(d_lNextExerciseDate);							//赋值
				}
				
				 //缴款日期
				var n_lPayDate = data.lPayDate;		  						//父页面lPayDate值 为Number类型
				if(n_lPayDate!=0){
					var o_lPayDate = nui.get("lPayDate"); 						//当前页面lPayDate对象
					var v_lPayDate = nui.parseDate(n_lPayDate+"");				//转换为Date类型
					var d_lPayDate = nui.formatDate(v_lPayDate, "yyyy-MM-dd");  //date格式化
					o_lPayDate.setValue(d_lPayDate);							//赋值
				}	
				
				var n_dBidLimitTime = data.dBidLimitTime;		  						
				if(n_dBidLimitTime!=0){
					var v_dBidLimitTime = nui.parseDate(n_dBidLimitTime+"");				//转换为Date类型
					if(v_dBidLimitTime!=null){
					 	nui.get("dApplicationTimeHH").setValue(v_dBidLimitTime.getHours());
					 	nui.get("dApplicationTimeMM").setValue(v_dBidLimitTime.getMinutes());
					}
				}			
            	
        	}
        	
        	/* function showIssuerName(data){
        		//发行人简称显示
        	    var lIssuerIdObj = nui.get("lIssuerId");
        	    lIssuerIdObj.setValue(data.lIssuerId);
        	    lIssuerIdObj.setText(data.vcIssuerName);
        	    
        	    //发行人简称显示 vcDeputyUnderwriter
        	    var vcDeputyUnderwriterObj = nui.get("vcDeputyUnderwriter");
        	    vcDeputyUnderwriterObj.setValue(data.vcDeputyUnderwriter);
        	    vcDeputyUnderwriterObj.setText(data.vcDeputyUnderwriter);
        	    
        	    //发行人简称显示vcMainUnderwriter
        	    var vcMainUnderwriterObj = nui.get("vcMainUnderwriter");
        	    vcMainUnderwriterObj.setValue(data.vcMainUnderwriter);
        	    vcMainUnderwriterObj.setText(data.vcMainUnderwriter);
        	    
        	    //发行人简称显示vcMainUnderwriter
        	    var vcGuarantorNameObj = nui.get("lGuarantorId");
        	    vcGuarantorNameObj.setValue(data.lGuarantorId);
        	    vcGuarantorNameObj.setText(data.vcGuarantorName);
        	    
        	} */
        	
           function showFile(data){
                var bizId=data.lBizId;
                var lStockInvestNo=data.lStockInvestNo;
           	 	document.getElementById("prodIfm1").src = context+"/fm/baseinfo/fileupload/any_upload.jsp?type=1&attachType=2&id="+bizId+"&lStockInvestNo="+lStockInvestNo;
           }
           
           function showFileZH(data){
           		document.getElementById("zhAttachs").style.display = "";
           		var bizId=data.lStockInvestNo;
           		$("#prodIfm").attr("src", nui.context + "/fm/baseinfo/fileuploadComm/any_upload.jsp?attachType=99&attachBusType=99&bizId="+bizId);
           }
		   		   
		
    	  //关闭窗口
		    function CloseWindow(action) {
		       if (window.CloseOwnerWindow)
		          return window.CloseOwnerWindow(action);
		       else window.close();
		    }
		   //加载所有的债券信息
         function loadStockTypeAll(e){
         	
         	nui.ajax({
			    url: "com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadStockType.biz.ext",
			    type: "post",
			    dataType:"json",
			    success: function (text) {
			    	nui.get("vcStockType").loadList(text.data);
			    	nui.get("vcStockType").setValue(e);
			    }
			});
         	
         } 
         function loadVcIssueAppraiseCsrcAll(e){
	     	nui.ajax({//com.cjhxfund.ats.fm.baseinfo.IssueInfoManager.loadVcIssueAppraiseCsrc
			    url: "com.cjhxfund.ats.fm.baseinfo.IssueInfoManager.loadVcIssueAppraiseCsrc.biz.ext",
			    type: "post",
			    data:nui.encode({type:"1"}),
			    contentType:'text/json',
			    success: function (text) {
			    	nui.get("vcIssueAppraiseCsrc").loadList(text.data);
			    	nui.get("vcIssueAppraiseCsrc").setValue(e);
			    }
			});
	     }
	     function loadVcIndustryAll(e){
	     	nui.ajax({//com.cjhxfund.ats.fm.baseinfo.IssueInfoManager.loadVcIssueAppraiseCsrc
			    url: "com.cjhxfund.ats.fm.baseinfo.IssueInfoManager.loadVcIssueAppraiseCsrc.biz.ext",
			    type: "post",
			    data:nui.encode({type:"2"}),
			    contentType:'text/json',
			    success: function (text) {
			    	nui.get("vcIndustry").loadList(text.data);
			    	nui.get("vcIndustry").setValue(e);
			    }
			});
	     }
		function onCancel(){
			//查询是否有附件，有，则删除
			CloseWindow("close");
			
		}
		
		function issueInfoOnItemClick(){
				 var lIssuerId = nui.get("lIssuerId").getValue();//发行人代码
				 if(lIssuerId!=null && lIssuerId!=""){
					  $.ajax({
						url:"com.cjhxfund.ats.fm.baseinfo.IssueInfoManager.getIssueInfoByID.biz.ext",
						type:'POST',
						data:nui.encode({id:lIssuerId}),
						cache:false,
						contentType:'text/json',
						success:function(text){
							var returnJson = nui.decode(text);
							if(returnJson.exception == null){
							    var issueInfo = returnJson.issueInfo;//投资产品信息（债券代码,债券名称,债券类别代码,债券评级代码,主体评级代码,评级机构代码）
							    //投资产品信息（债券代码,债券名称,债券类别代码,债券评级代码,主体评级代码,评级机构代码）
							    var vcIssueName = issueInfo.vcIssueName;
							    var vcIssueNameFull = issueInfo.vcIssueNameFull;
							   	nui.get("vcIssuerName").setValue(vcIssueName);               //发行人全称
								nui.get("vcIssuerNameFull").setValue(vcIssueNameFull);               //发行人全称
								
							};
						 }
					});
				  }
			};    	
			
		function refreshFile(){
			var iframe = document.getElementById("prodIfm");
			var height = iframe.contentWindow.document.body.scrollHeight;
			//var height = iframe.contentWindow.document.documentElement.scrollHeight;
			iframe.height = height;
		}
		
		//判断当前用户是否属于指定的角色
	    function checkRole(roleCode){
	    	var rtn = false;
	    	nui.ajax({
				url : "com.cjhxfund.fpm.bpsExpend.role.queryRoleByCurrUserId.biz.ext",
				type : 'POST',
				data : {roleCode:roleCode},
				cache : false,
				async: false,
				contentType : 'text/json',
				success : function(text) {
					var returnJson = nui.decode(text);
					if(returnJson.exception == null){
						if(returnJson.roleEmp!=null && returnJson.roleEmp.flag =="1"){
							rtn = true;	
						}
					}
				}
			 });
			 return rtn;
	    }
		
    </script>
   
</body>
</html>