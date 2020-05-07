package global.sesoc.gongja.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.gongja.vo.BoardVO;
import global.sesoc.gongja.vo.RoomVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession session;
	
	public int insertBoard(BoardVO vo) {
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.insertBoard(vo);
	}
	
	public ArrayList<BoardVO> boardList(int num){
		BoardMapper mapper = session.getMapper(BoardMapper.class);

		ArrayList<BoardVO> list = mapper.boardList(num);
		return list;
	}
	
	public ArrayList<BoardVO> boardList1(BoardVO vo, int startRecord, int countPerPage){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
				
		//검색어와 읽을 범위를 전달
		ArrayList<BoardVO> list = mapper.boardList1(vo,rb);
		return list;
	}
	
	public BoardVO oneBoard(BoardVO vo){
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		BoardVO bvo = mapper.oneBoard(vo);
		return bvo;
	}
	
	public int updateBoard(BoardVO vo){
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.updateBoard(vo);
		
	}
	
	public int deleteBoard(BoardVO vo){
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.deleteBoard(vo);
	}
	
}
