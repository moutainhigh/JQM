<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/common.jsp" %>
<!-- 
  - Author(s): 童伟
  - Date: 2017-06-21 15:58:24
  - Description:债券买卖投顾指令详细页
-->
<head>
<title>指令/建议详情</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script type="text/javascript" src="<%=contextPath%>/scripts/com.cjhxfund.js.base/utils/DateUtil.js"></script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/riskMgr/js/riskMgrComm.js"></script>
    <style type="text/css">
    	tr{
		    display: table-row;
		    vertical-align: inherit;
		    border-color: inherit;
		}
		.nui-form-table {
		    border-collapse: collapse;
		    border: none;
		    padding-left: 5px;
		}
		.nui-form-table tr td{
			 padding-right:0;
		}
    </style>
</head>
<body>
	<div id="instructDetail_grid">
        <table class="nui-form-table" style="width:100%; heiht:100%;">
            <tr>
                <td align="right" width="150"><span style="color: red;">*</span>产品名称：</td>
                <td width="180">    
                    <input name="instructInfo.vcProductName" class="nui-textbox" required="true" readonly/>
                </td>
                <td align="right" width="150"><span style="color: red">*</span>净价/全价：</td>
                <td width="180">    
                    <span><input style="width:65px" class="nui-textbox" id="enNetPrice" name="instructInfo.enNetPrice" required="true" readonly/></span>
					/
					<span><input style="width:65px" class="nui-textbox" id="enFullPrice" name="instructInfo.enFullPrice" required="true" readonly/></span>
                </td>
            </tr>
            <tr>
                <td align="right" width="150"><span style="color: red">*</span>组合名称：</td>
                <td width="180">    
                    <input name="instructInfo.vcCombiName" class="nui-textbox" required="true" readonly/>
                </td>
                
                <td align="right" width="150" id="MaturityLab"><span style="color: red">*</span>到期/行权收益率：</td>
				<td width="180" id="MaturityField">
					<span><input style="width:65px" class="nui-textbox" id="enMaturityYield" name="instructInfo.enMaturityYield" required="true" readonly/></span> 
					<label id="MaturityLabSplit">/</label> 
					<span><input style="width:65px" class="nui-textbox" id="enOptionYield"  name="instructInfo.enOptionYield" required="true" readonly/></span>
				</td>
            </tr>
            <tr>
                <td align="right" width="150"><span style="color: red">*</span>债券代码：</td>
                <td width="180">    
                    <input name="instructInfo.vcStockCode" class="nui-textbox" required="true" readonly/>
                </td>
                <td align="right" width="150"><span style="color: red">*</span>债券名称：</td>
                <td width="180">    
                    <input name="instructInfo.vcStockName" class="nui-textbox"  required="true" style="width:143px" readonly/>
                </td>
            </tr>  
            <tr>
                <td align="right" width="150"><span style="color: red">*</span>委托方向：</td>
                <td width="180">    
                    <input name="instructInfo.vcEntrustDirection" class="nui-dictcombobox" valueField="dictID" textField="dictName" dictTypeId="entrustDirection" required="true" readonly/>
                </td>
                <td align="right" width="150"><span style="color: red">*</span>交易日期：</td>
                <td width="180">                        
                    <input name="instructInfo.lTradeDate" class="nui-textbox" required="true" style="width:143px" readonly/>
                </td>
            </tr>
            <tr>
                <td align="right" width="150"><span style="color: red">*</span>清算速度：</td>
                <td width="180">    
                    <input name="instructInfo.vcSettleSpeed" class="nui-dictcombobox" valueField="dictID" textField="dictName" dictTypeId="settleSpeed" required="true" readonly/>
                </td>
                <td align="right" width="150"><span style="color: red">*</span>结算日期：</td>
                <td width="180">    
                    <input name="instructInfo.lFirstSettleDate" class="nui-textbox" required="true" style="width:143px" readonly/>
                </td>
            </tr>
            
           	<!-- 银行间业务 --> 
            <tr id="interBankBiz1">
                <td align="right" width="150"><span style="color: red">*</span>券面金额（万元）：</td>
                <td width="180">    
                	<input name="instructInfo.enFaceAmount1" class="nui-spinner" minValue="0" maxValue="10000000000" format="n2" required="true" readonly/>
                </td>
                <td align="right" width="150"><span style="color: red">*</span>交易对手：</td>
                <td width="180"> 
                	<input name="instructInfo.vcCounterpartyName1" class="nui-textbox" required="true" style="width:143px" readonly/>   
                </td>
            </tr>
            <tr id="interBankBiz2">
                <td align="right" width="150">对方交易员：</td>
                <td width="180">    
                    <input name="instructInfo.vcCounterpartyTrader1" class="nui-textbox" required="true" readonly/>
                </td>
                <td align="right" width="150">对手主体机构：</td>
                <td width="180">    
                    <input name="instructInfo.vcCounterpartyOrgan1" class="nui-textbox" required="true" style="width:143px" readonly/>
                </td>
            </tr>   
            
            <!-- 上交所固收平台 --> 
            <tr id="sjsgsBiz1">
                <td align="right" width="150"><span style="color: red">*</span>券面金额（万元）：</td>
                <td width="180">    
                	<input name="instructInfo.enFaceAmount" class="nui-spinner" minValue="0" maxValue="10000000000" format="n2" required="true" readonly/>
                </td>
                <td align="right" id="enNetPriceAmountText" width="150"><span style="color: red">*</span>净价金额：</td>
                <td width="180" id="enNetPriceAmountValue">    
                	<input name="instructInfo.enNetPriceAmount" class="nui-spinner" minValue="0" maxValue="10000000000" format="n2" required="true" style="width:143px" readonly/>
                </td>
                <td align="right" id="enFullPriceAmountText" width="150"><span style="color: red">*</span>全价金额：</td>
                <td width="180" id="enFullPriceAmountValue">    
                	<input name="instructInfo.enFullPriceAmount" class="nui-spinner" minValue="0" maxValue="10000000000" format="n2" required="true" style="width:143px" readonly/>
                </td>
            </tr>  
            <tr id="sjsgsBiz2">
                <td id="sjsgs_vcCounterpartyTrader_text" align="right" width="150"><span style="color: red">*</span>对方交易员：</td>
                <td id="sjsgs_vcCounterpartyTrader_value" width="180">    
                    <input name="instructInfo.vcCounterpartyTrader" class="nui-textbox" required="true" readonly/>
                </td>
                <td id="sjsdz_vcRivalSeat_text" align="right" width="150"><span style="color: red">*</span>对手席位：</td>
                <td id="sjsdz_vcRivalSeat_value" width="180">    
                    <input name="instructInfo.vcRivalSeat" class="nui-textbox" required="true" readonly/>
                </td>
                <td id="sjsdz_vcCounterpartyName_text" align="right" width="150"><span style="color: red">*</span>交易对手：</td>
                <td id="sjsdz_vcCounterpartyName_value" width="180"> 
                	<input name="instructInfo.vcCounterpartyName" class="nui-textbox" required="true" style="width:143px" readonly/>   
                </td>
            </tr>  
            <tr id="sjsgsBiz3">
            	<td id="sjsdz_vcAgreemtCode_text" align="right" width="150"><span style="color: red">*</span>约定号：</td>
                <td id="sjsdz_vcAgreemtCode_value" width="180">    
                    <input name="instructInfo.vcAgreemtCode" class="nui-textbox" required="true" readonly/>
                </td>
                <td id="sjsdz_vcCounterpartyOrgan_text" align="right" width="150">对手主体机构：</td>  
                <td id="sjsdz_vcCounterpartyOrgan_value" width="180">    
                    <input name="instructInfo.vcCounterpartyOrgan" class="nui-textbox" required="true" style="width:143px" readonly/>
                </td>
            </tr>
            <tr>
                <td align="right" width="150">备注：</td>
                <td colspan="3" style="width:493px;">    
                    <input name="instructInfo.vcRemark" class="nui-textarea" style="width:493px;" required="true" readonly/>
                </td>
            </tr>           
        </table>
    </div>     
    <div class="nui-toolbar" id="confirmInstructInfo" style="border:0;  background: #FFFFFF;"> 
        <table class="nui-form-table" style="padding:0px; width:100%;" borderStyle="border:0;">
        	<tr>
        		<td align="center" style="text-align:center;" colspan="3">
        			<span id="exactrisk" style="display:none">
        				<a class="nui-button" plain="false" iconCls="icon-tip" onclick="riskControlTrial()">风控试算</a>
        				<span style="display:inline-block;width:25px;"></span>
        			</span>
        			<span id="confirm" style="display:none">
        				<a class="nui-button" plain="false" iconCls="icon-ok" onclick="goconfirm()">确认</a>
        				<span style="display:inline-block;width:25px;"></span>
        			</span>
        			<span id="backConfirm" style="display:none">
        				<a class="nui-button" plain="false" iconCls="icon-no" onclick="goBack()">退回</a>
        				<span style="display:inline-block;width:25px;"></span>
        			</span>
        			<a class="nui-button" plain="false" iconCls="icon-cancel" onclick="CloseWindow()">关闭</a>
        		</td>
        	</tr>
        </table>
    </div>
    <div id="approveResultInfo" style="display:none"> 
        <table class="nui-form-table" style="padding:0px; width:100%;" borderStyle="border:0;">
        	<tr>
        		<td align="center" style="text-align:center;" colspan="3">
        			<a class='nui-button' plain='false' iconCls="icon-cancel" onclick="CloseWindow()">关闭</a>
        		</td>
        	</tr>
        </table>
    </div>
	<!--输入项完整指令/建议end  -->
	<script type="text/javascript">
    	nui.parse();
    	$("#instructDetail_grid .mini-buttonedit-button").remove();
    	var instruct_detail_from = new nui.Form("#instructDetail_grid");
    	var row = "";
    	var workItemID = "";
    	var backReturnJson = null;
    	var riskFlagParam = null; 
    	var lResultIdParam = null;
		var lRiskmgrIdParam = null;
    	
		function getData(){
			return backReturnJson;
		}
    	
    	function setFormData(data){
    		//跨页面传递的数据对象，克隆后才可以安全使用
    		row = nui.clone(data);
    		if(row.lFirstSettleDate != null){
				row["lFirstSettleDate"] = nui.formatDate(DateUtil.numStrToDate(row["lFirstSettleDate"].toString()),"yyyy-MM-dd");
			}
			if(row.lTradeDate != null){
				row["lTradeDate"] = nui.formatDate(DateUtil.numStrToDate(row["lTradeDate"].toString()),"yyyy-MM-dd");
			}
			// 对方交易员
			if(row.vcCounterpartyTrader != null){
				row["vcCounterpartyTrader1"] = row.vcCounterpartyTrader;
			}
			// 券面金额
			if(row.enFaceAmount != null){
				row["enFaceAmount1"] = row.enFaceAmount;
			}
			//交易对手
			if(row.vcCounterpartyName != null){
				row["vcCounterpartyName1"] = row.vcCounterpartyName;
			}
			//对手主体机构
			if(row.vcCounterpartyOrgan != null){
				row["vcCounterpartyOrgan1"] = row.vcCounterpartyOrgan;
			}
			instruct_detail_from.setData({instructInfo:row});
			if(row.vcBizType == "1"){		
				// 买卖银行间业务显示
				document.getElementById("sjsgsBiz1").style.display = "none";
				document.getElementById("sjsgsBiz2").style.display = "none";
				document.getElementById("sjsgsBiz3").style.display = "none";
			}else if(row.vcBizType == "2" || row.vcBizType == "4"){
				// 买卖上海大宗交易业务和深交所业务显示
				document.getElementById("sjsgs_vcCounterpartyTrader_text").style.display = "none";
				document.getElementById("sjsgs_vcCounterpartyTrader_value").style.display = "none";
				document.getElementById("interBankBiz1").style.display = "none";
				document.getElementById("interBankBiz2").style.display = "none";
				// 上交所大宗 显示对手席位， 上交所固收显示对方交易员, 其他字段一致				
			}else if(row.vcBizType == "3"){
				// 买卖上海固收平台业务显示
				document.getElementById("sjsdz_vcRivalSeat_text").style.display = "none";
				document.getElementById("sjsdz_vcRivalSeat_value").style.display = "none";
				document.getElementById("interBankBiz1").style.display = "none";
				document.getElementById("interBankBiz2").style.display = "none";
		    }else if(row.vcBizType == "8" || row.vcBizType == "9"){
				//竞价平台买卖
				document.getElementById("sjsdz_vcRivalSeat_text").style.display = "none";
				document.getElementById("sjsdz_vcRivalSeat_value").style.display = "none";
			    document.getElementById("interBankBiz1").style.display = "none";
				document.getElementById("interBankBiz2").style.display = "none";
			    document.getElementById("sjsgs_vcCounterpartyTrader_text").style.display = "none";
				document.getElementById("sjsgs_vcCounterpartyTrader_value").style.display = "none";
			    document.getElementById("sjsdz_vcRivalSeat_text").style.display = "none";
				document.getElementById("sjsdz_vcRivalSeat_value").style.display = "none";
			    document.getElementById("sjsdz_vcAgreemtCode_text").style.display = "none";
				document.getElementById("sjsdz_vcAgreemtCode_value").style.display = "none";
				document.getElementById("sjsdz_vcCounterpartyName_text").style.display = "none";
				document.getElementById("sjsdz_vcCounterpartyName_value").style.display = "none";
			    document.getElementById("sjsdz_vcCounterpartyOrgan_text").style.display = "none";
				document.getElementById("sjsdz_vcCounterpartyOrgan_value").style.display = "none";
			}
			// 显示净价金额或者全价金额
			if(row.vcBizType == "1"){		
				// 买卖银行间业务显示
				document.getElementById("enFullPriceAmountValue").style.display = "none";
			}else if(row.vcBizType == "2" || row.vcBizType == "3" || row.vcBizType == "4" || row.vcBizType == "8" || row.vcBizType == "9"){
				// 买卖上海大宗交易业务和深交所业务显示和上交所固收
				if(row.enNetPriceAmount != null && row.enNetPriceAmount != ""){
					// 隐藏全价
					document.getElementById("enFullPriceAmountText").style.display = "none";
					document.getElementById("enFullPriceAmountValue").style.display = "none";
				}else{
					// 展示全价
					document.getElementById("enNetPriceAmountText").style.display = "none";
					document.getElementById("enNetPriceAmountValue").style.display = "none";
				}
			}
			// 3-二级债 其他为老机器猫
			if(row.cIsValid == "1"){
				if(row.vcInstructSource=="3"){
					if(row.vcProcessStatus == "2"|| row.vcProcessStatus == "3"){
						if(row.workitemid){
							//if(row.vcBizType == "1" || row.vcBizType == "2" || row.vcBizType == "1" || row.vcBizType == "1"){
								document.getElementById("exactrisk").style.display = "";
							//}
							document.getElementById("confirm").style.display = "";
							document.getElementById("backConfirm").style.display = "";
						}
					}
				}else if(row.vcInstructSource=="1" || row.vcInstructSource=="2"){	// 机器猫指令	
					var hasPermission = false;
					if(row.vcProcessStatus == "2"){//流程在投顾复核确认
						var userIdRelaType07All = row.userIdRelaType07All!=null?row.userIdRelaType07All:"";//07-产品与投顾确认权限(全部人员)
						var userIdRelaType07 = row.userIdRelaType07!=null?row.userIdRelaType07:"";//07-产品与投顾确认权限(过滤自己)
						var userIdRelaTypeA1 = row.userIdRelaTypeA1!=null?row.userIdRelaTypeA1:"";//A1-投顾录入确认可为同一人员
						if(userIdRelaType07All!=null && userIdRelaType07All!=""){//设置了复核人员
							var userIdRelaType07Arr = userIdRelaType07.split(",");//默认过滤自己
							if(userIdRelaTypeA1!=null && userIdRelaTypeA1!=""){//可为同一人员
								userIdRelaType07Arr = userIdRelaType07All.split(",");
							}
							for(var j=0; j<userIdRelaType07Arr.length; j++){
								var userIdTemp = userIdRelaType07Arr[j];
								if(userIdTemp==userId){
									hasPermission = true;
									break;
								};
							};
						}
						if(hasPermission==true && row.cIsValid=="1"){
							document.getElementById("confirm").style.display = "";
						}
					}else if(row.vcProcessStatus=="3"){//投资经理确认权限
						//若当前用户有权限处理该指令/建议单，则继续执行，否则终止并提示
						var userIdRelaType02 = row.userIdRelaType02;//该指令/建议单拥有投资经理下单权限的用户ID字符串
						if(userIdRelaType02!=null && userIdRelaType02!=""){
							var userIdRelaType02Arr = userIdRelaType02.split(",");
							for(var i=0; i<userIdRelaType02Arr.length; i++){
								var userIdTemp = userIdRelaType02Arr[i];
								if(userIdTemp==userId){
									hasPermission = true;
									break;
								};
							};
						}
						if(hasPermission==true && row.cIsValid=="1"){
							document.getElementById("confirm").style.display = "";
							document.getElementById("backConfirm").style.display = "";
						}
					}
				}
			}
			// 到期/行权收益率显示
			showYield(row.vcStockCode,row.vcMarket);
			workItemID = row.workitemid;
    	}
    	
    	// 根据序号查指令信息
    	function setResultNo(lInstructNo){
    		// 是否显示确认，退回按钮
			document.getElementById("approveResultInfo").style.display = "";
			document.getElementById("confirmInstructInfo").style.display = "none";
    		var params = {lResultNo:lInstructNo};
    		var a = nui.loading("正在处理中,请稍等...","提示");
    		nui.ajax({
		    	url: "com.cjhxfund.ats.sm.comm.InstructionManager.getInstructInfoByResultNo.biz.ext",
		      	type: 'POST',
		      	data: {params:params},
		      	contentType: 'text/json',
		      	success: function(text){
		      		nui.hideMessageBox(a);
		      		var returnJson = nui.decode(text.instrcutInfos);
		      		if(returnJson.length>0){
		      			row = returnJson[0];
			    		if(row.lFirstSettleDate != null){
							row["lFirstSettleDate"] = nui.formatDate(DateUtil.numStrToDate(row["lFirstSettleDate"].toString()),"yyyy-MM-dd");
						}
						if(row.lTradeDate != null){
							row["lTradeDate"] = nui.formatDate(DateUtil.numStrToDate(row["lTradeDate"].toString()),"yyyy-MM-dd");
						}
						// 对方交易员
						if(row.vcCounterpartyTrader != null){
							row["vcCounterpartyTrader1"] = row.vcCounterpartyTrader;
						}
						// 券面金额
						if(row.enFaceAmount != null){
							row["enFaceAmount1"] = row.enFaceAmount;
						}
						//交易对手
						if(row.vcCounterpartyName != null){
							row["vcCounterpartyName1"] = row.vcCounterpartyName;
						}
						//对手主体机构
						if(row.vcCounterpartyOrgan != null){
							row["vcCounterpartyOrgan1"] = row.vcCounterpartyOrgan;
						}
						instruct_detail_from.setData({instructInfo:row});
						if(row.vcBizType == "1"){		
							// 买卖银行间业务显示
							document.getElementById("sjsgsBiz1").style.display = "none";
							document.getElementById("sjsgsBiz2").style.display = "none";
							document.getElementById("sjsgsBiz3").style.display = "none";
						}else if(row.vcBizType == "2" || row.vcBizType == "4"){
							// 买卖上海大宗交易业务和深交所业务显示
							document.getElementById("sjsgs_vcCounterpartyTrader_text").style.display = "none";
							document.getElementById("sjsgs_vcCounterpartyTrader_value").style.display = "none";
							document.getElementById("interBankBiz1").style.display = "none";
							document.getElementById("interBankBiz2").style.display = "none";
							
							// 上交所大宗 显示对手席位， 上交所固收显示对方交易员, 其他字段一致				
						}else if(row.vcBizType == "3"){
							// 买卖上海固收平台业务显示
							document.getElementById("sjsdz_vcRivalSeat_text").style.display = "none";
							document.getElementById("sjsdz_vcRivalSeat_value").style.display = "none";
							document.getElementById("interBankBiz1").style.display = "none";
							document.getElementById("interBankBiz2").style.display = "none";
						}else if(row.vcBizType == "8" || row.vcBizType == "9"){
							//竞价平台买卖
							document.getElementById("sjsdz_vcRivalSeat_text").style.display = "none";
							document.getElementById("sjsdz_vcRivalSeat_value").style.display = "none";
							document.getElementById("interBankBiz1").style.display = "none";
							document.getElementById("interBankBiz2").style.display = "none";
							document.getElementById("sjsgs_vcCounterpartyTrader_text").style.display = "none";
							document.getElementById("sjsgs_vcCounterpartyTrader_value").style.display = "none";
						    document.getElementById("sjsdz_vcRivalSeat_text").style.display = "none";
							document.getElementById("sjsdz_vcRivalSeat_value").style.display = "none";
						    document.getElementById("sjsdz_vcAgreemtCode_text").style.display = "none";
							document.getElementById("sjsdz_vcAgreemtCode_value").style.display = "none";
							document.getElementById("sjsdz_vcCounterpartyName_text").style.display = "none";
							document.getElementById("sjsdz_vcCounterpartyName_value").style.display = "none";
						    document.getElementById("sjsdz_vcCounterpartyOrgan_text").style.display = "none";
							document.getElementById("sjsdz_vcCounterpartyOrgan_value").style.display = "none";
						}
						
						
						// 显示净价金额或者全价金额
						if(row.vcBizType == "1"){		
							// 买卖银行间业务显示
							document.getElementById("enFullPriceAmountValue").style.display = "none";
						}else if(row.vcBizType == "2" || row.vcBizType == "4" || row.vcBizType == "3" || row.vcBizType == "8" || row.vcBizType == "9"){
							// 买卖上海大宗交易业务和深交所业务显示和上交所固收
							if(row.enNetPriceAmount != null && row.enNetPriceAmount != ""){
								// 隐藏全价
								document.getElementById("enFullPriceAmountText").style.display = "none";
								document.getElementById("enFullPriceAmountValue").style.display = "none";
							}else{
								// 展示全价
								document.getElementById("enNetPriceAmountText").style.display = "none";
								document.getElementById("enNetPriceAmountValue").style.display = "none";
							}
							
						}
						// 3-二级债 其他为老机器猫
						if(row.cIsValid == "1"){
							if(row.vcInstructSource=="3"){
								if(row.vcProcessStatus == "2"|| row.vcProcessStatus == "3"){
									if(row.workitemid){
										document.getElementById("confirm").style.display = "";
										document.getElementById("backConfirm").style.display = "";
										//nui.get("confirm").enable();
										//nui.get("backConfirm").enable();
									}
								}
							}else if(row.vcInstructSource=="1" || row.vcInstructSource=="2"){	// 机器猫指令	
								var hasPermission = false;
								if(row.vcProcessStatus == "2"){//流程在投顾复核确认
									var userIdRelaType07All = row.userIdRelaType07All!=null?row.userIdRelaType07All:"";//07-产品与投顾确认权限(全部人员)
									var userIdRelaType07 = row.userIdRelaType07!=null?row.userIdRelaType07:"";//07-产品与投顾确认权限(过滤自己)
									var userIdRelaTypeA1 = row.userIdRelaTypeA1!=null?row.userIdRelaTypeA1:"";//A1-投顾录入确认可为同一人员
									if(userIdRelaType07All!=null && userIdRelaType07All!=""){//设置了复核人员
										var userIdRelaType07Arr = userIdRelaType07.split(",");//默认过滤自己
										if(userIdRelaTypeA1!=null && userIdRelaTypeA1!=""){//可为同一人员
											userIdRelaType07Arr = userIdRelaType07All.split(",");
										}
										for(var j=0; j<userIdRelaType07Arr.length; j++){
											var userIdTemp = userIdRelaType07Arr[j];
											if(userIdTemp==userId){
												hasPermission = true;
												break;
											};
										};
									}
									if(hasPermission==true && row.cIsValid=="1"){
										//nui.get("confirm").enable();
										document.getElementById("confirm").style.display = "";
									}
								}else if(row.vcProcessStatus=="3"){//投资经理确认权限
									//若当前用户有权限处理该指令/建议单，则继续执行，否则终止并提示
									var userIdRelaType02 = row.userIdRelaType02;//该指令/建议单拥有投资经理下单权限的用户ID字符串
									if(userIdRelaType02!=null && userIdRelaType02!=""){
										var userIdRelaType02Arr = userIdRelaType02.split(",");
										for(var i=0; i<userIdRelaType02Arr.length; i++){
											var userIdTemp = userIdRelaType02Arr[i];
											if(userIdTemp==userId){
												hasPermission = true;
												break;
											};
										};
									}
									if(hasPermission==true && row.cIsValid=="1"){
										document.getElementById("confirm").style.display = "";
										document.getElementById("backConfirm").style.display = "";
										//nui.get("confirm").enable();
										//nui.get("backConfirm").enable();
									}
								}
							}
						}
						
						workItemID = row.workitemid;
						
						// 到期/行权收益率显示
						showYield(row.vcStockCode,row.vcMarket);
		      		}
		      	}
	 		});
    	}
    	
    	//关闭窗口
		function CloseWindow(action) {
		    if (window.CloseOwnerWindow)
		    return window.CloseOwnerWindow(action);
		    else window.close();
		}
		
		// 老机器猫投顾确认
		function confirm_common_confirm_ZQMM(){
			var hasPermission = false;//是否有权限，默认无
			if(row.vcProcessStatus=="1" || row.vcProcessStatus=="2"){//流程在投顾复核确认
				var userIdRelaType07All = row.userIdRelaType07All!=null?row.userIdRelaType07All:"";//07-产品与投顾确认权限(全部人员)
        		var userIdRelaType07 = row.userIdRelaType07!=null?row.userIdRelaType07:"";//07-产品与投顾确认权限(过滤自己)
				var userIdRelaTypeA1 = row.userIdRelaTypeA1!=null?row.userIdRelaTypeA1:"";//A1-投顾录入确认可为同一人员
				if(userIdRelaType07All!=null && userIdRelaType07All!=""){//设置了复核人员
					var userIdRelaType07Arr = userIdRelaType07.split(",");//默认过滤自己
					if(userIdRelaTypeA1!=null && userIdRelaTypeA1!=""){//可为同一人员
						userIdRelaType07Arr = userIdRelaType07All.split(",");
					}
					for(var j=0; j<userIdRelaType07Arr.length; j++){
						var userIdTemp = userIdRelaType07Arr[j];
						if(userIdTemp==userId){
							hasPermission = true;
							break;
						};
					};
				}
				if(hasPermission!=true){
					nui.alert("您没有权限确认该指令/建议！","提示");
					return;
				};
			}else if(row.vcProcessStatus=="3"){//投资经理确认权限
				//若当前用户有权限处理该指令/建议单，则继续执行，否则终止并提示
				var userIdRelaType02 = row.userIdRelaType02;//该指令/建议单拥有投资经理下单权限的用户ID字符串
				if(userIdRelaType02!=null && userIdRelaType02!=""){
					var userIdRelaType02Arr = userIdRelaType02.split(",");
					for(var i=0; i<userIdRelaType02Arr.length; i++){
						var userIdTemp = userIdRelaType02Arr[i];
						if(userIdTemp==userId){
							hasPermission = true;
							break;
						};
					};
				}
				if(hasPermission==false){
					nui.alert("您没有权限确认该指令/建议","提示");
					return;
				};
			}else{//交易员
				nui.alert("您没有权限确认该指令/建议","提示");
				return;
			}
			nui.confirm("确定要确认所选的指令/建议吗？","系统提示",function(action){
				if(action=="ok"){
					var json = nui.encode({zhfwptjyzqmms:[{processId: row.lResultId}]});
					var a = nui.loading("正在处理中,请稍等...","提示");
					$.ajax({
	                    url:"com.cjhxfund.jy.ProductProcess.JY_ZQMM.JY_ZQMM_confirm.biz.ext",
	                    type:'POST',
	                    data:json,
	                    cache: false,
	                    contentType:'text/json',
	                    success:function(text){
	                    	nui.hideMessageBox(a);
	                        var returnJson = nui.decode(text);
	                        if(returnJson.exception == null){
	                        	var validStr = returnJson.validStr;//有效指令/建议单字符串
	                        	var invalidStr = returnJson.invalidStr;//无效指令/建议单字符串
	                        	var validCount = returnJson.validCount;//有效指令/建议单记录数
	                        	var invalidCount = returnJson.invalidCount;//无效指令/建议单记录数
	                        	var invalidFixStr = returnJson.invalidFixStr;//无效指令/建议单字符串（Fix错误信息）
	                        	var validFixFailReason = returnJson.validFixFailReason;//有效指令/建议单字符串（反馈报文失败原因[警告信息等]）
	                        	var msg = "";
	                        	var failReasonMsg = "";
	                        	var errorMsg = "";
	                        	if(validCount!=null && validCount!="" && validCount!="0"){
	                        		if(validFixFailReason!=null && validFixFailReason!=""){
	                        			var tempValidStrArr = validStr.split(",");
		                        		var tempValidFixFailReasonArr = validFixFailReason.split("★");
		                        		for(var i=0; i<tempValidStrArr.length; i++){
		                        			failReasonMsg += "【"+tempValidStrArr[i]+"触发以下风控：</br>"+tempValidFixFailReasonArr[i]+"】</br>";
		                        		}
		                        		if(failReasonMsg!=null && (failReasonMsg.indexOf("申请指令/建议审批")!=-1 || failReasonMsg.indexOf("申请风险阀值")!=-1)){
		                        			failReasonMsg += "<span class='warn_red_bold'>请联系人工审批！</span></br>";
		                        		}
	                        		}
	                        		msg += "确认成功 " + validCount + " 条</br>"+failReasonMsg;
	                        	}
	                        	if(invalidCount!=null && invalidCount!="" && invalidCount!="0"){
	                        		var tempInvalidStrArr = invalidStr.split(",");
	                        		var tempInvalidFixStrArr = invalidFixStr.split("★");
	                        		for(var i=0; i<tempInvalidStrArr.length; i++){
	                        			errorMsg += "【"+tempInvalidStrArr[i]+"-"+tempInvalidFixStrArr[i]+"】</br>";
	                        		}
	                        		msg += "确认失败 " + invalidCount + " 条</br>"+errorMsg;
	                        	}
	                            nui.alert(msg, "系统提示", function(action){
	                            	if(action=="ok"){
	                            		window.CloseWindow("ok");
	                            	}
	                            });
	                        }else{
	                           // grid_confirm.unmask();
	                            nui.alert("确认失败", "系统提示");
	                        }
	                    }
	                });
				}
			});
		}
		
		function riskControlTrial(){
			var a = nui.loading("正在处理中,请稍等...","提示");
			nui.ajax({
        	 	url: "com.cjhxfund.ats.sm.comm.InstructionManager.approveRiskTrial.biz.ext",
	            type: 'POST',
	            data: {lProcessInstID:row.lProcessinstId, bonds: null},
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	            	nui.hideMessageBox(a);
	            	var returnJson = nui.decode(text);
					if(returnJson.exception == null){
		               var riskInfo = returnJson.riskMsg;
		               if (returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_SUCCESS%>"){
		                    if(returnJson.rtnMsg!=null){
		                    	nui.alert(returnJson.rtnMsg,"系统提示");
		                    }else{
		                    	nui.alert("风控试算通过!","系统提示");
		                    }
		                }else if(returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_ORDER_USABLE_AMOUNT_INSUFFICIENT%>"){
		                	nui.alert(returnJson.rtnMsg,"投资指令/建议风险提示");//可用不足
		                }else if(returnJson.rtnCode == "203"){
		                	nui.alert(returnJson.rtnMsg,"系统提示");//风控校验失败
		                }else if(returnJson.rtnCode == "301"){
		                	//风险提示框start
		                	riskInfo["alertMsg"]=returnJson.rtnMsg;
		                    nui.open({
		                        url: "<%=request.getContextPath()%>/fix/riskControlDetailList.jsp",
		                        title: "投资指令/建议风险提示",
		                        width: 800,
		                        height: 422,
		                        onload: function () {
		                            var iframe = this.getIFrameEl();
		                            iframe.contentWindow.SetData(riskInfo,3);
		                        }
		                    });
		                }else{
		                    //风险提示框start
		                    nui.open({
		                        url: "<%=request.getContextPath()%>/fix/riskControlDetailList.jsp",
		                        title: "投资指令/建议风险提示",
		                        width: 800,
		                        height: 380,
		                        onload: function () {
		                            var iframe = this.getIFrameEl();
		                            iframe.contentWindow.SetData(riskInfo,3);
		                        }
		                    });
		                    //风险提示框end
		                }
					}else{
						nui.alert("系统异常","系统提示");
					}
	            }
        	 });
		}
		
		/**风控管理开始**/
		function subData(riskReturn, instructJson){
			var riskFlag = showRiskInfoApprove(riskReturn, instructJson);
			riskControl(riskFlag, instructJson);
		}
		function riskControl(riskFlag, instructJson){
			riskFlagParam = riskFlag;
			lResultIdParam = instructJson.instructParameter.lResultId;
        	lRiskmgrIdParam = instructJson.instructParameter.lRiskmgrId;
        	if(riskFlag=='-1'){
        		return;
        	}else if(riskFlag=='1'){
        		finishInstructWorkitem(workItemID, '1', '');
        	}else if(riskFlag=='2'){
        		finishInstructWorkitem(workItemID, '1', '');
        	}
        }
        function finishInstructWorkitemFisish(){
        	if(riskFlagParam=='2'){
        		startRiskProcessInstruct(lResultIdParam, lRiskmgrIdParam);
        	}
			window.CloseWindow("ok");
        }
        /**风控管理结束**/
		
		// 二级债指令确认
		function submitApprove() {
            //checkResult审批结果1通过，0不通过
            var checkResult = "1";
            
            /**风控管理开始**/
			if(row.instructSource!='2' && judgeRiskTest(workItemID) && (row.vcBizType == "1" || row.vcBizType == "2" || row.vcBizType == "3" || row.vcBizType == "4")){
				var returnJson = judgeRiskInfo(workItemID, null);	//判断是否有复核节点
				
				if(returnJson.rtnObject.rtnCode=='-1'){		//投资经理不存在
					alert(returnJson.rtnObject.rtnMsg);		//不允许提交
				}else if(returnJson.rtnObject.rtnCode=='1' || returnJson.rtnObject.rtnCode=='2'){	//风控管理存在数据
					if(returnJson.riskInfo.cStatus=='2'){	//风控通过
						checkRiskInfoApprove(workItemID, false);	//校验可用
					}else if(returnJson.workItemDetail.activityDefID=="manualActivity2A"){	//投资经理节点
						nui.alert("风控流程审批未通过，暂不能提交！");
					}else if(returnJson.riskInfo.cStatus=='0' || returnJson.riskInfo.cStatus=='5'){
						checkRiskInfoApprove(workItemID);	//重新调用风控接口
					}else{
						if(returnJson.workItemDetail.activityDefID=="manualActivity1" || returnJson.workItemDetail.activityDefID=="manualActivity111"){
							nui.confirm("风控流程未审批完成，复核通过后会停留在下一节点！","系统提示",function(action){
								if(action=="ok"){
									checkRiskInfoApprove(workItemID, false);	//校验可用
								}
							});
						}else{
							checkRiskInfoApprove(workItemID, false);	//校验可用
						}
					}
				}else{	//风控管理不存在数据
					if(returnJson.workItemDetail.activityDefID=="manualActivity2A"){	//投资经理节点
						checkRiskInfoApprove(workItemID, false);	//校验可用
					}else{	//非投资经理节点
						checkRiskInfoApprove(workItemID);	//重新调用风控接口
					}
				}
				
				return;
			}
			/**风控管理结束**/
			
            var a = nui.loading("正在处理中,请稍等...","提示");
            nui.ajax({
                url: "com.cjhxfund.ats.sm.comm.TaskManager.approveAvailValidate.biz.ext",
                type: "post",
                contentType:'text/json',
                data:{workItemID:workItemID, checkResult:checkResult, checkComments:""},
                success: function (text) {
                	nui.hideMessageBox(a);
                	var returnJson = nui.decode(text);
					if(returnJson.exception == null){
						if(returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_SUCCESS%>"){
                    		var alsertMsg = "";
                    		if(checkResult=="0"){
                    			if(returnJson.rtnMsg){
                    				alsertMsg = "</br>此单已退回！</br>退回原因："+returnJson.rtnMsg;
                    			}
                    			nui.alert("操作成功！"+alsertMsg,"系统提示",function(action){
					    			if(action == "ok"){
					    				window.CloseWindow("ok");
					    			}
				    			});
                    		}else{
                    			if(returnJson.rtnMsg){
	                    			alsertMsg = "</br>【该投资建议/指令触发以下风控：</br>"+returnJson.rtnMsg+"】</br>";
	                    		}
	                    		nui.alert("审批成功"+alsertMsg,"系统提示",function(action){
					    			if(action == "ok"){
					    				window.CloseWindow("ok");
					    			}
				    			}); 
                    		}
                    		
						}else if(returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_ERROR%>"){
							nui.alert("审批失败</br>"+returnJson.rtnMsg,"系统提示",function(action){
								if(action == "ok"){
				    				window.CloseWindow("ok");
				    			}
							});
							
						}else if(returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_ORDER_NO_RCV_FR_O32%>"){
			    			nui.alert("审批成功"+"</br>"+returnJson.rtnMsg,"系统提示",function(action){
				    			if(action == "ok"){
				    				window.CloseWindow("ok");
				    			}
			    			}); 
						}else if(returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_RISK_VIOLATE_FORBID_CTRL%>"){
							nui.alert("审批失败,触发禁止风控,风控信息如下：</br>"+returnJson.rtnMsg,"系统提示",function(action){
				    			if(action == "ok"){
				    				window.CloseWindow("ok");
				    			}
							});
							
						}else if(returnJson.rtnCode == "<%=com.cjhxfund.commonUtil.Constants.ATS_ORDER_USABLE_AMOUNT_INSUFFICIENT%>"){
							nui.alert("审批失败</br>"+returnJson.rtnMsg,"系统提示",function(action){
				    			if(action == "ok"){
				    				window.CloseWindow("ok");
				    			}
							});
						}else{
							nui.alert("操作异常","系统提示");
						}
					}else{
						nui.alert("系统异常","系统提示");
					}
                }
            });
        }
		
		// 确认按钮分发
		function goconfirm(){
			// 3-二级债 其他为老机器猫
			if(row.vcInstructSource=="3"){
				submitApprove();
			}else if(row.vcInstructSource=="1" || row.vcInstructSource=="2"){	// 机器猫指令	
				confirm_common_confirm_ZQMM();
			}
		}
		
		// 退回操作
		function goBack(){
			// 3-二级债 其他为老机器猫
			if(row.vcInstructSource=="3"){
				nui.open({
					url : nui.context + "/sm/comm/instruct/tansaction_instruct/backTaskReason.jsp",
					title : "退回原因",
					width : 500,
					height : 200,
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setData(row);
					},
					ondestroy : function(action) {
						var iframe = this.getIFrameEl();
	   					var returnJson = iframe.contentWindow.getData();
	   					backReturnJson = mini.clone(returnJson);    //必须。克隆数据。
	   					window.CloseWindow("ok");
					}
				});
			}else if(row.vcInstructSource=="1" || row.vcInstructSource=="2"){	// 机器猫指令	
				goBack_common_confirm_ZQMM(row);
			}
		}
		
	   	//退回--老机器猫指令退回
		function goBack_common_confirm_ZQMM(record){
		    var combProductName = record.vcProductCode;//产品名称
			var investProductNum = record.lInstructNo;//编号
			var validStatus = record.cIsValid;//交易状态：0-有效；1-无效-修改；2-无效-废弃；3-有效-退回；4-无效-退回；
			var validStr = "";//有效无效验证字符串
			if(validStatus!="1"){
				validStr += "、" + investProductNum + "-" + combProductName;
			}
			if(validStr!=null && validStr!="" && validStr.length>0){
				validStr = validStr.substr(1,validStr.length);
				var msg = "【"+validStr+"】</br>指令/建议已无效或退回，请先剔除";
				nui.alert(msg,"提示");
				return;
			}
			//权限验证开始...
			var goBackStr = "";//该阶段不能退回字符串
			var permissionStr = "";//权限验证字符串
			var processStatus = record.vcProcessStatus;
	    	//投顾尚未确认
	    	if(processStatus=="1" || processStatus=="2"){
	    		goBackStr += "、" + investProductNum + "-" + combProductName;
	    	//投资经理下单操作权限认证
	    	}else if(processStatus=="3"){
	    		//若当前用户有权限处理该指令/建议单，则继续执行，否则记录下该产品
	    		var hasPermission = false;//是否有权限，默认无
				var userIdRelaType02 = record.userIdRelaType02;//该指令/建议单拥有投资经理下单权限的用户ID字符串
				if(userIdRelaType02!=null && userIdRelaType02!=""){
					var userIdRelaType02Arr = userIdRelaType02.split(",");
					for(var j=0; j<userIdRelaType02Arr.length; j++){
						var userIdTemp = userIdRelaType02Arr[j];
						if(userIdTemp==userId){
							hasPermission = true;
							break;
						}
					}
				}
				if(hasPermission==false){
					permissionStr += "、" + investProductNum + "-" + combProductName;
				}
	    	}else{//投资经理下单已确认
        		goBackStr += "、" + investProductNum + "-" + combProductName;
        	}
	    	if(goBackStr!=null && goBackStr!="" && goBackStr.length>0){
				goBackStr = goBackStr.substr(1,goBackStr.length);
				var msg = "【"+goBackStr+"】</br>指令/建议尚未确认或投资经理已下单，请先剔除";
				nui.alert(msg,"提示");
				return;
			}
			if(permissionStr!=null && permissionStr!="" && permissionStr.length>0){
				permissionStr = permissionStr.substr(1,permissionStr.length);
				var msg = "您没有权限退回【"+permissionStr+"】指令/建议，请先剔除";
				nui.alert(msg,"提示");
				return;
			}
			var msg = "确定要退回所选指令/建议吗？";
			nui.confirm(msg,"系统提示",function(action){
				if(action=="ok"){
					var json = nui.encode({zhfwptjyzqmms: [{processId: record.lResultId}], validStatus: "3"});
					var a = nui.loading("正在处理中,请稍等...","提示");
					$.ajax({
	                    url:"com.cjhxfund.jy.ProductProcess.JY_ZQMM.JY_ZQMM_updateValidStatus.biz.ext",
	                    type:'POST',
	                    data:json,
	                    cache: false,
	                    contentType:'text/json',
	                    success:function(text){
	                    	nui.hideMessageBox(a);
	                        var returnJson = nui.decode(text);
	                        if(returnJson.exception == null){
	                            nui.alert("退回成功", "系统提示", function(action){
	                            	if(action=="ok"){
	                            		window.CloseWindow("ok");
	                            	}
	                            });
	                        }else{
	                            //grid_goBack.unmask();
	                            nui.alert("退回失败", "系统提示");
	                        }
	                    }
	                });
				}
			});
		}
		
		// 到期/行权收益率显示
		function showYield(vcStockCode,vcMarketNo){
			var parameter={vcStockCode:vcStockCode,vcMarketNo:vcMarketNo};
			nui.ajax({
				url:"com.cjhxfund.ats.sm.comm.TBondBaseInfoManager.getAppointBondInfo.biz.ext",
				type : 'POST',
				data : {condition:parameter},
				cache : false,
				contentType : 'text/json',
				success : function(text) {
					var returnJson = nui.decode(text);
					if(returnJson.exception == null){
						var vcSpecialText = null;
						if(returnJson.bondBasicInfo.length>0){
							vcSpecialText = returnJson.bondBasicInfo[0].vcSpecialText;
						}else{
							return;
						}
						
						if(vcSpecialText && (vcSpecialText.indexOf("回售条款")>=0 || vcSpecialText.indexOf("赎回条款")>=0)){
							$("#MaturityLab").html("<span style='color: red'>*</span>到期/行权收益率:");
							$("#enOptionYield").show();
						}else{
							$("#MaturityLab").html("<span style='color: red'>*</span>到期收益率:");
							$("#enOptionYield").hide();
							$("#MaturityLabSplit").hide();
						}
					}
				}
			});
		}
		
		
		
    </script>
</body>
</html>