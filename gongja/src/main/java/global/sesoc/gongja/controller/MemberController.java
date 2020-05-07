package global.sesoc.gongja.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import global.sesoc.gongja.dao.FriendDAO;
import global.sesoc.gongja.dao.MemberDAO;
import global.sesoc.gongja.util.FileService;
import global.sesoc.gongja.vo.FriendVO;
import global.sesoc.gongja.vo.MemberVO;

@Controller
@RequestMapping("member")
public class MemberController {

	//바뀐거
	@Inject    //서비스를 호출하기 위해서 의존성을 주입
	JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.    
		//여까지	
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private FriendDAO dao1;
	
	// json 데이터로 응답을 보내기 위한 
	@Autowired 
	MappingJackson2JsonView jsonView;

	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	final String uploadPath = "/boardfile";
	final String mainImg = "user.png";

	@RequestMapping(value="login", method=RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}
	
	//바뀐거
	   @ResponseBody
	   @RequestMapping(value="login", method = RequestMethod.POST)
	   public int login(MemberVO vo,HttpSession session,Model m) {
	      MemberVO vo1 = dao.login(vo);
	      int cnt = 0;
	      if(vo1 != null) {
	         if(vo1.getVerify().equals("y")) {
	            String img = uploadPath +"/"+ vo1.getImage();
	            session.setAttribute("loginId", vo1.getId());
	            session.setAttribute("loginNickname", vo1.getNickname());
	            session.setAttribute("loginImage", img);
	            cnt = 1;
	         }else if(vo1.getVerify().equals("n")) {
	            cnt = 2;
	         }
	         
	         return cnt;
	      }
	      return cnt;
	   }
	
	@RequestMapping(value="logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("loginNickname");
		session.removeAttribute("loginImage");
		session.removeAttribute("recList");
		session.removeAttribute("link");
		return "redirect:/";
	}
	
	//바뀐거
		@ResponseBody
		@RequestMapping(value="emailsend", method= RequestMethod.POST)
		public void emailsend(String id, String password, String nickname, String email,
				int birthdate, HttpSession session) throws MessagingException, UnsupportedEncodingException {
			
			logger.debug(email);
			Random r = new Random();
			//이메일로 받는 인증코드 부분 (난수)
	        int code = r.nextInt(4589362) + 49311; 
	        
	        String setfrom = "tlwlsdl135@gmail.com";
	        String tomail = email; // 받는 사람 이메일
	        String title = "회원가입 인증 이메일 입니다."; // 제목
	        String content =
	        		System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
	                System.getProperty("line.separator")+
	                "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
	                +System.getProperty("line.separator")+
	                System.getProperty("line.separator")+
	                " 인증번호는 " +code+ " 입니다. "
	                +System.getProperty("line.separator")+
	                System.getProperty("line.separator")+
	                "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";
	        
	        try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
	                    true, "UTF-8");

	            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	            messageHelper.setTo(tomail); // 받는사람 이메일
	            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	            messageHelper.setText(content); // 메일 내용
	            
