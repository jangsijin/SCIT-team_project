package global.sesoc.gongja.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.gongja.vo.ChartVO;

@Repository
public class ChartDAO {

	@Autowired
	private SqlSession session;
	
	public int chartTime(ChartVO chart) {
		ChartMapper mapper = session.getMapper(ChartMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.chartTime(chart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<ChartVO> timeList(){
		ChartMapper mapper = session.getMapper(ChartMapper.class);
		
		ArrayList<ChartVO> list = null;
		
		try {
			list = mapper.timeList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
