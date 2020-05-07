package global.sesoc.gongja.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.net.ssl.HttpsURLConnection;

import org.apache.taglibs.standard.lang.jstl.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.gongja.dao.CalendarDao;
import global.sesoc.gongja.dao.ClockDAO;
import global.sesoc.gongja.dao.DiaryDAO;
import global.sesoc.gongja.util.FileService;
import global.sesoc.gongja.util.GetSentiment;
import global.sesoc.gongja.util.Recommend;
import global.sesoc.gongja.vo.Calendar;
import global.sesoc.gongja.vo.ClockVO;
import global.sesoc.gongja.vo.DiaryVO;
import global.sesoc.gongja.vo.MemberVO;


@RequestMapping("study")
@Controller
public class StudyController {

	private static final Logger logger = LoggerFactory.getLogger(StudyController.class);
	
	@Autowired
	private ClockDAO dao;
	
	@Autowired
	private CalendarDao cdao;
	
	@Autowired
	private DiaryDAO ddao;
	
	final String uploadPath = "/boardfile";
	
	
	@RequestMapping(value = "study", method = RequestMethod.GET)
	public String calendar(HttpSession session, Model m) {
		String id = (String)session.getAttribute("loginId");
		int cnt = 0;
		int hr = 0;
		int mi = 0;
		
		ArrayList<ClockVO> tlist = dao.realStudyToday(id);
		for(ClockVO c : tlist) {
			cnt += c.getTotal();
		}
		if(cnt>60) {
			hr = cnt / 60;
			mi = cnt % 60;
			m.addAttribute("hr",hr);
			m.addAttribute("mi",mi);
		} else {
		m.addAttribute("cnt",cnt);
		}
		
		ArrayList<ClockVO> clist = dao.selectToday(id);
		m.addAttribute("clist",clist);
		
		ArrayList<Calendar> list = cdao.todayList(id);
		m.addAttribute("list", list);
		return "study/study";
	}
	
	
	@ResponseBody
	@RequestMapping(value="insertClock", method=RequestMethod.POST)
	public int insertClock(ClockVO vo,HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		vo.setId(id);
		
		DateFormat df = new SimpleDateFormat("HH:mm");
		Date d1 = null;
		Date d2 = null;
		try {
			d1 = df.parse(vo.getStartT());
			d2 = df.parse(vo.getEndT());
			long diff = d2.getTime()-d1.getTime();
			long min = diff / 60000;
			
			  if(min == 0) { 
				  return 0; 
				  }
			 
			vo.setTotal((int)min);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dao.insertTime(vo);
	}
	
	@RequestMapping(value = "writeDiary", method = RequestMethod.GET)
	public String writeDiary(HttpSession session, Model m) {
		String id = (String)session.getAttribute("loginId");
			ArrayList<ClockVO> list = dao.realStudyToday(id);
			ArrayList<Calendar> list1 = cdao.timeStudyToday(id);
		m.addAttribute("list", list);
		m.addAttribute("list1", list1);
		return "study/writeDiary";
	}
	
	@RequestMapping(value = "writeDiary", method = RequestMethod.POST)
	public String writeDiary(MultipartFile upload, HttpSession session, DiaryVO vo, Model m) throws Exception {
		String id = (String)session.getAttribute("loginId");
		vo.setId(id);
		if(upload != null) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			vo.setImage(savedfile);	
		}

		 String sentiment = GetSentiment.go(vo.getDetail());
		 logger.debug("sentiment?? {}", sentiment);
		vo.setSentiment(sentiment);
		ddao.insertDiary(vo);
		
		DiaryVO vo1 = new DiaryVO();
		vo1.setId(id);
		ArrayList<DiaryVO> list = ddao.starCnt(id);
		
		DiaryVO rec = new DiaryVO();
		rec.setId(id);
		
		int pos = 0;
		int neg = 0;
		int star = 0;
		for(DiaryVO v: list) {
			if(v.getSentiment().equals("positive")) {
				pos++;
			}else if(v.getSentiment().equals("negative")) {
				neg++;
			}
			star += v.getStar();
		}
		double avg = (double)star / 3;
		logger.debug("avg :{}, pos: {}, neg:{}", avg,pos,neg);
		Recommend r = new Recommend();
		if(pos == 3 && avg > 3) {
			String url = r.Recommender(1);
			rec.setDetail(url);
			ddao.insertRecommend(rec);
			session.setAttribute("link", url);
		} else if( neg == 3 && avg < 3) {
			String url = r.Recommender(0);
			rec.setDetail(url);
			ddao.insertRecommend(rec);
			session.setAttribute("link", url);
			logger.debug("url:{}", url);
		}
		
		
		return "redirect:myDiaryList";
	}
	
