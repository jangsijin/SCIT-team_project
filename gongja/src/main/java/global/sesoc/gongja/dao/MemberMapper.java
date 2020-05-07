package global.sesoc.gongja.dao;

import global.sesoc.gongja.vo.MemberVO;

public interface MemberMapper {

	public int selectId(String id);
	public int insertMember(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public MemberVO oneMember(String id);
	public int updateMember(MemberVO vo);
	public int updateImage(MemberVO vo);
	public int signout(MemberVO vo);
	//추가됨
	public void verifyMember(String id);
}
