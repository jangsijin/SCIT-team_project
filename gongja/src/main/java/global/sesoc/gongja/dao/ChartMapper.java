package global.sesoc.gongja.dao;

import java.util.ArrayList;

import global.sesoc.gongja.vo.ChartVO;

public interface ChartMapper {

	public int chartTime(ChartVO chart);
	
	public ArrayList<ChartVO> timeList();
}