	@RequestMapping(value = "myDiaryList", method = RequestMethod.GET)
	public String myDiaryList(HttpSession session, Model m,
			@RequestParam(value="num", defaultValue="0") int num
			) {
		String id = (String)session.getAttribute("loginId");
		int cnt = ddao.diaryToday(id);
		m.addAttribute("today", cnt);
		if(num == 0) {
		
		ArrayList<DiaryVO> list = ddao.myDiaryList(id);
		m.addAttribute("list", list);
		} else {
			DiaryVO vo = new DiaryVO();
			vo.setId(id);
			vo.setNum(num);
			DiaryVO vo1 = ddao.myDiary(vo);
			m.addAttribute("one", vo1);
		}
		
		ArrayList<DiaryVO> recList = ddao.selectRecommend(id);
		m.addAttribute("recList",recList);
		
		return "study/myDiaryList";
	}
	
	@ResponseBody
	@RequestMapping(value = "deleteDiary", method = RequestMethod.POST)
	public int deleteDiary(HttpSession session, int num) {
		String id = (String)session.getAttribute("loginId");
		DiaryVO vo = new DiaryVO();
		vo.setId(id);
		vo.setNum(num);
		
		return ddao.deleteDiary(vo);	
	}
	
	@RequestMapping(value = "updateDiary", method = RequestMethod.GET)
	public String updateDiary(HttpSession session, int num, Model m) {
		String id = (String)session.getAttribute("loginId");
		DiaryVO vo = new DiaryVO();
		vo.setId(id);
		vo.setNum(num);
		DiaryVO vo1 = ddao.myDiary(vo);
		m.addAttribute("vo", vo1);
		return "study/updateDiary";
	}
	
	@RequestMapping(value = "updateDiary", method = RequestMethod.POST)
	public String updateDiary(HttpSession session, DiaryVO vo) {
		String id = (String)session.getAttribute("loginId");
		vo.setId(id);
		
		ddao.updateDiary(vo);
		return "redirect:myDiaryList";
	}
	
	@RequestMapping(value="uploadImg", method= RequestMethod.POST, produces="text/plain")
	public String uploadImg(MultipartFile upload, int num, HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		DiaryVO vo = new DiaryVO();
		vo.setId(id);
		vo.setNum(num);
		logger.debug("dddddd");
		
		if(upload != null) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			FileService.deleteFile(uploadPath +"/"+ vo.getImage());
			vo.setImage(savedfile);
			ddao.updateDiaryImg(vo);
		}
		return "redirect:updateDiary?num="+num;
	}
	
	@ResponseBody
	@RequestMapping(value = "searchDiary", method = RequestMethod.POST)
	public int searchDiary(HttpSession session, String inputdate) {
		String id = (String)session.getAttribute("loginId");
		int num = 0;
		DiaryVO vo = new DiaryVO();
		vo.setId(id);
		vo.setInputdate(inputdate);
		
		DiaryVO vo1 = ddao.searchDiary(vo);
		if(vo1 != null) {
			return vo1.getNum();
		} else
		return 0;
	}
	
	
}
