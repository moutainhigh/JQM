package com.cjhxfund.ats.instruction.Util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("")
public class StrUtil {
	
	/**
	 * 将字符串拼凑成SQL in 条件的格式
	 * @param str 需转换的字符串，以英文逗号或分号分隔
	 * @return
	 */
	@Bizlet("")
	public static Map<String,String> changeToStr(Map<String,String> strMap){
		for(Map.Entry<String, String> entry : strMap.entrySet()){
			String key = entry.getKey();
			String str = entry.getValue();
			String result = null;
			if(StringUtils.isBlank(str)){
				strMap.put(key, result);
			}
			else{
				StringBuffer sb = new StringBuffer();				
				String[] strArr = str.replaceAll(";", ",").split(",");
				for(int i=0; i<strArr.length; i++){
					if(StringUtils.isNotEmpty(strArr[i])){
						sb.append("'").append(strArr[i]).append("',");
					}
				}
				if(sb.length()>0){
					result = sb.substring(0, sb.length()-1);
				}
				strMap.put(key, result);
			}
		}
		return strMap;		
	}
	
	/**
	 * 把传入的类型dateobejct[] 转为  类型List<DataObject>
	 * @author 姜坎骞
	 * @param data（类型dateobejct[]） 入参
	 * @return	list(类型List<DataObject>)
	 */
	@Bizlet("dataobject[]转List<DataObject>")
	public static List<DataObject> objectReplaceList(DataObject[] data){
		List<DataObject> list = new ArrayList<DataObject>();
		if(data.length > 0){
			for(int i=0; i<data.length; i++){
				// 业务类别翻译
				if(data[i].getString("vcBusinType") != null){
					String str = getDictidName("interestSwapBusinType",data[i].getString("vcBusinType"));
					data[i].setString("vcBusinType", str);
				}
				// 业务名称翻译
				if(data[i].getString("vcBusinName") != null){
					String str = getDictidName("interestSwapBusinName",data[i].getString("vcBusinName"));
					data[i].setString("vcBusinName", str);
				}
				// 交易状态翻译
				if(data[i].getString("cIsValid") != null){
					String str = getDictidName("instructStatus",data[i].getString("cIsValid"));
					data[i].setString("cIsValid", str);
				}
				// 指令来源翻译
				if(data[i].getString("vcInstructSource") != null){
					String str = getDictidName("instructResource",data[i].getString("vcInstructSource"));
					data[i].setString("vcInstructSource", str);
				}
				// 时间显示格式
				SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				// 客户录单时间
				if(data[i].getString("tInputTime") != null){
					String tResultInputTimeText = data[i].getString("vcInitiatorName") +" "+ dateTime.format(data[i].getDate("tInputTime"));
					data[i].setString("tInputTime", tResultInputTimeText);
				}
				//录单复核时间
				if(data[i].getString("tReviewTime") != null){
					String tResultInputTimeText = data[i].getString("vcReviewName") +" "+ dateTime.format(data[i].getDate("tReviewTime"));
					data[i].setString("tReviewTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tClientTime") != null){
					String tResultInputTimeText = data[i].getString("vcClientName") +" "+ dateTime.format(data[i].getDate("tClientTime"));
					data[i].setString("tClientTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tTraderfTime") != null){
					String tResultInputTimeText = data[i].getString("vcTraderfName") +" "+ dateTime.format(data[i].getDate("tTraderfTime"));
					data[i].setString("tTraderfTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tTradesTime") != null){
					String tResultInputTimeText = data[i].getString("vcTradesName") +" "+ dateTime.format(data[i].getDate("tTradesTime"));
					data[i].setString("tTradesTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tInvestmanagerTime") != null){
					String tResultInputTimeText = data[i].getString("vcInvestmanagerName") +" "+ dateTime.format(data[i].getDate("tInvestmanagerTime"));
					data[i].setString("tInvestmanagerTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tTradedepTime") != null){
					String tResultInputTimeText = data[i].getString("vcTradedepName") +" "+ dateTime.format(data[i].getDate("tTradedepTime"));
					data[i].setString("tTradedepTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tRiskmanagerTime") != null){
					String tResultInputTimeText = data[i].getString("vcRiskmanagerName") +" "+ dateTime.format(data[i].getDate("tRiskmanagerTime"));
					data[i].setString("tRiskmanagerTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tFsOperateTime") != null){
					String tResultInputTimeText = data[i].getString("vcFsOperateName") +" "+ dateTime.format(data[i].getDate("tFsOperateTime"));
					data[i].setString("tFsOperateTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tFsReviewTime") != null){
					String tResultInputTimeText = data[i].getString("vcFsReviewName") +" "+ dateTime.format(data[i].getDate("tFsReviewTime"));
					data[i].setString("tFsReviewTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tFsDealTime") != null){
					String tResultInputTimeText = data[i].getString("vcFsdealName") +" "+ dateTime.format(data[i].getDate("tFsDealTime"));
					data[i].setString("tFsDealTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tBsDealTime") != null){
					String tResultInputTimeText = data[i].getString("vcBsDealName") +" "+ dateTime.format(data[i].getDate("tBsDealTime"));
					data[i].setString("tBsDealTime", tResultInputTimeText);
				}
				
				list.add(data[i]);
				
			}
		}
		return list;
	}
	
