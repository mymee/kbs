package org.kbs.playto.books.dao;

import org.kbs.playto.books.common.ValueObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QuizeDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public ValueObject selectQuizeInfo(ValueObject paramVo){
        return sqlSession.selectOne("QuizeInfo.selectQuizeInfo", paramVo);
    }

    public int insertQuizeAnswer(ValueObject paramVo){
        return sqlSession.insert("QuizeInfo.insertQuizeAnswer", paramVo);
    }

    public int updateQuizeStart(ValueObject paramVo){
        return sqlSession.update("QuizeInfo.updateQuizeStart", paramVo);
    }

    public int updateQuizeEnd(ValueObject paramVo){
        return sqlSession.update("QuizeInfo.updateQuizeEnd", paramVo);
    }

    public int updateQuizePriority(ValueObject paramVo){
        return sqlSession.update("QuizeInfo.updateQuizePriority", paramVo);
    }

    public int updateQuizeDouble(ValueObject paramVo){
        return sqlSession.update("QuizeInfo.updateQuizeDouble", paramVo);
    }
}
