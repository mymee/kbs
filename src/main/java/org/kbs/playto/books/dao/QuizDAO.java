package org.kbs.playto.books.dao;

import org.kbs.playto.books.common.ValueObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class QuizDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;
    public ValueObject selectQuizProcessNumber(){
        return sqlSession.selectOne("QuizInfo.selectQuizProcessNumber");
    }
    public int updateQuizProcessNumber(ValueObject paramVo){
        return sqlSession.update("QuizInfo.updateQuizProcessNumber", paramVo);
    }
    public ValueObject selectQuizInfo(ValueObject paramVo){
        return sqlSession.selectOne("QuizInfo.selectQuizInfo", paramVo);
    }
    public List<ValueObject> selectQuizScoreChance(ValueObject paramVo){
        return sqlSession.selectList("QuizInfo.selectQuizScoreChance", paramVo);
    }
    public List<ValueObject> selectQuizNumFirstChance(ValueObject paramVo){
        return sqlSession.selectList("QuizInfo.selectQuizNumFirstChance", paramVo);
    }

    public ValueObject selectQuizScore(ValueObject paramVo){
        return sqlSession.selectOne("QuizInfo.selectQuizScore", paramVo);
    }

    public ValueObject selectQuizChance(ValueObject paramVo){
        return sqlSession.selectOne("QuizInfo.selectQuizChance", paramVo);
    }
    public ValueObject selectQuizTeamChance(ValueObject paramVo){
        return sqlSession.selectOne("QuizInfo.selectQuizTeamChance", paramVo);
    }

    public ValueObject selectQuizInfoProcess(){
        return sqlSession.selectOne("QuizInfo.selectQuizInfoProcess");
    }

    public int insertQuizAnswer(ValueObject paramVo){
        return sqlSession.insert("QuizInfo.insertQuizAnswer", paramVo);
    }

    public int updateQuizStart(ValueObject paramVo){
        return sqlSession.update("QuizInfo.updateQuizStart", paramVo);
    }
    public int updateQuizChanceAgree(ValueObject paramVo){
        return sqlSession.update("QuizInfo.updateQuizChanceAgree", paramVo);
    }

    public int updateQuizEnd(ValueObject paramVo){
        return sqlSession.update("QuizInfo.updateQuizEnd", paramVo);
    }

    public int updateQuizScore(ValueObject paramVo){
        return sqlSession.update("QuizInfo.updateQuizScore", paramVo);
    }


    public int insertQuizChanceInfo(ValueObject paramVo){
        return sqlSession.insert("QuizInfo.insertQuizChanceInfo", paramVo);
    }

    public int updateQuizPriority(ValueObject paramVo){
        return sqlSession.update("QuizInfo.updateQuizPriority", paramVo);
    }

    public int updateQuizDouble(ValueObject paramVo){
        return sqlSession.update("QuizInfo.updateQuizDouble", paramVo);
    }

}