	            mailSender.send(message);
	            session.setAttribute("getId", id);
	            session.setAttribute("proved_email", email);
	            session.setAttribute("code", code);   
	            logger.debug((String)session.getAttribute("proved_email"));
	            logger.debug(""+(int)session.getAttribute("code"));
	        } catch(Exception e) {
	            System.out.println(e);
	        }        
		}
		//추가
		@ResponseBody
		@RequestMapping(value="emailrepeat", method= RequestMethod.POST)
		public void emailsend(String email, HttpSession session) throws MessagingException, UnsupportedEncodingException {
			logger.debug(email);
			Random r = new Random();
			//이메일로 받는 인증코드 부분 (난수)
	        int code = r.nextInt(4589362) + 49311; 
	        
	        String setfrom = "tlwlsdl135@gmail.com";
	        String tomail = email; // 받는 사람 이메일
	        String title = "회원가입 인증 이메일 입니다."; // 제목
	        String content =
	        		System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
	                System.getProperty("line.separator")+
	                "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
	                +System.getProperty("line.separator")+
	                System.getProperty("line.separator")+
	                " 인증번호는 " +code+ " 입니다. "
	                +System.getProperty("line.separator")+
	                System.getProperty("line.separator")+
	                "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";
	        
	        try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
	                    true, "UTF-8");

	            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	            messageHelper.setTo(tomail); // 받는사람 이메일
	            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	            messageHelper.setText(content); // 메일 내용
	            
	            mailSender.send(message);
	            
	            session.setAttribute("proved_email", email);
	            session.setAttribute("code", code);   
	            logger.debug((String)session.getAttribute("proved_email"));
	            logger.debug(""+(int)session.getAttribute("code"));
	        } catch(Exception e) {
	            System.out.println(e);
	        }        
		}
		
		//인증코드 대조하기
		@ResponseBody
		@RequestMapping(value = "/verify", method = RequestMethod.POST)
		public String inputCodeProcedure(HttpSession session, String code,String email) {		
			int temp = Integer.parseInt(code);
			String id = (String)session.getAttribute("getId");
			if(session.getAttribute("code").equals(temp)&&(session.getAttribute("proved_email").equals(email)))
			{
				dao.verifyMember(id);
				session.removeAttribute("code");
				session.removeAttribute("getId");
				return "accept";
			}else {	
				return "ignore";
			}
		}
	
	@RequestMapping(value="emailConfirm", method=RequestMethod.GET)
	public String emailgo() {
		return "member/emailConfirm";
	}
		
	@RequestMapping(value="signin", method=RequestMethod.GET)
	public String signinForm() {
		return "member/signin";
	}
	
	@ResponseBody
	@RequestMapping(value="checkId", method = RequestMethod.POST)
	public int idCheck(String id) {
		int cnt = dao.selectId(id);
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping(value="signIn", method= RequestMethod.POST)
	public int signIn(MemberVO vo, Model m) {
		int cnt = dao.insertMember(vo);
		return cnt;
	}
	
	@RequestMapping(value="forgot", method=RequestMethod.GET)
	public String forgotForm() {
		return "member/fotgot";
	}
	
	@RequestMapping(value="profile", method=RequestMethod.GET)
	public String profile(HttpSession session,Model m) {
		String id = (String)session.getAttribute("loginId");
		MemberVO vo = dao.oneMember(id);
		String img = uploadPath +"/"+ vo.getImage(); 
		m.addAttribute("member", vo);
		m.addAttribute("myImg",img);
		return "member/profile";
	}
	
	// 기본이미지로 설정하기(삭제)
	@RequestMapping(value="mainImg", method=RequestMethod.POST)
	public String mainImg(HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		MemberVO vo = dao.oneMember(id);
		if(!vo.getImage().equals(mainImg)) {
		FileService.deleteFile(uploadPath +"/"+ vo.getImage());
		vo.setImage(mainImg);
		dao.updateImage(vo);
		}
		session.setAttribute("loginImage", vo.getImage());
		return "redirect:profile";
	}

	@RequestMapping(value="updateMember", method= RequestMethod.POST)
	public String updateMember(HttpSession session, MemberVO vo, Model m) {
		String id = (String)session.getAttribute("loginId");
		String nickname = (String)session.getAttribute("loginNickname");
		vo.setId(id);
		
		int cnt = dao.updateMember(vo);
		if(cnt > 0 && !vo.getNickname().equals(nickname)) {
			session.setAttribute("loginNickname", vo.getNickname());
		}
		return "redirect:profile";
	}
	
	@RequestMapping(value="uploadImg", method= RequestMethod.POST, produces="text/plain")
	public String uploadImg(MultipartFile upload, HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		MemberVO vo = dao.oneMember(id);
		if(upload != null) {
			if(!vo.getImage().equals(mainImg)) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			FileService.deleteFile(uploadPath +"/"+ vo.getImage());
			vo.setImage(savedfile);
			dao.updateImage(vo);
			}else {
			String savedfile = FileService.saveFile(upload, uploadPath);
			vo.setImage(savedfile);
			dao.updateImage(vo);
			}
		}
		String img = uploadPath +"/"+ vo.getImage();
		session.setAttribute("loginImage", img);
		
		return "redirect:profile";
	}
	
	@RequestMapping(value="friendList", method=RequestMethod.GET)
	public String friendList(HttpSession session,Model m) {
		String id = (String)session.getAttribute("loginId");
		FriendVO vo = new FriendVO();
		vo.setId1(id);
		vo.setCode(1);
		ArrayList<FriendVO> list = dao1.selectFB(vo);
		m.addAttribute("mylist", list);
		
		FriendVO vo1 = new FriendVO();
		vo1.setId2(id);
		ArrayList<FriendVO> list1 = dao1.selectFB1(id);
		m.addAttribute("list", list1);
		
		FriendVO vo2 = new FriendVO();
		vo2.setId1(id);
		vo2.setCode(2);
		ArrayList<FriendVO> list2 = dao1.selectFB(vo2);
		m.addAttribute("blacklist", list2);
		
		return "member/friendList";
	}
	
	@ResponseBody
	@RequestMapping(value="signout", method = RequestMethod.POST)
	public int signout(HttpSession session, String password) {
		String id = (String)session.getAttribute("loginId");
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPassword(password);
		
		int cnt = dao.signout(vo);
		if(cnt > 0) {
			session.removeAttribute("loginId");
			session.removeAttribute("loginNickname");
			session.removeAttribute("loginImage");
			return 1;
		} else return 0;
	}
	
	@ResponseBody
	@RequestMapping(value="addFriend", method= RequestMethod.POST)
	public int sendFriend(String id2, Model m, HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		
		// 내가 블랙리스트인지 여부 확인
		FriendVO vo1 = new FriendVO();
		vo1.setId1(id2);
		vo1.setCode(2);
		ArrayList<FriendVO> check1 = dao1.selectFB(vo1);
		for(FriendVO a : check1) {
			if(a.getId2().equals(id)) {
				return 0;
			}
		}
		// 있는 아이디인지 확인
		int cnt = dao.selectId(id2);
		if(cnt < 1) {
			return 0;
		}
		FriendVO vo2 = new FriendVO();
		vo2.setId1(id);
		vo2.setId2(id2);
		vo2.setCode(1);
		return dao1.insertFB(vo2);
		
	}
	
	@RequestMapping(value="deleteFriend", method=RequestMethod.GET)
	public String deleteFriend(String id1, HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		FriendVO vo = new FriendVO();
		vo.setId1(id);
		vo.setId2(id1);
		dao1.deleteFB(vo);
		return "redirect:friendList";
	}
	
	@ResponseBody
	@RequestMapping(value="deleteFr", method= RequestMethod.POST)
	public int blockFr(String id2, Model m, HttpSession session) {
		String id = (String)session.getAttribute("loginId");

		FriendVO vo = new FriendVO();
		vo.setId1(id);
		vo.setId2(id2);
		int cnt = dao1.deleteFB(vo);

		return cnt;
		
	}
	
	@ResponseBody
	@RequestMapping(value="stopBl", method= RequestMethod.POST)
	public int stopBl(String id2, Model m, HttpSession session) {
		String id = (String)session.getAttribute("loginId");

		FriendVO vo = new FriendVO();
		vo.setId1(id);
		vo.setId2(id2);
		int cnt = dao1.deleteFB(vo);

		return cnt;
		
	}
	
}
