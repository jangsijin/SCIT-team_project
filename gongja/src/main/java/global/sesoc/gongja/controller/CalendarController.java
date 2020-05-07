package global.sesoc.gongja.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.gongja.dao.CalendarDao;
import global.sesoc.gongja.vo.Calendar;

@RequestMapping("calendar")
@Controller
public class CalendarController {
	
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	public CalendarDao dao;
	
	@RequestMapping(value = "calendar", method = RequestMethod.GET)
	public String calendar() {
		return "calendar/calendar";
	}
	
	@ResponseBody
	@RequestMapping(value = "/calendarInsert" ,method = RequestMethod.POST)
	public String calendarInsert(Calendar c, HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		c.setMember_ID(id);
		logger.info("켈린더:{}", c);
		int result = dao.insertCalendar(c);
		
		if(result>0) {
			
			return "success";
		}
				
		return "fail";
	}
	@ResponseBody
	@RequestMapping(value = "/calendarList", method =RequestMethod.POST)
	public ArrayList<Calendar> calendarList(HttpSession session){
		String id = (String)session.getAttribute("loginId");
		Calendar c = new Calendar();
		c.setMember_ID(id);
		ArrayList<Calendar> list = dao.calendarList(c);
		
		System.out.println("달력 리스트 : " + list);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/calendarDelete", method =RequestMethod.POST)
	public String calendarDelete(Calendar c, HttpSession session){
		String id = (String)session.getAttribute("loginId");
		c.setMember_ID(id);
		int del = dao.calendarDelete(c);	
		if(del>0) {
			return "success";
		}
	
	return "fail";
	}
	@ResponseBody
	@RequestMapping(value = "/calendarUpdate", method =RequestMethod.POST)
	public String calendarUpdate(Calendar c, HttpSession session){
		String id = (String)session.getAttribute("loginId");
		c.setMember_ID(id);
		int ud = dao.calendarUpdate(c);	
		if(ud > 0) {
			return "success";
		}
	
	return "fail";
	}
	@ResponseBody
	@RequestMapping(value = "/calendarMove", method =RequestMethod.POST)
	public String calendarMove(Calendar c, HttpSession session){
		String id = (String)session.getAttribute("loginId");
		c.setMember_ID(id);
		System.out.println(c);
		int up = dao.calendarUpdate(c);	
		if(up > 0) {
			return "success";
		}
	
	return "fail";
	}
	
}