	@Bizlet("dataobject[]转List<DataObject>")
	public static List<DataObject> chargeReplaceList(DataObject[] data){
		List<DataObject> list = new ArrayList<DataObject>();
		if(data.length > 0){
			for(int i=0; i<data.length; i++){
				// 业务类别翻译
				if(data[i].getString("vcChargeType") != null){
					String str = getDictidName("interestSwapChargeType",data[i].getString("vcChargeType"));
					data[i].setString("vcChargeType", str);
				}
				// 交易状态翻译
				if(data[i].getString("cIsValid") != null){
					String str = getDictidName("instructStatus",data[i].getString("cIsValid"));
					data[i].setString("cIsValid", str);
				}
				// 指令来源翻译
				if(data[i].getString("vcInstructSource") != null){
					String str = getDictidName("instructResource",data[i].getString("vcInstructSource"));
					data[i].setString("vcInstructSource", str);
				}
				
				// 时间显示格式
				SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				// 录入时间
				if(data[i].getString("tInputTime") != null){
					String tResultInputTimeText = data[i].getString("vcInitiatorName") +" "+ dateTime.format(data[i].getDate("tInputTime"));
					data[i].setString("tInputTime", tResultInputTimeText);
				}
				// 复核时间
				if(data[i].getString("tReviewTime") != null){
					String tResultInputTimeText = data[i].getString("vcReviewName") +" "+ dateTime.format(data[i].getDate("tReviewTime"));
					data[i].setString("tReviewTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tClientTime") != null){
					String tResultInputTimeText = data[i].getString("vcClientName") +" "
					+ dateTime.format(data[i].getDate("tClientTime"));
					data[i].setString("tClientTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tTraderfTime") != null){
					String tResultInputTimeText = data[i].getString("vcTraderfName") +" "
					+ dateTime.format(data[i].getDate("tTraderfTime"));
					data[i].setString("tTraderfTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tTradesTime") != null){
					String tResultInputTimeText = data[i].getString("vcTradesName") +" "
					+ dateTime.format(data[i].getDate("tTradesTime"));
					data[i].setString("tTradesTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tInvestmanagerTime") != null){
					String tResultInputTimeText = data[i].getString("vcInvestmanagerName") +" "
					+ dateTime.format(data[i].getDate("tInvestmanagerTime"));
					data[i].setString("tInvestmanagerTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tTradedepTime") != null){
					String tResultInputTimeText = data[i].getString("vcTradedepName") +" "
					+ dateTime.format(data[i].getDate("tTradedepTime"));
					data[i].setString("tTradedepTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tRiskmanagerTime") != null){
					String tResultInputTimeText = data[i].getString("vcRiskmanagerName") +" "
					+ dateTime.format(data[i].getDate("tRiskmanagerTime"));
					data[i].setString("tRiskmanagerTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tComdepTime") != null){
					String tResultInputTimeText = data[i].getString("vcComdepName") +" "
					+ dateTime.format(data[i].getDate("tComdepTime"));
					data[i].setString("tComdepTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tChargeimplTime") != null){
					String tResultInputTimeText = data[i].getString("vcChargeimplName") +" "
					+ dateTime.format(data[i].getDate("tChargeimplTime"));
					data[i].setString("tChargeimplTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tChargeconfirmTime") != null){
					String tResultInputTimeText = data[i].getString("vcChargeconfirmName") +" "
					+ dateTime.format(data[i].getDate("tChargeconfirmTime"));
					data[i].setString("tChargeconfirmTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tChargereviewTime") != null){
					String tResultInputTimeText = data[i].getString("vcChargereviewName") +" "
					+ dateTime.format(data[i].getDate("tChargereviewTime"));
					data[i].setString("tChargereviewTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tCapitalclearTime") != null){
					String tResultInputTimeText = data[i].getString("vcCapitalclearName") +" "
					+ dateTime.format(data[i].getDate("tCapitalclearTime"));
					data[i].setString("tCapitalclearTime", tResultInputTimeText);
				}
				
				list.add(data[i]);
			}
		}
		return list;
	}
	
