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
import com.gesoft.model.OutModel;
import com.gesoft.model.QueryModel;
import com.gesoft.service.AQueryService;

/**
 * @author WCL
 * @version v1.001
 * @since v1.001
 */
@Controller
@RequestMapping("/a/query")
public class AQueryController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(AQueryController.class);

    @Resource
    private AQueryService aQueryService;

    /**
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/queryFeedback.do", method = RequestMethod.POST)
    public @ResponseBody MsgModel queryFeedback(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            int cnt = aQueryService.queryFeedbackCnt(model);
            if (cnt > 0) {
                setPageModel(cnt, model);
                List<OutModel> list = aQueryService.queryFeedback(model);
                msgModel.setRows(list);
            }
            msgModel.setSuccess(true);
        } catch (Exception e) {
            logger.error("AQueryController queryFeedback error：", e);
        }
        return msgModel;
    }
    
    /**
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/querySportRecord.do", method = RequestMethod.POST)
    public @ResponseBody MsgModel querySportRecord(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            int cnt = aQueryService.querySportRecordCnt(model);
            if (cnt > 0) {
                setPageModel(cnt, model);
                List<OutModel> list = aQueryService.querySportRecord(model);
                msgModel.setRows(list);
            }
            msgModel.setSuccess(true);
        } catch (Exception e) {
            logger.error("AQueryController querySportRecord error：", e);
        }
        return msgModel;
    }
    
    /**
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/queryDietRecord.do", method = RequestMethod.POST)
    public @ResponseBody MsgModel queryDietRecord(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            int cnt = aQueryService.queryDietRecordCnt(model);
            if (cnt > 0) {
                setPageModel(cnt, model);
                List<OutModel> list = aQueryService.queryDietRecord(model);
                msgModel.setRows(list);
            }
            msgModel.setSuccess(true);
        } catch (Exception e) {
            logger.error("AQueryController queryDietRecord error：", e);
        }
        return msgModel;
    }
    
    /**
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/queryMentalStatusRecord.do", method = RequestMethod.POST)
    public @ResponseBody MsgModel queryMentalStatusRecord(QueryModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            int cnt = aQueryService.queryMentalStatusRecordCnt(model);
            if (cnt > 0) {
                setPageModel(cnt, model);
                List<OutModel> list = aQueryService.queryMentalStatusRecord(model);
                msgModel.setRows(list);
            }
            msgModel.setSuccess(true);
        } catch (Exception e) {
            logger.error("AQueryController queryMentalStatusRecord error：", e);
        }
        return msgModel;
    }
    
}
