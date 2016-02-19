package org.kbs.playto.books.dao;

import org.kbs.playto.books.common.ValueObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TeamInfoDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public ValueObject selectTeamInfo(ValueObject paramVo){
        return sqlSession.selectOne("TeamInfo.selectTeamInfo", paramVo);
    }

    public List<ValueObject> selectTeamInfoList(ValueObject paramVo){
        return sqlSession.selectList("TeamInfo.selectTeamInfoList", paramVo);
    }

    public int insertTeamInfo(ValueObject paramVo){
        return sqlSession.insert("TeamInfo.insertTeamInfo", paramVo);
    }

    public int updateTeamInfo(ValueObject paramVo){
        return sqlSession.update("TeamInfo.updateTeamInfo", paramVo);
    }

    public int deleteTeamInfo(ValueObject paramVo){
        return sqlSession.delete("TeamInfo.deleteTeamInfo", paramVo);
    }
}
