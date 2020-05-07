package global.sesoc.gongja.vo;

import lombok.Data;

@Data
public class ChartVO {

	private String id;
	private String hour;
	private String min;
	private String sec;
	private int hcount;
	private int scount;
	private String inputdate;
}
