package global.sesoc.gongja.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.gongja.vo.RoomVO;

public interface RoomMapper {
	public int insertRoom(RoomVO vo);
	public int insertRoomMember(RoomVO vo);
	public int updateRoomMember(RoomVO vo);
	public int deleteRoomMember(RoomVO vo);
	public int updateRoom(RoomVO vo);
	public ArrayList<RoomVO> roomMember(RoomVO vo);
	public ArrayList<RoomVO> search(String title);
	public ArrayList<RoomVO> showRoomList(String id);
	public ArrayList<RoomVO> myRoomList(RoomVO vo);
	public RoomVO oneRoom(int num);
	public int deleteRoom(RoomVO vo);
	//검색 후의 총 글 개수
	public int getTotal(String searchText);
	//검색 후의 현재 페이지 목록
	public ArrayList<RoomVO> listBoard(String searchText, RowBounds rb);
	//멤버인지
	public String iMember(RoomVO vo);
}
