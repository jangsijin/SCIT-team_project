package global.sesoc.gongja.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.gongja.vo.MessageVO;

@Repository
public class MessageDAO {

	@Autowired
	private SqlSession session;
	
	public int insertMessage(MessageVO vo) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		
		int cnt = mapper.insertMessage(vo);
		return cnt;
	}
	
	public ArrayList<MessageVO> readMessage(String id){
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		
		ArrayList<MessageVO> cnt = mapper.readMessage(id);
		return cnt;
	}
	
	public ArrayList<MessageVO> sendMessage(String id){
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		
		ArrayList<MessageVO> cnt = mapper.sendMessage(id);
		return cnt;
	}
	
	public int deleteMessage(String id){
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		
		int cnt = mapper.deleteMessage(id);
		return cnt;
	}
}
