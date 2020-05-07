package global.sesoc.gongja.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.gongja.dao.BoardDAO;
import global.sesoc.gongja.dao.ClockDAO;
import global.sesoc.gongja.dao.MemberDAO;
import global.sesoc.gongja.dao.RoomDAO;
import global.sesoc.gongja.util.FileService;
import global.sesoc.gongja.util.PageNavigator;
import global.sesoc.gongja.vo.BoardVO;
import global.sesoc.gongja.vo.ClockVO;
import global.sesoc.gongja.vo.MemberVO;
import global.sesoc.gongja.vo.RoomVO;

@Controller
@RequestMapping("room")
public class RoomController {

	@Autowired
	private RoomDAO dao;
	
	@Autowired
	private BoardDAO bdao;
	
	@Autowired
	private ClockDAO cdao;
	
	@Autowired
	private MemberDAO mdao;
	
	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	//게시판 관련 상수값들
	final int countPerPage = 10;			//페이지당 글 수
	final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수
	final String uploadPath = "/boardfile";	//파일 업로드 경로
	@RequestMapping(value="make", method=RequestMethod.GET)
	public String make(Model m) {
		m.addAttribute("roomNum",0);
		return "room/make";
	}
	
	@ResponseBody
	@RequestMapping(value="makeRoom", method=RequestMethod.POST)
	public int makeRoom(HttpSession session,RoomVO vo,Model m) {
		String id = (String)session.getAttribute("loginId");
		vo.setId(id);
		
		int cnt = dao.insertRoom(vo);
		logger.debug("cnt 값 ?? {}",cnt);
			vo.setCode(1);
			vo.setNum(cnt);
			dao.insertRoomMember(vo);
			
			m.addAttribute("roomNum",cnt);
		
		return cnt;
	}
	
