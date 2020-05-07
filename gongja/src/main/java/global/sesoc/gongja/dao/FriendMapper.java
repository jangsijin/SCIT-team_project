package global.sesoc.gongja.dao;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.gongja.vo.FriendVO;

public interface FriendMapper {

	public int insertFB(FriendVO vo);
	public ArrayList<FriendVO> selectFB1(String id2);
	public ArrayList<FriendVO> selectFB(FriendVO vo);
	public int updateFB(FriendVO vo);
	public int deleteFB(FriendVO vo);
}
