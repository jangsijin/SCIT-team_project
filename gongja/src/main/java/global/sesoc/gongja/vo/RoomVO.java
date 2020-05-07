package global.sesoc.gongja.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class RoomVO {
	private int num;
	private String id;
	private String title;
	private String comments;
	private int goal;
	private int code;
	private String inputdate;
	private String tag;
	private String[] tagList;
}
