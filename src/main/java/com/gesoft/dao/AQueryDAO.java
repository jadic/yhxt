package com.gesoft.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gesoft.common.EntityDAOImpl;
import com.gesoft.model.BaseModel;
import com.gesoft.model.OutModel;
import com.gesoft.model.QueryModel;

@Repository
public class AQueryDAO extends EntityDAOImpl<BaseModel, Long> {

    @Override
    public String getMybatisSqlMapNamespace() {
        return "AQueryMapper";
    }
    
    public int queryFeedbackCnt(QueryModel model) {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryFeedbackCnt", model);
    }
    
    public List<OutModel> queryFeedback(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryFeedback", model);
    }
    
    public int querySportRecordCnt(QueryModel model) {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".querySportRecordCnt", model);
    }
    
    public List<OutModel> querySportRecord(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".querySportRecord", model);
    }
    
    public int queryDietRecordCnt(QueryModel model) {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryDietRecordCnt", model);
    }
    
    public List<OutModel> queryDietRecord(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryDietRecord", model);
    }
    
    public int queryMentalStatusRecordCnt(QueryModel model) {
        return getSqlSession().selectOne(getMybatisSqlMapNamespace() + ".queryMentalStatusRecordCnt", model);
    }
    
    public List<OutModel> queryMentalStatusRecord(QueryModel model) {
        return getSqlSession().selectList(getMybatisSqlMapNamespace() + ".queryMentalStatusRecord", model);
    }
    
}
