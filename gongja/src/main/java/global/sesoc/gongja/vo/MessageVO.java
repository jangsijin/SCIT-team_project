package global.sesoc.gongja.vo;

import lombok.Data;

@Data
public class MessageVO {

	private int num;
	private String sender;
	private String reader;
	private String detail;
	private String send_date;
}
