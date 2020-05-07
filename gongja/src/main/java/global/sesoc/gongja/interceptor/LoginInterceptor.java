package global.sesoc.gongja.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
		logger.debug("loginInterceptor 실행");
		
		HttpSession session = req.getSession();
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId == null) {
			res.sendRedirect(req.getContextPath() + "/member/login");
			return false;
		}
		
		return super.preHandle(req, res, handler);
	}
	
}