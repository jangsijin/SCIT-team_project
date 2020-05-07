package global.sesoc.gongja.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.gongja.vo.BoardVO;

public interface BoardMapper {
	
public int insertBoard(BoardVO vo);
public ArrayList<BoardVO> boardList(int num);
public ArrayList<BoardVO> boardList1(BoardVO vo,RowBounds rb);
public BoardVO oneBoard(BoardVO vo);
public int updateBoard(BoardVO vo);
public int deleteBoard(BoardVO vo);
}
