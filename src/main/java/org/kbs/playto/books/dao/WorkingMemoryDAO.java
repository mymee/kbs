package org.kbs.playto.books.dao;

import org.kbs.playto.books.common.ValueObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorkingMemoryDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public ValueObject selectWorkingMemoryResult(ValueObject paramVo){
        return sqlSession.selectOne("WorkingMemory.selectWorkingMemoryResult", paramVo);
    }
    public int insertWorkingMemory(ValueObject paramVo){
        return sqlSession.insert("WorkingMemory.insertWorkingMemory", paramVo);
    }
}
