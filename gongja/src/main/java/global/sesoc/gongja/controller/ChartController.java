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

import global.sesoc.gongja.dao.CalendarDao;
import global.sesoc.gongja.dao.ClockDAO;
import global.sesoc.gongja.dao.MemberDAO;
import global.sesoc.gongja.vo.Calendar;
import global.sesoc.gongja.vo.ClockVO;
import global.sesoc.gongja.vo.MemberVO;

@Controller
@RequestMapping("chart")
public class ChartController {
	
	@Autowired
	public ClockDAO dao;
	
	@Autowired
	public CalendarDao cdao;
	
	@Autowired
	public MemberDAO mdao;
	
	private static final Logger logger = LoggerFactory.getLogger(ChartController.class);
	
	@RequestMapping(value = "chart", method = RequestMethod.GET)
	public String chart(HttpSession session, Model m) {
		String id = (String)session.getAttribute("loginId");
		
		return "chart/chart";
	}
	
	@RequestMapping(value = "today", method = RequestMethod.GET)
	public String today(HttpSession session, Model m) {
		String id = (String)session.getAttribute("loginId");
		
		// 1번 오늘의 타임라인 차트
		ArrayList<ClockVO> list = dao.selectToday(id);
		ArrayList<Calendar> clist = cdao.todayList(id);
		String str = "[";
		int num =0;
		int nnum = 0;
		logger.debug("문제??{}",str);
		for(ClockVO c : list) {
			str +="['";
			str += "실제 공부";
			str +="' , '";
			str += c.getTitle();
			str +="' , new Date(0,0,0,";
			str += c.getStartT().substring(0,2); // 00:12
			str +=",";
			str += c.getStartT().substring(3,5);
			str += ",0)";
			str +=", new Date(0,0,0,";
			str += c.getEndT().substring(0,2); // 00:12
			str +=",";
			str += c.getEndT().substring(3,5);
			str += ",0)";
			str +=" ]";
			num++;
			if(num<list.size()) {
				str +=",";
			}
		}
			str += ", ";
		for(Calendar c : clist) {
			str +="['";
			str += "캘린더 공부";
			str +="' , '";
			str += c.getTitle();
			str +="' , new Date(0,0,0,";
			str += c.getStart().substring(0,2); // 00:12
			str +=",";
			str += c.getStart().substring(3,5);
			str += ",0)";
			str +=", new Date(0,0,0,";
			str += c.getEnd().substring(0,2); // 00:12
			str +=",";
			str += c.getEnd().substring(3,5);
			str += ",0)";
			str +=" ]";
			nnum++;
			if(nnum<clist.size()) {
				str +=",";
			}
		}
		
		str += "]";
		logger.debug("문제??{}",str);
		m.addAttribute("str",str);
		
		// 2번 하루 공부 달성률
		/*
		ArrayList<Calendar> cal = cdao.timeStudyToday(id);
		ArrayList<ClockVO> clo = dao.realStudyToday(id);
		for(Calendar ca : cal) {
			for(ClockVO c : clo) {
				if(ca.getTitle().equals(c.getTitle())) {
					c.setHcount(ca.getTotal());
				}
			}
		}
		String str2 = "[['타이틀','캘린더','실제'],";
		int num2 =0;
		for(ClockVO c : clo) {
			str2 +="['";
			str2 += c.getTitle();
			str2 +="', ";
			str2 += c.getHcount();
			str2 +=", ";
			str2 += c.getTotal();
			str2 +=" ]";
			num2++;
			if(num2<clo.size()) {
				str2 +=",";
			}
		}
		str2 += "]";
		m.addAttribute("str2",str2);*/
		
		ArrayList<Calendar> cal = cdao.timeStudyToday(id);
		ArrayList<ClockVO> clo = dao.realStudyToday(id);
		for(Calendar ca : cal) {
			for(ClockVO c : clo) {
				if(ca.getTitle().equals(c.getTitle())) {
					ca.setNum(c.getTotal());
				}
			}
		}
		String str2 = "[['타이틀(단위:분)','캘린더','실제'],";
		int num2 =0;
		for(Calendar c : cal) {
			str2 +="['";
			str2 += c.getTitle();
			str2 +="',";
			str2 += c.getTotal();
			str2 +=",";
			str2 += c.getNum();
			str2 +=" ]";
			num2++;
			if(num2<cal.size()) {
				str2 +=",";
			}
		}
		str2 += "]";
		m.addAttribute("str2",str2);
		
		
		// 3번 하루 알람 과목 파이차트
		ArrayList<ClockVO> clo3 = dao.dayAlarmCnt(id);
		String str3 = "[['과목', '알람 횟수'],";
		int num3 =0;
		for(ClockVO c : clo3) {
			str3 +="['";
			str3 += c.getTitle();
			str3 +="', ";
			str3 += c.getHcount();
			str3 +=" ]";
			num3++;
			if(num3<clo3.size()) {
				str3 +=",";
			}
		}
		str3 += "]";
		m.addAttribute("str3",str3);
		
		
	return "chart/today";
}
	
