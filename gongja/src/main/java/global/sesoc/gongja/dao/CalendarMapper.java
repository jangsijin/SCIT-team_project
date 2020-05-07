package global.sesoc.gongja.dao;

import java.util.ArrayList;

import global.sesoc.gongja.vo.Calendar;

public interface CalendarMapper {

	
	public int insertCalendar(Calendar c);
	
	public ArrayList<Calendar> calendarList(Calendar c); 
	
	public int calendarDelete(Calendar c);
	
	public int calendarUpdate(Calendar c);

	public ArrayList<Calendar> todayList(String member_id);
	
	public ArrayList<Calendar> timeStudyToday(String member_id);
	
	public ArrayList<Calendar> weekTimeToal(String member_id);
}
