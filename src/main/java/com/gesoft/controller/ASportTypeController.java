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
import com.gesoft.model.SportTypeModel;
import com.gesoft.service.ASportTypeService;

@Controller
@RequestMapping("/a/sportType")
public class ASportTypeController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(ASportTypeController.class);

    @Resource
    private ASportTypeService aSportTypeService;

    /**
     * 描述信息：分页查询 创建时间：2015年1月29日 下午2:34:54
     * 
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/query.do", method = RequestMethod.POST)
    public @ResponseBody MsgModel search(SportTypeModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            aSportTypeService.findPageList(model, msgModel);
        } catch (Exception e) {
            logger.error("ASportItemController search error：", e);
        }
        return msgModel;
    }

    @RequestMapping(value = "/querySportTypes.do", method = RequestMethod.POST)
    public @ResponseBody List<SportTypeModel> querySportTypesJson(SportTypeModel model) {
        List<SportTypeModel> list = null;
        try {
            model.setRows(1000);
            model.setStartNum(0);
            list = aSportTypeService.findList(model);
        } catch (Exception e) {
            logger.error("ASportItemController search error：", e);
        }
        return list;
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
    public @ResponseBody MsgModel add(SportTypeModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (aSportTypeService.save(model) > 0) {
                msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
            }
        } catch (Exception e) {
            logger.error("ASportItemController add error：", e);
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
    public @ResponseBody MsgModel modify(SportTypeModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (aSportTypeService.update(model) > 0) {
                msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
            }
        } catch (Exception e) {
            logger.error("ASportItemController modify error：", e);
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
    public @ResponseBody MsgModel delete(SportTypeModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (aSportTypeService.delete(model) > 0) {
                msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
            }
        } catch (Exception e) {
            logger.error("ASportItemController delete error：", e);
        }
        return msgModel;
    }

}
