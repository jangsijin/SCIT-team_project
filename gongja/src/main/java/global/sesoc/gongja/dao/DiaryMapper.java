package global.sesoc.gongja.dao;

import java.util.ArrayList;

import global.sesoc.gongja.vo.DiaryVO;

public interface DiaryMapper {

	public int insertDiary(DiaryVO vo);
	public ArrayList<DiaryVO> diaryList();
	public ArrayList<DiaryVO> myDiaryList(String id);
	public int updateDiary(DiaryVO vo);
	public int updateDiaryImg(DiaryVO vo);
	public int deleteDiary(DiaryVO vo);
	public DiaryVO myDiary(DiaryVO vo);
	public int diaryToday(String id);
	public DiaryVO searchDiary(DiaryVO vo);
	public ArrayList<DiaryVO> starCnt(String id);
	public int insertRecommend(DiaryVO vo);
	public ArrayList<DiaryVO> selectRecommend(String id);
	
}
