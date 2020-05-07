package global.sesoc.gongja.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.gongja.dao.ChartDAO;
import global.sesoc.gongja.vo.ChartVO;

@RequestMapping("cam")
@Controller
public class CamController {

	@Autowired
	public ChartDAO dao;
	
	@RequestMapping(value = "cam", method = RequestMethod.GET)
	public String cam() {
		return "cam/cam";
	}
	
	@RequestMapping(value = "/gorequest",method = RequestMethod.POST)
	public String test(ChartVO vo) {
		System.out.println(vo);
		return "redirect: cam";
	}
	
	@ResponseBody
	@RequestMapping(value = "insertTime", method = RequestMethod.POST)
	public void insertTime(ChartVO chart, HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		chart.setId(id);
		dao.chartTime(chart);
	}
}

