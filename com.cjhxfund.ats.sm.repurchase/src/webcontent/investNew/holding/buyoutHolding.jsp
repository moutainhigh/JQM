<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/common.jsp" %>
<!-- 
  - Author(s): 罗倔怀
  - Date: 2017-07-04 14:00:11
  - Description:
-->
<head>
    <title>银行间持仓</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <style type="text/css">
        .searchBox {
            width: 100%;
            height: 24px;
            background: transparent;
        }

        .searchDiv {
            width: 270px;
            float: left;
            margin-bottom: 5px;
        }

        .searchDiv > label {
            width: 75px;
            float: left;
            text-align: right;
            display: block;
        }

        .searchDiv > div {
            width: 270px;
            text-align: left;
        }

        .searchButton {
            width: auto;
            clear: both;
        }
    </style>
</head>
<body>
<div class="search-condition" style="height:80px;">
    <div id="vunitstockCondition" class="searchBox">
        <div class="searchDiv">
            <label>产品名称:</label>
            <div name="fundCodeName" class="mini-autocomplete" pinyinField="ID" id="fundCodeName"
                 textField="TEXT" valueField="ID"
                 searchField="productCode"
                 url="com.cjhxfund.commonUtil.applyInstUtil.QueryTAtsProductInfoMatchSort.biz.ext?queryType='01','02'"
                 showNullItem="false"
                 allowInput="true"
                 emptyText="请输入产品代码或产品名称..."
                 nullItemText="请输入产品代码或产品名称..."
                 valueFromSelect="true"
                 showClose="true"
                 onvaluechanged="selectFund"
                 style="width:178px"
                 oncloseclick="onCloseClick"
                 popupWidth="300"
                 enabled="false">
                <div property="columns">
                    <div header="产品代码" field="ID" width="40px"></div>
                    <div header="产品名称" field="TEXT"></div>
                </div>
            </div>
        </div>

        <div class="searchDiv">
            <label>组合名称:</label>
            <div>
                <input name="vcCombiName" class="nui-combobox" id="vcCombi"
                       textField="TEXT" valueField="ID"
                       dataField="data"
                       url="com.cjhxfund.commonUtil.applyInstUtil.queryCombiInfo.biz.ext"
                       showNullItem="false"
                       allowInput="false"
                       onvaluechanged="selectCombi"
                       emptyText="全部"
                       nullItemText="全部"
                       showClose="true"
                       oncloseclick="onCloseClick"
                       style="width:178px"
                       enabled="false"/>
            </div>
        </div>
        <div class="searchDiv">
            <label>托管机构:</label>
            <div>
                <input class="nui-combobox"
                       id="vcPaymentPlace"
                       name="vcPaymentPlace"
                       textField="name"
                       valueField="id"
                       emptyText="全部"
                       showClose="true"
                       oncloseclick="onCloseClick"
                       style="width:178px"
                />
            </div>
        </div>
        <div class="searchDiv">
            <label>债项评级:</label>
            <div>
                <input class="nui-dictcombobox"
                       id="ratingForecast"
                       name="ratingForecast"
                       multiSelect="true"
                       valueField="dictName"
                       textField="dictName"
                       dictTypeId="CF_JY_PRODUCT_PROCESS_SUBJECT_RATING"
                       emptyText="全部"
                       showClose="true"
                       oncloseclick="onCloseClick"
                       style="width:178px"/>
            </div>
        </div>
        <div class="searchDiv">
            <label>主体评级:</label>
            <div>
                <input class="nui-dictcombobox"
                       name="vcIssueAppraise"
                       id="vcIssueAppraise"
                       multiSelect="true"
                       valueField="dictID"
                       textField="dictName"
                       dictTypeId="CF_JY_PRODUCT_PROCESS_SUBJECT_RATING"
                       emptyText="全部"
                       showClose="true"
                       oncloseclick="onCloseClick"
                       style="width:178px"/>
            </div>
        </div>
        <div class="searchDiv">
            <label>发行人性质:</label>
            <div>
                <input class="nui-dictcombobox"
                       name="issueProperty"
                       id="issueProperty"
                       multiSelect="true"
                       valueField="dictID"
                       textField="dictName"
                       dictTypeId="ATS_FM_ISSUE_PROPERTY"
                       emptyText="全部"
                       showClose="true"
                       oncloseclick="onCloseClick"
                       style="width:178px"/>
            </div>
        </div>
        <div class="searchDiv">
            <label>债券类型:</label>
            <div>
                <input id="vcStockType"
                       name="vcStockType"
                       class="nui-treeselect"
                       multiSelect="true"
                       textField="text"
                       valueField="id"
                       parentField="pid"
                       emptyText="全部"
                       url="com.cjhxfund.ats.fm.instr.StockIssueInfoBiz.loadStockType.biz.ext"
                       checkRecursive="false"
                       showFolderCheckBox="false"
                       showFolderCheckBox="true"
                       expandOnLoad="true"
                       showTreeIcon="false"
                       showClose="true"
                       valueFromSelect="true"
                       popupWidth="200"
                       oncloseclick="onCloseClick"
                       style="width:178px"/>
            </div>
        </div>
        <div class="searchDiv">
            <label>债券代码:</label>
            <div name="vcStockCode2" class="nui-autocomplete" id="vcStockCode2"
                 textField="stockCode" valueField="stockCode"
                 searchField="stockCode"
                 url="com.cjhxfund.ats.sm.comm.TBondBaseInfoManager.queryBankBetweenBondCode.biz.ext"
                 allowInput="true"
                 emptyText="请选择..."
                 nullItemText="请选择..."
                 valueFromSelect="true"
                 dataField="bondList"
                 multiSelect="false"
                 style="width:178px"
                 popupWidth="300">
                <div property="columns">
                    <div header="债券代码" field="stockCode" width="40px"></div>
                    <div header="债券名称" field="stockName"></div>
                </div>
            </div>
        </div>
        <div class="searchDiv">
            <label></label>
            <div>
				<div style="padding-left: 10px;">
					<input class="nui-button" plain="false" text="查询" iconCls="icon-search" onclick="queryVunitStock()"/>
                	<a class="nui-button" plain="false" iconCls="icon-reset" onclick="reset()">重置</a>
				</div>
            </div>
        </div>
    </div>