	@RequestMapping(value = "week", method = RequestMethod.GET)
	public String week(HttpSession session, Model m) {
		String id = (String)session.getAttribute("loginId");
		
		// 4번 일주일 공부시간 라인차트
				ArrayList<ClockVO> clo4 = dao.weekStudyTime(id);
				ArrayList<Calendar> cal4 = cdao.weekTimeToal(id);
				
				for(ClockVO c : clo4) {
					for(Calendar cc : cal4) {
						if(c.getInputdate().equals(cc.getStart())) {
							c.setNum(cc.getTotal());
						}
					}
				}
				
				String str4 = "[['날짜', '공부시간', '캘린더 공부시간'],";
				int num4 =0;
				for(ClockVO c : clo4) {
					str4 +="['";
					str4 += c.getInputdate();
					str4 +="', ";
					str4 += c.getTotal();
					str4 +=", ";
					str4 += c.getNum();
					str4 +=" ]";
					num4++;
					if(num4<clo4.size()) {
						str4 +=",";
					}
				}
				str4 += "]";
				m.addAttribute("str4",str4);
		
		
				// 6번 주간 공부 많이 한거 순위
				ArrayList<ClockVO> clo6 = dao.weekTitle(id);
				String str6 = "[['과목', '공부시간 (단위:분)'],";
				int num6 =0;
				for(ClockVO c : clo6) {
					str6 +="['";
					str6 += c.getTitle();
					str6 +="', ";
					str6 += c.getTotal();
					str6 +=" ]";
					num6++;
					if(num6 == 5) {
						break;
					}
					if(num6<clo6.size()) {
						str6 +=",";
					}
						
				}
				str6 += "]";
				m.addAttribute("str6",str6);
				
				// 같은 년도들 통계
				MemberVO membervo = mdao.oneMember(id);
				int birthdate = membervo.getBirthdate();
				
				int birthavg = dao.birthAvg(birthdate);
				float birthavg1 = Math.round(birthavg/60);
				ArrayList<ClockVO> birthtitle = dao.birthTitle(birthdate);
				String birstr = birthtitle.get(0).getTitle();
				
				m.addAttribute("birthdate",birthdate);
				m.addAttribute("birthavg", birthavg1);
				m.addAttribute("birthtitle", birstr);
				
		return "chart/week";
	}
	
	
	@RequestMapping(value = "year", method = RequestMethod.GET)
	public String year(HttpSession session, Model m) {
		String id = (String)session.getAttribute("loginId");
		
		//5번 월간 공부시간 캘린더 차트
		ArrayList<ClockVO> clo5 = dao.yearStudyTime(id);
		String str5 = "[";
		int num5 =0;
		for(ClockVO c : clo5) {
			str5 +="[ new Date(";
			str5 += c.getInputdate();
			str5 +="), ";
			str5 += c.getTotal();
			str5 +=" ]";
			num5++;
			if(num5<clo5.size()) {
				str5 +=",";
			}
		}
		str5 += "]";
		
		m.addAttribute("str5",str5);
		return "chart/year";
	}
	
}
