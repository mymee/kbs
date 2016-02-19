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

    public ValueObject selectKoreanBattle(ValueObject paramVo){
        return sqlSession.selectOne("TeamInfo.selectTeamInfo", paramVo);
    }

    public List<ValueObject> selectKoreanBattleList(ValueObject paramVo){
        return sqlSession.selectList("TeamInfo.selectTeamInfoList", paramVo);
    }

    public int insertKoreanBattle(ValueObject paramVo){
        return sqlSession.insert("TeamInfo.insertKoreanBattle", paramVo);
    }

    public int updateKoreanBattle(ValueObject paramVo){
        return sqlSession.update("TeamInfo.updateKoreanBattle", paramVo);
    }

    public int deleteKoreanBattle(ValueObject paramVo){
        return sqlSession.delete("TeamInfo.deleteKoreanBattle", paramVo);
    }
}
