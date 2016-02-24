package org.kbs.playto.books.dao;

import org.kbs.playto.books.common.ValueObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SystemDAO {
    @Autowired
    private SqlSessionTemplate sqlSession;


    public int updateCleanKoreanBattleQuiz() {
        return sqlSession.update("System.updateCleanKoreanBattleQuiz");
    }

    public int updateCleanQuizInfo() {
        return sqlSession.update("System.updateCleanQuizInfo");
    }

    public int updateCleanQuizProcess() {
        return sqlSession.update("System.updateCleanQuizProcess");
    }

    public int updateCleanTeamInfo() {
        return sqlSession.update("System.updateCleanTeamInfo");
    }

    public int deleteKoreanBattle() {
        return sqlSession.delete("System.deleteKoreanBattle");
    }

    public int deleteWorkingMemory() {
        return sqlSession.delete("System.deleteWorkingMemory");
    }

    public int deleteQuizChance() {
        return sqlSession.delete("System.deleteQuizChance");
    }

    public int deleteQuizScore() {
        return sqlSession.delete("System.deleteQuizScore");
    }
}