</div>
<div id="vunitstockGrid" dataField="vunitstockList"
     url="com.cjhxfund.ats.sm.repurchase.RepurchaseBizManager.queryVunitstock.biz.ext"
     class="nui-datagrid" style="width:100%;height:355px;"
     pageSize="10000"
     multiSelect="false"
     showFooter="true"
     allowResize="false"
     showPager="false"
     allowSortColumn="false"
     enableHotTrack="false"
     onrowdblclick="chooseBond"
     allowAlternating="true"
     sortField="" sortOrder="">
    <div property="columns">
        <div type="checkcolumn"></div>
        <div field="vcReportCode" width="100" allowSort="true" align="left" headerAlign="center">债券代码</div>
        <div field="vcStockName" align="left" allowSort="true" width="100" headerAlign="center">债券名称</div>
        <div field="vcAvailablequantityT0" align="left" width="100" value="-10000000000" decimalPlaces="0" numberFormat="n0" headerAlign="center">
            T+0可质押数量
        </div>
        <div field="vcAvailablequantityT1" width="100" decimalPlaces="0" numberFormat="n0" headerAlign="center">T+1可质押数量</div>
        <div field="lCurrentAmount" align="left" width="100" allowSort="true" headerAlign="center" numberFormat="n0">持仓数量</div>
        <div field="vcDepository" align="left" width="100" allowSort="false" renderer="depository" headerAlign="center">托管机构</div>
        <div field="vcBondAppraise" align="left" allowSort="true" width="120" headerAlign="center" renderer="vcBondAppraiseRD">债项评级</div>
        <div field="vcIssueAppraise" align="left" allowSort="true" width="100" headerAlign="center" renderer="vcIssueAppraiseRD">主体评级</div>
        <div field="vcIssueProperty" align="left" allowSort="true" width="120" headerAlign="center" renderer="atsFmIssueProperty">发行人性质</div>
        <div field="vcMortagageQty" align="left" width="100" headerAlign="center" numberFormat="n0">在途质押数量</div>
        <div field="enCbValueNetValue" align="right" allowSort="true" headerAlign="center" width="100" allowSort="false" format="n4">
            净价（T-1）
        </div>
        <div field="enCbValueAllValue" align="right" allowSort="true" headerAlign="center" width="100" format="n4">全价(T-1)</div>
        <div field="lRatingForecast" align="left" allowSort="true" headerAlign="center" width="100" renderer="lRatingForecastRD">评级展望</div>
        <div field="vcBondAppraiseOrgan" align="left" allowSort="false" headerAlign="center" width="100" renderer="vcBondAppraiseOrganRD">评级机构</div>
        <div field="lEndincalDays" align="left" width="120" headerAlign="center" renderer="calEndincalDays">剩余天数</div>
        <div field="lDelistingDate" align="left" allowSort="true" width="120" headerAlign="center" renderer="Delisting">摘牌日期</div>
        <div field="vcSpecialText" align="left" width="120" headerAlign="center">特殊条款</div>
        <div field="vcStockType" align="left" width="120" headerAlign="center">债券类型</div>
        <div field="lNextExerciseDate" align="left" allowSort="true" width="120" headerAlign="center" renderer="Delisting">下一行权日</div>
    </div>
