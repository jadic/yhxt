package com.gesoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gesoft.common.EntityDAO;
import com.gesoft.common.EntityService;
import com.gesoft.dao.AQueryDAO;
import com.gesoft.model.BaseModel;
import com.gesoft.model.OutModel;
import com.gesoft.model.QueryModel;

@Service
@Transactional
public class AQueryService extends EntityService<BaseModel, Long> {
    
    @Resource
    private AQueryDAO aQueryDAO;

    @Override
    protected EntityDAO<BaseModel, Long> getEntityDao() {
        return this.aQueryDAO;
    }

    public int queryFeedbackCnt(QueryModel model) {
        return aQueryDAO.queryFeedbackCnt(model);
    }
    
    public List<OutModel> queryFeedback(QueryModel model) {
        return aQueryDAO.queryFeedback(model);
    }
    
    public int querySportRecordCnt(QueryModel model) {
        return aQueryDAO.querySportRecordCnt(model);
    }
    
    public List<OutModel> querySportRecord(QueryModel model) {
        return aQueryDAO.querySportRecord(model);
    }
    
    public int queryDietRecordCnt(QueryModel model) {
        return aQueryDAO.queryDietRecordCnt(model);
    }
    
    public List<OutModel> queryDietRecord(QueryModel model) {
        return aQueryDAO.queryDietRecord(model);
    }
    
    public int queryMentalStatusRecordCnt(QueryModel model) {
        return aQueryDAO.queryMentalStatusRecordCnt(model);
    }
    
    public List<OutModel> queryMentalStatusRecord(QueryModel model) {
        return aQueryDAO.queryMentalStatusRecord(model);
    }
}