	@Bizlet("dataobject[]转List<DataObject>")
	public static List<DataObject> goldReplaceList(DataObject[] data){
		List<DataObject> list = new ArrayList<DataObject>();
		if(data.length > 0){
			for(int i=0; i<data.length; i++){
				// 委托方向翻译
				if(data[i].getString("vcEntrustDirection") != null){
					String str = getDictidName("goldEentrustDirection",data[i].getString("vcEntrustDirection"));
					data[i].setString("vcEntrustDirection", str);
				}
				// 交易状态翻译
				if(data[i].getString("cIsValid") != null){
					String str = getDictidName("instructStatus",data[i].getString("cIsValid"));
					data[i].setString("cIsValid", str);
				}
				// 指令来源翻译
				if(data[i].getString("vcInstructSource") != null){
					String str = getDictidName("instructResource",data[i].getString("vcInstructSource"));
					data[i].setString("vcInstructSource", str);
				}
				
				// 时间显示格式
				SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				// 录入时间
				if(data[i].getString("tInputTime") != null){
					String tResultInputTimeText = data[i].getString("vcInitiatorName") +" "+ dateTime.format(data[i].getDate("tInputTime"));
					data[i].setString("tInputTime", tResultInputTimeText);
				}
				// 复核时间
				if(data[i].getString("tReviewTime") != null){
					String tResultInputTimeText = data[i].getString("vcReviewName") +" "+ dateTime.format(data[i].getDate("tReviewTime"));
					data[i].setString("tReviewTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tClientTime") != null){
					String tResultInputTimeText = data[i].getString("vcClientName") +" "
					+ dateTime.format(data[i].getDate("tClientTime"));
					data[i].setString("tClientTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tTraderfTime") != null){
					String tResultInputTimeText = data[i].getString("vcTraderfName") +" "
					+ dateTime.format(data[i].getDate("tTraderfTime"));
					data[i].setString("tTraderfTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tTradesTime") != null){
					String tResultInputTimeText = data[i].getString("vcTradesName") +" "
					+ dateTime.format(data[i].getDate("tTradesTime"));
					data[i].setString("tTradesTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tInvestmanagerTime") != null){
					String tResultInputTimeText = data[i].getString("vcInvestmanagerName") +" "
					+ dateTime.format(data[i].getDate("tInvestmanagerTime"));
					data[i].setString("tInvestmanagerTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tTradedepTime") != null){
					String tResultInputTimeText = data[i].getString("vcTradedepName") +" "
					+ dateTime.format(data[i].getDate("tTradedepTime"));
					data[i].setString("tTradedepTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tRiskmanagerTime") != null){
					String tResultInputTimeText = data[i].getString("vcRiskmanagerName") +" "
					+ dateTime.format(data[i].getDate("tRiskmanagerTime"));
					data[i].setString("tRiskmanagerTime", tResultInputTimeText);
				}
				
				if(data[i].getString("tComdepTime") != null){
					String tResultInputTimeText = data[i].getString("vcComdepName") +" "
					+ dateTime.format(data[i].getDate("tComdepTime"));
					data[i].setString("tComdepTime", tResultInputTimeText);
				}				
				
				if(data[i].getString("tCapitalclearTime") != null){
					String tResultInputTimeText = data[i].getString("vcCapitalclearName") +" "
					+ dateTime.format(data[i].getDate("tCapitalclearTime"));
					data[i].setString("tCapitalclearTime", tResultInputTimeText);
				}
				
				list.add(data[i]);
			}
		}
		return list;
	}
	
