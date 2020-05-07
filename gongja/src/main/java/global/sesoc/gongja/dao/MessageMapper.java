package global.sesoc.gongja.dao;

import java.util.ArrayList;

import global.sesoc.gongja.vo.MessageVO;

public interface MessageMapper {

	public int insertMessage(MessageVO vo);
	public ArrayList<MessageVO> readMessage(String id);
	public ArrayList<MessageVO> sendMessage(String id);
	public int deleteMessage(String id);
}
