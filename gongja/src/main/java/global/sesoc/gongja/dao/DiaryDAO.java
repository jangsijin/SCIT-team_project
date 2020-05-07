package global.sesoc.gongja.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.gongja.vo.DiaryVO;

@Repository
public class DiaryDAO {

	@Autowired
	private SqlSession session;
	
	public int insertDiary(DiaryVO vo) {
		DiaryMapper mapper = session.getMapper(DiaryMapper.class);
		return mapper.insertDiary(vo);
	}
	
	public ArrayList<DiaryVO> dairyList() {
		DiaryMapper mapper = session.getMapper(DiaryMapper.class);
		ArrayList<DiaryVO> list = mapper.diaryList();
		return list;
	}
	
	public int updateDiary(DiaryVO vo) {
		DiaryMapper mapper = session.getMapper(DiaryMapper.class);
		return mapper.updateDiary(vo);
	}
	
	public int deleteDiary(DiaryVO vo) {
		DiaryMapper mapper = session.getMapper(DiaryMapper.class);
		return mapper.deleteDiary(vo);
	}
	
	public ArrayList<DiaryVO> myDiaryList(String id){
		DiaryMapper mapper = session.getMapper(DiaryMapper.class);
		ArrayList<DiaryVO> list = mapper.myDiaryList(id);
		return list;
	}
	
	public DiaryVO myDiary(DiaryVO vo) {
		DiaryMapper mapper = session.getMapper(DiaryMapper.class);
		DiaryVO vo1 = new DiaryVO();
		vo1 = mapper.myDiary(vo);
		return vo1;
	}
	
	public int diaryToday(String id) {
		DiaryMapper mapper = session.getMapper(DiaryMapper.class);
		return mapper.diaryToday(id);
	}
	
	public int updateDiaryImg(DiaryVO vo) {
		DiaryMapper mapper = session.getMapper(DiaryMapper.class);
		return mapper.updateDiaryImg(vo);
	}
	
	public DiaryVO searchDiary(DiaryVO vo) {
		DiaryMapper mapper = session.getMapper(DiaryMapper.class);
			DiaryVO vo1 = mapper.searchDiary(vo);
			return vo1;
	}
	
	public ArrayList<DiaryVO> starCnt(String id){
		DiaryMapper mapper = session.getMapper(DiaryMapper.class);
		ArrayList<DiaryVO> list = mapper.starCnt(id);
		return list;
	}
	
	public int insertRecommend(DiaryVO vo) {
		DiaryMapper mapper = session.getMapper(DiaryMapper.class);
		return mapper.insertRecommend(vo);
	}
	
	public ArrayList<DiaryVO> selectRecommend(String id){
		DiaryMapper mapper = session.getMapper(DiaryMapper.class);
		ArrayList<DiaryVO> list = mapper.selectRecommend(id);
		return list;
	}
	
}