	@RequestMapping(value="roomList", method=RequestMethod.GET)
	public String roomList(
			@RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="searchText", defaultValue="") String searchText,
			HttpSession session, Model m) {
		
		String id = (String)session.getAttribute("loginId");
		
		int total = dao.getTotal(searchText);			//전체 글 개수
		
		//페이지 계산을 위한 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<RoomVO> boardlist = dao.listBoard(searchText, navi.getStartRecord(), navi.getCountPerPage());	
		
		
		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		m.addAttribute("list", boardlist);
		m.addAttribute("navi", navi);
		m.addAttribute("searchText", searchText);	
		/*
		 * for(RoomVO rvo : list) { if(rvo.getTag()!= null) { String[] tagList =
		 * rvo.getTag().split(","); rvo.setTagList(tagList); } }
		 */
		return "room/roomList";
	}
	
	@ResponseBody
	@RequestMapping(value="askStudy", method=RequestMethod.POST)
	public int askStudy(HttpSession session, int num) {
		String id = (String)session.getAttribute("loginId");
		RoomVO vo = new RoomVO();
		vo.setNum(num);
		vo.setCode(0);
		ArrayList<RoomVO> list = dao.roomMember(vo);
		for(RoomVO rvo : list) {
		if(id.equals(rvo.getId())) {
			return -1;
		}
		}
			vo.setId(id);
		int cnt = dao.insertRoomMember(vo);
		return cnt;
	}
	
	@RequestMapping(value="myRoom", method=RequestMethod.GET)
	public String myRoom(HttpSession session, Model m) {
		String id = (String)session.getAttribute("loginId");
		RoomVO vo1 = new RoomVO();
		vo1.setId(id);
		vo1.setCode(0);
		ArrayList<RoomVO> list1 = dao.myRoomList(vo1);
		
		RoomVO vo2 = new RoomVO();
		vo2.setId(id);
		vo2.setCode(1);
		ArrayList<RoomVO> list2 = dao.myRoomList(vo2);
		
		m.addAttribute("list1", list1);
		m.addAttribute("list2", list2);
		return "room/myRoom";
	}
	
	@RequestMapping(value="oneRoom", method=RequestMethod.GET)
	public String oneRoom(int num, HttpSession session, Model m) {
		String id = (String)session.getAttribute("loginId");

		// 룸 하나 정보
		RoomVO oneRoom = dao.oneRoom(num);
		
		// 룸 멤버 정보
		RoomVO vo = new RoomVO();
		vo.setCode(1);
		vo.setNum(num);
		ArrayList<RoomVO> memList = dao.roomMember(vo);
		
		// 신청 상태인 예비 멤버 정보
		RoomVO vo1 = new RoomVO();
		vo1.setCode(0);
		vo1.setNum(num);
		ArrayList<RoomVO> memListN = dao.roomMember(vo1);
		
		//만약 예비 맴버이면 ->
		for(RoomVO rvo: memListN) {
			if(rvo.getId().equals(id)) {
				m.addAttribute("cnt", 0);
			}
		}
		
		// rank 
		ArrayList<ClockVO> cvo = cdao.memberTime(num); //id, total
		for(ClockVO cc : cvo) {
			cc.setTitle(mdao.oneMember(cc.getId()).getImage());
			cc.setStartT(mdao.oneMember(cc.getId()).getNickname());
		}
		m.addAttribute("rank",cvo);
		
		// 이미지 넣기
		for(RoomVO r : memList) {
			r.setComments(mdao.oneMember(r.getId()).getImage());
			r.setTag(mdao.oneMember(r.getId()).getNickname());
		}
		
		
		//만약 멤버이면
		for(RoomVO rvo: memList) {
			if(rvo.getId().equals(id)) {
				m.addAttribute("cnt", 1);
			}
		}
		
	
		
		ArrayList<BoardVO> blist = bdao.boardList(num);
		ArrayList<BoardVO> gongji = new ArrayList<>();
		ArrayList<BoardVO> free = new ArrayList<>();
		for(BoardVO b : blist) {
			if(b.getCode() == 0) {
				free.add(b);
			}else if(b.getCode() == 1) {
				gongji.add(b);
			}
		}
		m.addAttribute("gongji",gongji);
		m.addAttribute("free",free);
		
		m.addAttribute("room",oneRoom);
		m.addAttribute("memList",memList);
		m.addAttribute("memListN", memListN);
		
		return "room/oneRoom";
	}
	
	@ResponseBody
	@RequestMapping(value="memberIn", method=RequestMethod.POST)
	public int memberIn(HttpSession session,RoomVO vo,Model m) {
		String id = (String)session.getAttribute("loginId");
		vo.setCode(1);
		int cnt = dao.updateRoomMember(vo);
		
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping(value="memberOut", method=RequestMethod.POST)
	public int memberOut(HttpSession session,RoomVO vo, Model m) {
		String id1 = (String)session.getAttribute("loginId");
		int cnt = dao.deleteRoomMember(vo);
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping(value="updateRoom", method=RequestMethod.POST)
	public int updateRoom(HttpSession session,RoomVO vo, Model m) {
		String id = (String)session.getAttribute("loginId");
		vo.setId(id);
		int cnt = dao.updateRoom(vo);
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping(value="apply", method=RequestMethod.POST)
	public int apply(HttpSession session, int num, Model m) {
		String id = (String)session.getAttribute("loginId");
		
		RoomVO vo = new RoomVO();
		vo.setId(id);
		vo.setNum(num);
		vo.setCode(0);
		return dao.insertRoomMember(vo);
	}
	
	@RequestMapping(value="writeBoard", method=RequestMethod.GET)
	public String writeBoard(Model m,int num, HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		
		// id 체크 프로세스
		RoomVO vo = new RoomVO();
		vo.setId(id);
		vo.setNum(num);
		String check = dao.iMember(vo);
		if(check == null) {
			return "redirect:roomList";
		}
		
		RoomVO vo1 = dao.oneRoom(num);
		if(vo1.getId().equals(id)) {
			m.addAttribute("leader",1);
		}
		
		m.addAttribute("room_num",num);
		
		return "room/writeBoard";
	}
	
	
	@RequestMapping(value="writeBoard", method=RequestMethod.POST)
	public String writeBoardd(HttpSession session, BoardVO vo, int num, MultipartFile upload) {
		String id = (String)session.getAttribute("loginId");
		vo.setId(id);
		vo.setRoom_num(num);
		//첨부파일이 있는 경우 지정된 경로에 저장하고, 원본 파일명과 저장된 파일명을 Board객체에 세팅
				if (!upload.isEmpty()) {
					String savedfile = FileService.saveFile(upload, uploadPath);
					vo.setOriginalfile(upload.getOriginalFilename());
					vo.setSavedfile(savedfile);
				}
		bdao.insertBoard(vo);		
		return "redirect:oneRoom?num="+num;
	}
	
	@RequestMapping(value="board", method=RequestMethod.GET)
	public String board(Model m, int num, int room_num, HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		
		// id 체크 프로세스
		RoomVO vo = new RoomVO();
		vo.setId(id);
		vo.setNum(room_num);
		String check = dao.iMember(vo);
		if(check == null) {
			return "redirect:roomList";
		}
		
		BoardVO vo1 = new BoardVO();
		vo1.setRoom_num(room_num);
		vo1.setNum(num);
		BoardVO bvo = bdao.oneBoard(vo1);
		
		m.addAttribute("board",bvo);
		m.addAttribute("room_num",room_num);
		m.addAttribute("num",num);
		
		return "room/board";
	}
	
	@RequestMapping(value="updateBoard", method=RequestMethod.GET)
	public String updateBoard(Model m, int num, int room_num, HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		
		// id 체크 프로세스
		RoomVO vo = new RoomVO();
		vo.setId(id);
		vo.setNum(room_num);
		String check = dao.iMember(vo);
		if(check == null) {
			return "redirect:roomList";
		}
		
		RoomVO vo2 = dao.oneRoom(room_num);
		if(id.equals(vo2.getId())) {
			m.addAttribute("leader",1);
		}
		
		BoardVO vo1 = new BoardVO();
		vo1.setRoom_num(room_num);
		vo1.setNum(num);
		BoardVO bvo = bdao.oneBoard(vo1);
		
		m.addAttribute("board",bvo);
		
		
		return "room/updateBoard";
	}
	
	@ResponseBody
	@RequestMapping(value="updateBoard", method=RequestMethod.POST)
	public int updateBoard(HttpSession session, BoardVO vo) {
		String id = (String)session.getAttribute("loginId");
		vo.setId(id);
		logger.debug("lllll{}", vo.getCode());
		return bdao.updateBoard(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="deleteBoard", method=RequestMethod.POST)
	public int deleteBoard(HttpSession session, BoardVO vo) {
		String id = (String)session.getAttribute("loginId");
		vo.setId(id);
		
		BoardVO dd = bdao.oneBoard(vo);
		
		String fullPath = uploadPath + "/" + dd.getSavedfile();
		FileService.deleteFile(fullPath);
		return bdao.deleteBoard(vo);
	}
	
	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public String boardList(
			@RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="searchText", defaultValue="") String searchText,
			int num, HttpSession session, Model m) {
		
		String id = (String)session.getAttribute("loginId");
		
		int total = dao.getTotal(searchText);			//전체 글 개수
		
		//페이지 계산을 위한 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		
		BoardVO bvo = new BoardVO();
		bvo.setRoom_num(num);
		bvo.setTitle(searchText);
		
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<BoardVO> boardlist = bdao.boardList1(bvo, navi.getStartRecord(), navi.getCountPerPage());	
		
		
		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		m.addAttribute("board", boardlist);
		m.addAttribute("navi", navi);
		m.addAttribute("searchText", searchText);
		m.addAttribute("num",num);
		/*
		 * for(RoomVO rvo : list) { if(rvo.getTag()!= null) { String[] tagList =
		 * rvo.getTag().split(","); rvo.setTagList(tagList); } }
		 */
		return "room/boardList";
	}
	
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String fileDownload(int num,int room_num, Model model, HttpServletResponse response) {
		
		BoardVO vo = new BoardVO();
		vo.setNum(num);
		vo.setRoom_num(room_num);
		
		BoardVO board = bdao.oneBoard(vo);
		
		//원래의 파일명
		String originalfile = new String(board.getOriginalfile());
		try {
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//저장된 파일 경로
		String fullPath = uploadPath + "/" + board.getSavedfile();
		
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			//Spring의 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
	
}
