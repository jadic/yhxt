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

import com.gesoft.model.DoctorModel;
import com.gesoft.model.HospitalDeptModel;
import com.gesoft.model.HospitalModel;
import com.gesoft.model.MsgModel;
import com.gesoft.service.ADoctorService;

/**
 * 医生管理
 * 
 * @author WCL
 * @version v1.001
 * @since v1.001
 */
@Controller
@RequestMapping("/a/doctor")
public class ADoctorController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(ADoctorController.class);

    @Resource
    private ADoctorService aDoctorService;

    /**
     * 描述信息：分页查询 创建时间：2015年1月29日 下午2:34:54
     * 
     * @author WCL (ln_admin@yeah.net)
     * @param model
     * @return
     */
    @RequestMapping(value = "/query.do", method = RequestMethod.POST)
    public @ResponseBody MsgModel search(DoctorModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            aDoctorService.findPageList(model, msgModel);
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
    public @ResponseBody MsgModel add(DoctorModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (aDoctorService.save(model) > 0) {
                msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
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
    public @ResponseBody MsgModel modify(DoctorModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (aDoctorService.update(model) > 0) {
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
    public @ResponseBody MsgModel delete(DoctorModel model) {
        MsgModel msgModel = new MsgModel();
        try {
            if (aDoctorService.delete(model) > 0) {
                msgModel.setSuccess(GLOBAL_MSG_BOOL_SUCCESS);
            }
        } catch (Exception e) {
            logger.error("AUserController delete error：", e);
        }
        return msgModel;
    }

    /**
     * 查询医院信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/queryHospitals.do", method = RequestMethod.POST)
    public @ResponseBody List<HospitalModel> queryHospitals(DoctorModel model) {
        List<HospitalModel> list = null;
        try {
            list = aDoctorService.queryHospitals(model);
        } catch (Exception e) {
            logger.error("AUserController queryHospitals error：", e);
        }
        return list;
    }

    /**
     * 查询医院信息
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/queryHospitalDepts.do", method = RequestMethod.POST)
    public @ResponseBody List<HospitalDeptModel> queryHospitalDepts(DoctorModel model) {
        List<HospitalDeptModel> list = null;
        try {
            list = aDoctorService.queryHospitalDepts(model);
        } catch (Exception e) {
            logger.error("AUserController queryHospitalDepts error：", e);
        }
        return list;
    }

}