</div>
<div style="text-align: center;padding-top: 10px;">
    <a class="nui-button" iconCls="icon-ok" plain="true" onclick="chooseBond()">添加</a>
    <a class="nui-button" iconCls="icon-cancel" plain="true" onclick="cancel()">取消</a>
</div>
<script type="text/javascript">
    nui.parse();
    var fundCodeCombo = null;
    var vcCombiCombo = null;
    var bondData = null;
    var vunitstockGrid = null;
    //联动方法
    var selectFund = function (e) {
        var id = fundCodeCombo.getValue();
        $.ajax({
            data: {vcProductCode: id},
            url: "com.cjhxfund.commonUtil.applyInstUtil.queryCombiInfo.biz.ext",
            success: function (resp) {
                vcCombiCombo.setValue("");
                if (resp.data) {
                    vcCombiCombo.load(resp.data);
                    vcCombiCombo.select(0);
                }
            },
            //有错误码之后，把后面的错误提醒补齐。
            fail: function (resp) {
                alert(resp);
            }
        });
    };
    /*
     查询债券持仓方法
     */
    var queryVunitStock = function () {
        var condition = (new nui.Form("vunitstockCondition")).getData();
        if (!condition.vcCombiName) {
            nui.alert("请最少选择一个组合！", "警告");
            return false;
        }
        var vcStockType = condition.vcStockType ? condition.vcStockType.replace(/,/g, "','") : "";
        if (vcStockType !== "") {
            vcStockType = "'" + vcStockType + "'";
        }
        var ratingForecast = nui.get("ratingForecast").getText().replace(/,/g, "','");
        if (ratingForecast !== "") {
            ratingForecast = "'" + ratingForecast + "'";
        }
        var vcIssueAppraise = nui.get("vcIssueAppraise").getText().replace(/,/g, "','");
        if (vcIssueAppraise !== "") {
            vcIssueAppraise = "'" + vcIssueAppraise + "'";
        }
        var issueProperty = nui.get("issueProperty").getValue();
        issueProperty = issueProperty ? issueProperty.replace(/,/g, "','") : "";
        if (issueProperty !== "") {
            issueProperty = "'" + issueProperty + "'";
        }
        var vunitstockParam = {
            fundId: condition.fundCodeName,
            baseCombiId: condition.vcCombiName,
            ratingForecast: ratingForecast,
            vcPaymentPlace: condition.vcPaymentPlace,
            vcStockType: vcStockType,
            vcIssueAppraise: vcIssueAppraise,
            issueProperty: issueProperty,
            vcStockCode: condition.vcStockCode2
        };
        vunitstockGrid.load({"vunitstockParam": vunitstockParam});
    };
    //查询可用数据
    function queryVisible(datas, grid) {
        var VunitData = datas;
        nui.ajax({
            data: {'vunitstockLists': VunitData, "vcMarket": 'OTC'},
            url: "com.cjhxfund.ats.sm.repurchase.RepurchaseBizManager.queryVisible.biz.ext",
            success: function (resp) {
                var avaiList = resp.avaiList;
                for (var i = 0; i < VunitData.length; i++) {
                        var row = VunitData[i];
                        for (var j = 0; j < avaiList.length; j++) {
                            var ava = avaiList[j];
                            if (row.vcCombiCode == ava.VC_ACCOUNT && row.vcReportCode == ava.VC_SYMBOL) {
                                var vcAvailablequantityT0Temp = ava.VC_AVAILABLEQUANTITY_T0;
                                var vcAvailablequantityT1Temp = ava.VC_AVAILABLEQUANTITY_T1;
                                if (ava.C_LOCAL_AVAILABLE != null && ava.C_LOCAL_AVAILABLE == "0") {//不启用本地可用计算
                                    vcAvailablequantityT0Temp = ava.VC_O32_AVAILABLEQUANTITY_T0;
                                    vcAvailablequantityT1Temp = ava.VC_O32_AVAILABLEQUANTITY_T1;
                                }
                                if (vcAvailablequantityT0Temp > 0) {
                                    VunitData[i].vcAvailablequantityT0 = vcAvailablequantityT0Temp;
                                } else {
                                    VunitData[i].vcAvailablequantityT0 = 0;
                                }
                                if (vcAvailablequantityT1Temp > 0) {
                                    VunitData[i].vcAvailablequantityT1 = vcAvailablequantityT1Temp;
                                } else {
                                    VunitData[i].vcAvailablequantityT1 = 0;
                                }
                                grid.updateRow(VunitData[i]);
                                break;
                            }
                        }
                    }
            },
            //有错误码之后，把后面的错误提醒补齐。
            fail: function (resp) {
                alert(resp);
            }

        });
    }

	//页面加载时设置查询条件
	function SetSearchField(data) {
        fundCodeCombo.setValue(data.vcProductCode);
        fundCodeCombo.setText(data.vcProductCodeText);
	    $.ajax({
	        data: {vcProductCode: data.vcProductCode, queryType: "'03'"},
	        url: "com.cjhxfund.commonUtil.applyInstUtil.queryCombiInfoByProductCodeAndRealType.biz.ext",
	        success: function (resp) {
	            vcCombiCombo.setValue("");
	            if (resp.data) {
	                vcCombiCombo.load(resp.data);
	                vcCombiCombo.setValue(data.vcCombiCode);
	        		vcCombiCombo.setText(data.vcCombiCodeText);
	        		queryVunitStock();
	        		}
	        		},
	        //有错误码之后，把后面的错误提醒补齐。
	        fail: function (resp) {
	            alert(resp);
	        }
	    });
        bondData = data.bondData;
        if(data.entrustDire === '6'){
        	fundCodeCombo.enable();
        	vcCombiCombo.enable();
        }
    }
	//导入选择债券，要加去重功能
	//计算券面金额
	var copySelectData = function (rows) {
	    var temp = rows;
	    var temp2 = [];
	    for (var i = 0; i < temp.length; i++) {
	        var object = {};
	        for (var key in temp[i]) {
	            object[key] = temp[i][key];
	        }
	        //券面金额、
	        if (object["vcAvailablequantityT0"]) {
	            object["enFaceAmount"] = object["vcAvailablequantityT0"] / 100;// 券面金额= T+0可质押数量/100
	        } else {
	            object["enFaceAmount"] = 0;
	        }
	        //默认质押比率
	        if (object["enCbValueNetValue"]) {
	            var enCbValueNetValue = object["enCbValueNetValue"];//  质押比率=  净价（T-1）>100?100：净价（T-1）
	            var index = enCbValueNetValue.indexOf(".");
	            if(index>0){
	            	enCbValueNetValue = enCbValueNetValue.slice(0, index);
	            	object["enMortagageRatio"] = enCbValueNetValue > 100 ? "100" : enCbValueNetValue.toString();
	            }
	        } else {
	            object["enMortagageRatio"] = 0;
	        }
	        //计算可做回购金额    可做回购金额=（质押比率/100）*券面金额
	        object["canRepurchaseAmount"] = mul(div(object["enMortagageRatio"], 100), object["enFaceAmount"]);
	        temp2.push(object);
	    }
	    return temp2;
	};
	//选择债券方法
	var chooseBond = function (rowsData) {
		var rows = copySelectData(vunitstockGrid.getSelecteds());
	    var bool = true;
	    var idStr = "canRepAmountZ";
	    var remindStr = "";
	    //不能选择ABN类型的债券
	    	var vcStockName = rows[0].vcStockName;
	    	if(vcStockName && (vcStockName.indexOf("PPN")>=0 || vcStockName.indexOf("ABN")>=0)){
    		bool = false;
    		remindStr = remindStr + "<br/>不能选择PPN、ABN类型债券！("+ rows[0].vcReportCode +")";
    	}
	    if(!bool){
	    	nui.alert(remindStr,"系统提示");
	        return false;
	    }
	    if(rows[0].vcDepository !== "01"){
	        idStr = "canRepAmountS";
	    }
	    //计算可正回购金额（中债）（上清）
	    deposit = idStr;
	    vunitstockGrid.clearSelect(true);
	    window.Owner.setChooseBond(rows);
	    window.CloseOwnerWindow();
	};
	//列表中转译托管机构
	function depository(e){
		return nui.getDictText("CF_JY_DJTGCS",e.row.vcDepository);
	}
	//债项评级
	function vcBondAppraiseRD(e){
		return nui.getDictText("creditRating",e.row.vcBondAppraise);
	}
	//主体评级
	function vcIssueAppraiseRD(e){
		
		return nui.getDictText("issuerRating",e.row.vcIssueAppraise);
	}
	//评级展望
	function lRatingForecastRD(e){
		return nui.getDictText("ratingOutlook",e.row.lRatingForecast);
	}
	//评级机构
	function vcBondAppraiseOrganRD(e){
		
		return nui.getDictText("outRatingOrgan",e.row.vcBondAppraiseOrgan);
	}
	function atsFmIssueProperty(e){
		return nui.getDictText("ATS_FM_ISSUE_PROPERTY",e.row.vcIssueProperty);
	}
	//转换摘牌日期格式
	function Delisting(e){
		if(e.value){
			return DateUtil.numStrToDateStr(e.value);
		}
		return "";
	}
	function cancel(){
		window.CloseOwnerWindow();
	}
	//页面X的删除功能
	function onCloseClick(e) {
	    var obj = e.sender;
	    obj.setText("");
	    obj.setValue("");
	}
	//重置按钮
	var reset = function () {
		nui.get("vcPaymentPlace").setValue(null);
		nui.get("ratingForecast").setValue(null);
		nui.get("vcIssueAppraise").setValue(null);
		nui.get("issueProperty").setValue(null);
		nui.get("vcStockType").setValue(null);
		nui.get("vcStockCode2").setValue(null);
		nui.get("vcStockCode2").setText("");
	};
	
    $(function () {
    //去掉No Result
	$("#vcStockCode2>span>input").attr("placeholder","请输入债券代码...");
        fundCodeCombo = nui.get("fundCodeName");
        vcCombiCombo = nui.get("vcCombi");
        vunitstockGrid = nui.get("vunitstockGrid");
        vunitstockGrid.getFooterEl().innerHTML="<div style='float: right; width: 130px; text-align: left; display: block;'>共0条</div>";
        //綁定債券查詢異步加載可用方法
        vunitstockGrid.on("load", function (e){
        	vunitstockGrid.getFooterEl().innerHTML="<div style='float: right; width: 130px; text-align: left; display: block;'>共"+e.total+"条</div>";
         	//成功查询后加载可用数据
			queryVisible(vunitstockGrid.data, vunitstockGrid);
      	});
        //设置托管机构
    nui.get("vcPaymentPlace").load([{
        id:"01",
        name:"中央结算公司"
    },{
        id:"02",
        name:"上海清算所"
    }]);
    //设置用户自定义拖动表头
    vunitstockGrid.on("columnschanged",function(e){
    	test(e);
    });
    });
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/com.cjhxfund.js.base/utils/DateUtil.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/com.cjhxfund.js.base/utils/CalcUtil.js"></script>
</body>
</html>