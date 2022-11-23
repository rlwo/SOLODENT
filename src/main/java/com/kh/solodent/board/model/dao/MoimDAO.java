package com.kh.solodent.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.solodent.board.model.vo.Attachment;
import com.kh.solodent.board.model.vo.Moim;
import com.kh.solodent.board.model.vo.PageInfo;

@Repository("moimDAO")
public class MoimDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("moimMapper.getListCount");
	}

	public ArrayList<Moim> selectMoimList(SqlSessionTemplate sqlSession, PageInfo pi) {
		//로우바운드 사용 ( 오프셋, boardLimit )
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("moimMapper.selectMoimList", null, rowBounds);
	}

	public ArrayList<Attachment> selectMoimAttm(SqlSessionTemplate sqlSession, ArrayList<Moim> list) {
		return (ArrayList)sqlSession.selectList("moimMapper.selectMoimAttm", list);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Moim moim) { //삭제해두됨
		return sqlSession.insert("moimMapper.insertBoard",moim);
	}

	public int insertMoim(SqlSessionTemplate sqlSession, Moim moim, ArrayList<Attachment> list) {
		Map<String, Object> map = new HashMap<>();
		map.put("moim", moim);
		map.put("list", list);

		return sqlSession.insert("moimMapper.insertMoim", map);
	}

	public int addCount(SqlSessionTemplate sqlSession, int boardId) {
		return sqlSession.update("moimMapper.addCount", boardId);
	}

	public Moim selectMoim(SqlSessionTemplate sqlSession, int boardId) {
		return sqlSession.selectOne("moimMapper.selectMoim", boardId);
	}

	public ArrayList<Attachment> selectAttmList(SqlSessionTemplate sqlSession, Integer boardId) {
		return (ArrayList)sqlSession.selectList("moimMapper.selectAttmList", boardId);
	}

	
	

}