	@Bizlet("dataobject[]转List<DataObject>")
	public static List<DataObject> countReplaceList(DataObject[] data){
		List<DataObject> list = new ArrayList<DataObject>();
		if(data.length > 0){
			for(int i=0; i<data.length; i++){
				// 业务类别翻译
				if(data[i].getString("vcBusinType") != null){
					String str = getDictidName("interestSwapBusinType",data[i].getString("vcBusinType"));
					data[i].setString("vcBusinType", str);
				}
				// 业务名称翻译
				if(data[i].getString("vcBusinName") != null){
					String str = getDictidName("interestSwapBusinName",data[i].getString("vcBusinName"));
					data[i].setString("vcBusinName", str);
				}
				
				Double lNominalCapital = data[i].getDouble("lNominalCapital");
				Double lSpendCapital = data[i].getDouble("lSpendCapital");
				if(lNominalCapital != null && lSpendCapital != null){				
					Double lLeftCapital = lNominalCapital - lSpendCapital;
					data[i].setDouble("lLeftCapital", lLeftCapital);
				}
				
				// 时间显示格式
				SimpleDateFormat dateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				// 录入时间
				if(data[i].getString("tInputTime") != null){
					String tResultInputTimeText = data[i].getString("vcInitiatorName") +" "+ dateTime.format(data[i].getDate("tInputTime"));
					data[i].setString("tInputTime", tResultInputTimeText);
				}
				// 复核时间
				if(data[i].getString("tReviewTime") != null){
					String tResultInputTimeText = data[i].getString("vcReviewName") +" "+ dateTime.format(data[i].getDate("tReviewTime"));
					data[i].setString("tReviewTime", tResultInputTimeText);
				}
				// 前台成交时间
				if(data[i].getString("tFsDealTime") != null){
					String tResultInputTimeText = data[i].getString("vcFsdealName") +" "+ dateTime.format(data[i].getDate("tFsDealTime"));
					data[i].setString("tFsDealTime", tResultInputTimeText);
				}
				list.add(data[i]);
			}
		}
		return list;
	}
	
	/**
	 * 根据字典名称和翻译项id获取翻译项名称
	 * @param dicttypeid 字典项id
	 * @param dictid	字典参数表id
	 * @author jiangkanqian
	 * @return
	 */
	public static String getDictidName(String dicttypeid, String dictid) {
		String dictidName = null;
		DataObject[] objs = BusinessDictUtil.getDictInfoByType(dicttypeid);
		Map<String, String> maps = new HashMap<String, String>();
		for (int i = 0; i < objs.length; i++) {
			maps.put(objs[i].getString("dictID"), objs[i].getString("dictName"));
		}
		if(!dictid.equals("") && dictid != null){
			dictidName = maps.get(dictid);
		}
		return dictidName;
	}
	
