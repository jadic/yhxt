/**
 * 文件名称：AppController.java
 * 版权所有：Copyright njty
 * 创建时间：2015年3月8日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gesoft.model.MsgModel;
import com.gesoft.model.QueryModel;
import com.gesoft.model.RelativePhoneModel;
import com.gesoft.model.UserModel;
import com.gesoft.service.AppService;


/**
 * APP接口
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Controller
@RequestMapping("/app")
public class AppController extends BaseController
{
	private static final Logger logger = LoggerFactory.getLogger(AppController.class);
	
	@Resource
	private AppService appService;
	
	
	
	/**
	 * 描述信息：我的亲情号码
	 * 创建时间：2015年3月8日 上午7:27:29
	 * @author WCL (ln_admin@yeah.net)
	 * @param model
	 * @return  , method=RequestMethod.POST
	 */
	@RequestMapping(value="/relativePhone.do")
	public @ResponseBody MsgModel relativePhone(QueryModel model)
	{
		MsgModel msgModel = new MsgModel();
		try
		{
			long recordCount = appService.queryRelativePhoneInfoCnt(model);
			if(recordCount>0)
			{
				setPageModel(recordCount, model);
				List<RelativePhoneModel> argArgs = appService.queryRelativePhoneInfo(model);
				if (argArgs != null && argArgs.size() > 0)
				{
					msgModel.setTotal(recordCount);
					msgModel.setRows(argArgs);
				}
			}
		}
		catch (Exception e)
		{
			logger.error("AppController relativePhone error：", e);
		}
		return msgModel;
	}
	
	/**
	 * 查询用户信息
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getUserInfo.do")
	public @ResponseBody UserModel queryUserInfo(QueryModel model) {
	    UserModel userModel = null;
	    try {
	        userModel = appService.queryUserInfo(model);
	    } catch (Exception e){
	        logger.error("AppController getUserInfo error:", e);
	    }
	    return userModel;
	}
}
