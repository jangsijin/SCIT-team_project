package global.sesoc.gongja.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import global.sesoc.gongja.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession session;
	
	public int selectId(String id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		int cnt = mapper.selectId(id);
		return cnt;
	}
	
	public int insertMember(MemberVO vo){
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		int cnt = mapper.insertMember(vo);
		return cnt;
	}
	
	public MemberVO login(MemberVO vo){
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		MemberVO mvo = mapper.login(vo);
		return mvo;
	}
	
	public MemberVO oneMember(String id){
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		MemberVO mvo = mapper.oneMember(id);
		return mvo;
	}
	
	public int updateMember(MemberVO vo){
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		int cnt = mapper.updateMember(vo);
		return cnt;
	}
	
	public int updateImage(MemberVO vo) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		int cnt = mapper.updateImage(vo);
		return cnt;
	}
	
	public int signout(MemberVO vo){
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		
		int cnt = mapper.signout(vo);
		return cnt;
	}
	//추가됨
		public void verifyMember(String id){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			mapper.verifyMember(id);
		}
}
