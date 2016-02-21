package org.kbs.playto.books.dao;

import org.kbs.playto.books.common.ValueObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class KoreanBattleDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;

    public ValueObject selectQuiz(ValueObject paramVo){
        return sqlSession.selectOne("KoreanBattle.selectQuiz", paramVo);
    }

    public int updateKoreanBattleProcess(ValueObject paramVo){
        return sqlSession.update("KoreanBattle.updateKoreanBattleProcess", paramVo);
    }

    public List<ValueObject> selectKoreanBattleList(ValueObject paramVo){
        return sqlSession.selectList("KoreanBattle.selectTeamInfoList", paramVo);
    }

    public int insertKoreanBattleAnswer(ValueObject paramVo){
        return sqlSession.insert("KoreanBattle.insertKoreanBattleAnswer", paramVo);
    }

    public int insertKoreanBattle(ValueObject paramVo){
        return sqlSession.insert("KoreanBattle.insertKoreanBattle", paramVo);
    }

    public int updateKoreanBattle(ValueObject paramVo){
        return sqlSession.update("KoreanBattle.updateKoreanBattle", paramVo);
    }

    public int deleteKoreanBattle(ValueObject paramVo){
        return sqlSession.delete("KoreanBattle.deleteKoreanBattle", paramVo);
    }

    public ValueObject selectKoreanBattleResult(ValueObject paramVo){
        return sqlSession.selectOne("KoreanBattle.selectKoreanBattleResult", paramVo);
    }
}
