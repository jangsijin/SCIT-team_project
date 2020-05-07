package global.sesoc.gongja.dao;

import java.util.ArrayList;

import global.sesoc.gongja.vo.ClockVO;

public interface ClockMapper {

	public int insertTime(ClockVO vo);
	public int updateTime(ClockVO vo);
	public ArrayList<ClockVO> selectToday(String id);
	public ArrayList<ClockVO> realStudyToday(String id);
	public ArrayList<ClockVO> memberTime(int num);
	public ArrayList<ClockVO> dayAlarmCnt(String id);
	public ArrayList<ClockVO> weekStudyTime(String id);
	public ArrayList<ClockVO> yearStudyTime(String id);
	public ArrayList<ClockVO> weekTitle(String id);
	public int birthAvg(int birthdate);
	public ArrayList<ClockVO> birthTitle(int birthdate);
}
