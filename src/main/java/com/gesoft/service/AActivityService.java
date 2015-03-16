/**
 * 文件名称：AServiceService.java
 * 版权所有：Copyright gesoft
 * 创建时间：2015年2月2日
 * 创 建 人：WCL (ln_admin@yeah.net)
 * 功能描述：
 **/
package com.gesoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.common.EntityDAO;
import com.gesoft.common.EntityService;
import com.gesoft.dao.AActivityDAO;
import com.gesoft.model.ActivityModel;
import com.gesoft.model.DoctorModel;
import com.gesoft.model.QueryModel;

/**
 * 活动管理
 * @author WCL
 * @version v1.001
 * @since   v1.001
 */
@Service
@Transactional
public class AActivityService extends EntityService<ActivityModel, Long>
{
	@Resource
	private AActivityDAO aActivityDAO;
	

	@Override
	protected EntityDAO<ActivityModel, Long> getEntityDao()
	{
		return this.aActivityDAO;
	}
	
	public List<DoctorModel> queryDoctors(QueryModel model) {
	    return this.aActivityDAO.queryDoctors(model);
	}
	
	public List<DoctorModel> queryAssociatedDoctorIds(QueryModel model) {
	    return this.aActivityDAO.queryAssociatedDoctorIds(model);
	}
	
	public boolean insertDoctorAssociation(QueryModel model) {
	    aActivityDAO.deleteDoctorAssociation(model);

	    String doctorIds = model.getDoctorIds();
        if (doctorIds != null && doctorIds.trim().length() > 0) {
            String[] doctorIdArray = doctorIds.split(",");
            for (String sDoctorId : doctorIdArray) {
                int doctorId = Integer.valueOf(sDoctorId);
                model.setDoctorId(doctorId);
                aActivityDAO.addDoctorAssociation(model);
            }
        }
	    return true;
	}
}
