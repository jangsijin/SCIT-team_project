package global.sesoc.gongja.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.gongja.vo.ClockVO;

@Repository
public class ClockDAO {

	@Autowired
	private SqlSession session;
	
	public int insertTime(ClockVO vo) {
		ClockMapper mapper = session.getMapper(ClockMapper.class);
		
		return mapper.insertTime(vo);
	
	}
	
	public int updateTime(ClockVO vo) {
		ClockMapper mapper = session.getMapper(ClockMapper.class);
		
		return mapper.updateTime(vo);
	}
	
	public ArrayList<ClockVO> selectToday(String id){
		ClockMapper mapper = session.getMapper(ClockMapper.class);
		ArrayList<ClockVO> list = mapper.selectToday(id);
		return list;
		
	}
	
	public ArrayList<ClockVO> realStudyToday(String id){
		ClockMapper mapper = session.getMapper(ClockMapper.class);
		ArrayList<ClockVO> list = new ArrayList<ClockVO>();
		list = mapper.realStudyToday(id);
		return list;
	}
	
	public ArrayList<ClockVO> memberTime(int num) {
		ClockMapper mapper = session.getMapper(ClockMapper.class);
		ArrayList<ClockVO> vo = mapper.memberTime(num);
		return vo;
	}
	
	public ArrayList<ClockVO> dayAlarmCnt(String id){
		ClockMapper mapper = session.getMapper(ClockMapper.class);
		ArrayList<ClockVO> vo = mapper.dayAlarmCnt(id);
		return vo;
	}
	
	public ArrayList<ClockVO> weekStudyTime(String id){
		ClockMapper mapper = session.getMapper(ClockMapper.class);
		ArrayList<ClockVO> vo = mapper.weekStudyTime(id);
		return vo;
	}
	
	public ArrayList<ClockVO> yearStudyTime(String id){
		ClockMapper mapper = session.getMapper(ClockMapper.class);
		ArrayList<ClockVO> vo = mapper.yearStudyTime(id);
		return vo;
	}
	
	public ArrayList<ClockVO> weekTitle(String id){
		ClockMapper mapper = session.getMapper(ClockMapper.class);
		ArrayList<ClockVO> vo = mapper.weekTitle(id);
		return vo;
	}
	
	public int birthAvg(int birthdate) {
		ClockMapper mapper = session.getMapper(ClockMapper.class);
		return mapper.birthAvg(birthdate);
	}
	public ArrayList<ClockVO> birthTitle(int birthdate){
		ClockMapper mapper = session.getMapper(ClockMapper.class);
		ArrayList<ClockVO> vo = mapper.birthTitle(birthdate);
		return vo;
	}
}
