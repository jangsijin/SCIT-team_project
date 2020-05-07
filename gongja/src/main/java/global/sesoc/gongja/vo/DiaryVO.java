package global.sesoc.gongja.vo;

import lombok.Data;

@Data
public class DiaryVO {

	private int num;
	private String id;
	private String title;
	private String detail;
	private int star;
	private String inputdate;
	private String image;
	private String sentiment;
}
