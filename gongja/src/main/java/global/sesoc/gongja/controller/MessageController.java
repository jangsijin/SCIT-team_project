package global.sesoc.gongja.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.gongja.dao.MessageDAO;
import global.sesoc.gongja.vo.MessageVO;

@Controller
@RequestMapping("message")
public class MessageController {

	
	@Autowired
	private MessageDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@RequestMapping(value="writeMessage", method=RequestMethod.GET)
	public String writeMessage(String id, Model m) {
		if(id != null) {
			m.addAttribute("reader", id);
		}
		return "message/writeMessage";
	}
	
	@ResponseBody
	@RequestMapping(value="sendMsg", method= RequestMethod.POST)
	public int sendMsg(MessageVO vo, HttpSession session, Model m) {
		String id = (String)session.getAttribute("loginId");
		vo.setSender(id);
		int cnt = dao.insertMessage(vo);
		return cnt;
	}
	
	@RequestMapping(value="messageList", method=RequestMethod.GET)
	public String MessageList(HttpSession session, Model m) {
		String id = (String)session.getAttribute("loginId");
		ArrayList<MessageVO> list1 = dao.readMessage(id);
		ArrayList<MessageVO> list2 = dao.sendMessage(id);
		m.addAttribute("readlist", list1);
		m.addAttribute("sendlist", list2);
		return "message/messageList";
	}

	
}
