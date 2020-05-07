package global.sesoc.gongja.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.gongja.vo.RoomVO;

@Repository
public class RoomDAO {

	@Autowired
	private SqlSession session;
	
	public int insertRoom(RoomVO vo) {
		RoomMapper mapper = session.getMapper(RoomMapper.class);
		
		mapper.insertRoom(vo);
		int num = vo.getNum();
		return num;
	}
	
	public int insertRoomMember(RoomVO vo) {
		RoomMapper mapper = session.getMapper(RoomMapper.class);
		
		int cnt = mapper.insertRoomMember(vo);
		return cnt;
	}
	
	public int updateRoomMember(RoomVO vo) {
		RoomMapper mapper = session.getMapper(RoomMapper.class);
		
		int cnt = mapper.updateRoomMember(vo);
		return cnt;
	}
	
	public int deleteRoomMember(RoomVO vo) {
		RoomMapper mapper = session.getMapper(RoomMapper.class);
		
		int cnt = mapper.deleteRoomMember(vo);
		return cnt;
	}
	
	public int updateRoom(RoomVO vo) {
		RoomMapper mapper = session.getMapper(RoomMapper.class);
		
		int cnt = mapper.updateRoom(vo);
		return cnt;
	}
	
	public ArrayList<RoomVO> roomMember(RoomVO vo) {
		RoomMapper mapper = session.getMapper(RoomMapper.class);
		
		ArrayList<RoomVO> list= mapper.roomMember(vo);
		return list;
	}
	
	public ArrayList<RoomVO> showRoomList(String id) {
		RoomMapper mapper = session.getMapper(RoomMapper.class);
		
		ArrayList<RoomVO> list = mapper.showRoomList(id);
		return list;
	}
	
	public ArrayList<RoomVO> myRoomList(RoomVO vo) {
		RoomMapper mapper = session.getMapper(RoomMapper.class);
		
		ArrayList<RoomVO> list = mapper.myRoomList(vo);
		return list;
	}
	
	public RoomVO oneRoom(int num) {
		RoomMapper mapper = session.getMapper(RoomMapper.class);
		
		RoomVO mvo = mapper.oneRoom(num);
		return mvo;
	}
	
	public int deleteRoom(RoomVO vo) {
		RoomMapper mapper = session.getMapper(RoomMapper.class);
		
		int cnt = mapper.deleteRoom(vo);
		return cnt;
	}
	
	public ArrayList<RoomVO> search(String title){
		RoomMapper mapper = session.getMapper(RoomMapper.class);
		
		ArrayList<RoomVO> list = mapper.search(title);
		return list;
	}
	
	/**
	 * 검색 결과 레코드 수
	 * @param searchText 검색어
	 * @return 글개수
	 */
	public int getTotal(String searchText) {
		RoomMapper mapper = session.getMapper(RoomMapper.class);
		int total = mapper.getTotal(searchText);
		return total;
	}
	
	/**
	 * 한 페이지의 게시글 목록 읽기
	 * @param searchText 검색어
	 * @param startRecord 전체 결과중 읽을 시작 위치 (첫 행은 0)
	 * @param countPerPage 읽을 레코드 수 (한 페이지당 글 개수)
	 * @return 글목록
	 */
	public ArrayList<RoomVO> listBoard(String searchText, int startRecord, int countPerPage) {
		RoomMapper mapper = session.getMapper(RoomMapper.class);
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		//검색어와 읽을 범위를 전달
		ArrayList<RoomVO> boardlist = mapper.listBoard(searchText, rb);
		return boardlist;
	}
	
	public String iMember(RoomVO vo) {
		RoomMapper mapper = session.getMapper(RoomMapper.class);
		return mapper.iMember(vo);
	}
	
}
