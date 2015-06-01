package com.gesoft.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gesoft.model.CircleModuleModel;
import com.gesoft.model.MsgModel;
import com.gesoft.service.ACircleModuleService;

@Controller
@RequestMapping("/a/circleModule")
public class ACircleModuleController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(ACircleModuleController.class);

    @Resource
    private ACircleModuleService aCircleModuleService;

    /**
     * 描述信息：分页查询 创建时间：2015年1月29日 下午2:34:54
     * 
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/query.do", method = RequestMethod.POST)
    public @ResponseBody MsgModel search(CircleModuleModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            aCircleModuleService.findPageList(model, msgModel);
        } catch (Exception e) {
            logger.error("ACircleModuleController search error：", e);
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
    public @ResponseBody MsgModel add(CircleModuleModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (aCircleModuleService.save(model) > 0) {
                msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
            }
        } catch (Exception e) {
            logger.error("ACircleModuleController add error：", e);
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
    public @ResponseBody MsgModel modify(CircleModuleModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (aCircleModuleService.update(model) > 0) {
                msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
            }
        } catch (Exception e) {
            logger.error("ACircleModuleController modify error：", e);
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
    public @ResponseBody MsgModel delete(CircleModuleModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (aCircleModuleService.delete(model) > 0) {
                msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
            }
        } catch (Exception e) {
            logger.error("ACircleModuleController delete error：", e);
        }
        return msgModel;
    }

}
