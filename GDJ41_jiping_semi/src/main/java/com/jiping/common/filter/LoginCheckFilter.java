package com.jiping.common.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.jiping.member.model.vo.Member;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter(servletNames={"drop" , "IngOff", "IngVod", "dromPage", "endClassUser", "heart", "mypage", "nicknameDuplicate" 
		, "tutorEndClass", "tutorRunClass" ,"updateMember"})
public class LoginCheckFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginCheckFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		//1.로그인한 데이터를 가져와야함!
				HttpSession session=((HttpServletRequest)request).getSession();
				Member loginMember=(Member)session.getAttribute("loginMember");
				String email=request.getParameter("email");
				if(loginMember==null){
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out=response.getWriter();
					out.println("<script>alert('로그인 후 다시 시도하세요!'); location.href='"
							+((HttpServletRequest) request).getContextPath()+"/';</script>");
					out.close();
					
					
				}else {
					chain.doFilter(request, response); //다음을 넘어감!
					
					
				}	
				// pass the request along the filter chain
		
		
		
		
		
		
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
