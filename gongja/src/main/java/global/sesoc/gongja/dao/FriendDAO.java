package global.sesoc.gongja.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.gongja.vo.FriendVO;

@Repository
public class FriendDAO {

	@Autowired
	private SqlSession session;

	public int insertFB(FriendVO vo){
		FriendMapper mapper = session.getMapper(FriendMapper.class);
		
		int cnt = mapper.insertFB(vo);
		return cnt;
	}
	
	public ArrayList<FriendVO> selectFB1(String id2){
		FriendMapper mapper = session.getMapper(FriendMapper.class);
		
		ArrayList<FriendVO> cnt = mapper.selectFB1(id2);
		return cnt;
	}
	
	public ArrayList<FriendVO> selectFB(FriendVO vo){
		FriendMapper mapper = session.getMapper(FriendMapper.class);
		
		ArrayList<FriendVO> cnt = mapper.selectFB(vo);
		return cnt;
	}
	
	public int updateFB(FriendVO vo){
		FriendMapper mapper = session.getMapper(FriendMapper.class);
		
		int cnt = mapper.updateFB(vo);
		return cnt;
	}
	
	public int deleteFB(FriendVO vo){
		FriendMapper mapper = session.getMapper(FriendMapper.class);
		
		int cnt = mapper.deleteFB(vo);
		return cnt;
	}
	
}
