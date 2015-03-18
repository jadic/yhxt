/**
 * 文件名称：AUserController.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年2月2日
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gesoft.model.MsgModel;
import com.gesoft.model.UserModel;
import com.gesoft.service.AUserService;

/**
 * 用户管理
 * 
 * @author WCL
 * @version v1.001
 * @since v1.001
 */
@Controller
@RequestMapping("/a/user")
public class AUserController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(AUserController.class);

    @Resource
    private AUserService aUserService;

    /**
     * 描述信息：分页查询 创建时间：2015年1月29日 下午2:34:54
     * 
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/query.do", method = RequestMethod.POST)
    public @ResponseBody MsgModel search(UserModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            aUserService.findPageList(model, msgModel);
        } catch (Exception e) {
            logger.error("AUserController search error：", e);
        }
        return msgModel;
    }

    /**
     * 描述信息：增加 创建时间：2015年1月29日 下午2:28:20
     * 
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/add.do", method = RequestMethod.POST)
    public @ResponseBody MsgModel add(UserModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (aUserService.queryUserCountWithUsrName(model) <= 0) {
                model.setUserPass(DEFAULT_USER_PASS);// 新增用户时，采用默认密码
                if (aUserService.save(model) > 0) {
                    msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
                }
            } else {
                msgModel.setSuccess(GLOBAL_MSG_BOOL_FAIL);
                msgModel.setMsg("该用户名已经存在");
            }
        } catch (Exception e) {
            logger.error("AUserController add error：", e);
        }
        return msgModel;
    }

    /**
     * 描述信息：修改 创建时间：2015年1月29日 下午5:54:59
     * 
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/modify.do", method = RequestMethod.POST)
    public @ResponseBody MsgModel modify(UserModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (aUserService.update(model) > 0) {
                msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
            }
        } catch (Exception e) {
            logger.error("AUserController modify error：", e);
        }
        return msgModel;
    }

    /**
     * 描述信息：删除 创建时间：2015年1月29日 下午5:54:47
     * 
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/del.do", method = RequestMethod.POST)
    public @ResponseBody MsgModel delete(UserModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (aUserService.delete(model) > 0) {
                msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
            }
        } catch (Exception e) {
            logger.error("AUserController delete error：", e);
        }
        return msgModel;
    }

    /**
     * 描述信息：重置用户名密码 创建时间：2015年1月29日 下午5:54:47
     * 
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/resetPassword.do", method = RequestMethod.POST)
    public @ResponseBody MsgModel resetPassword(UserModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            model.setUserPass(DEFAULT_USER_PASS);
            if (aUserService.resetUserPassword(model) > 0) {
                msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
            }
        } catch (Exception e) {
            logger.error("AUserController resetPassword error：", e);
        }
        return msgModel;
    }

    /**
     * 查询父母账号信息（此处一次返回所有，后期需改动）
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/queryParents.do", method = RequestMethod.POST)
    public @ResponseBody List<UserModel> queryParents(UserModel model) {
        List<UserModel> list = null;
        try {
            list = aUserService.queryParents(model);
        } catch (Exception e) {
            logger.error("AUserController queryParents error：", e);
        }
        return list;
    }

}
