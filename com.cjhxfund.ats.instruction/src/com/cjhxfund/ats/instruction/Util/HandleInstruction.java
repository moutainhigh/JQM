/**
 * 
 */
package com.cjhxfund.ats.instruction.Util;

import java.text.ParseException;

import com.eos.system.annotation.Bizlet;
import commonj.sdo.DataObject;

/**
 * @author jiangkanqian
 * @date 2018-05-02 09:48:56
 *
 */
@Bizlet("")
public class HandleInstruction {
	
	/**
	 * 确认改变指令状态
	 * @param instruct
	 * @return 
	 */
	@Bizlet("确认指令")
	public String confirmInstruction(String processState){
		String newState;
		Integer processNum = Integer.parseInt(processState);
		if(processNum<4)
			processNum++;
		newState = processNum.toString();
		return newState;
	}

}