	@Bizlet("")
	public String getRollBackState(String processDefName,String activity){
		String processState = null;
		if("com.cjhxfund.ats.instruction.InterestSwap.openInterestSwap".equals(processDefName)){
			if("manualActivity3".equals(activity) || "manualActivity4".equals(activity) || "manualActivity5F1".equals(activity)
			|| "manualActivity5F2".equals(activity) || "manualActivity5F3".equals(activity)){
				processState="1";
			}
			else if("manualActivity6".equals(activity) || "manualActivity7".equals(activity)){
				processState="2";
			}
			else if("manualActivity8".equals(activity)){
				processState="3";
			}
			else if("manualActivity9".equals(activity)){
				processState="4";
			}
			
		}
		
		if("com.cjhxfund.ats.instruction.InterestSwap.chargeInterestSwap".equals(processDefName)){
			if("manualActivity3".equals(activity) || "manualActivity4".equals(activity) || "manualActivity5F1".equals(activity)
			|| "manualActivity5F2".equals(activity) || "manualActivity5F3".equals(activity)){
				processState="1";
			}
			else if("manualActivity6".equals(activity) || "manualActivity7".equals(activity)){
				processState="2";
			}
			else if("manualActivity8".equals(activity) || "manualActivity9".equals(activity)){
				processState="3";
			}
			else if("manualActivity10".equals(activity)){
				processState="4";
			}
			
		}
		
		if("com.cjhxfund.ats.instruction.InterestSwap.goldInterestSwap".equals(processDefName)){
			if("manualActivity3".equals(activity) || "manualActivity4".equals(activity) || "manualActivity5".equals(activity)){
				processState="1";
			}
			else if("manualActivity6".equals(activity) || "manualActivity7".equals(activity)){
				processState="2";
			}
			
		}
		
		return processState;
		
	}
	
	@Bizlet("")
	public String getProcessState(String processDefName,String activity,String nextActivity){
		String processState = null;
		if("com.cjhxfund.ats.instruction.InterestSwap.openInterestSwap".equals(processDefName)){
			if("manualActivity7".equals(activity)){
				processState="5";
			}
			else{
				if(nextActivity != null){
					if("manualActivity4".equals(nextActivity)){
						processState="1";				
					}
					if("manualActivity5".equals(nextActivity)){
						processState="2";				
					}
					if("manualActivity6".equals(nextActivity)){
						processState="3";				
					}
					if("manualActivity7".equals(nextActivity)){
						processState="4";				
					}
				}	
			}
		}
		
		if("com.cjhxfund.ats.instruction.InterestSwap.chargeInterestSwap".equals(processDefName)){
			if("manualActivity10".equals(activity)){
				processState="5";
			}
			else{
				if(nextActivity != null){
					if("manualActivity3".equals(nextActivity)){
						processState="1";				
					}
					if("manualActivity6".equals(nextActivity) || "manualActivity7".equals(nextActivity)){
						processState="2";				
					}
					if("manualActivity8".equals(nextActivity)){
						processState="3";				
					}
					if("manualActivity10".equals(nextActivity)){
						processState="4";				
					}
				}	
			}
		}
		
		if("com.cjhxfund.ats.instruction.InterestSwap.goldInterestSwap".equals(processDefName)){
			if("manualActivity7".equals(activity)){
				processState="3";
			}
			else{
				if(nextActivity != null){
					if("manualActivity3".equals(nextActivity)){
						processState="1";				
					}
					if("manualActivity6".equals(nextActivity) || "manualActivity7".equals(nextActivity)){
						processState="2";				
					}
					if("manualActivity7".equals(nextActivity)){
						processState="4";				
					}
				}	
			}
		}
		
		return processState;
	}
	
	@Bizlet("")
	public String getState(String activity){
		String processState = null;
		if(activity != null){
			String arr[] = activity.split("F");
			String arr0 = arr[0];
			if(arr0.length()>=15)
				processState = activity.substring(14, arr0.length());
			}		
		return processState;
	}
	
}
