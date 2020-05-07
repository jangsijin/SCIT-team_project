package global.sesoc.gongja.vo;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String password;
	private String nickname;
	private String email;
	private String inputdate;
	private int birthdate;
	private String image;
	private String verify;
}
