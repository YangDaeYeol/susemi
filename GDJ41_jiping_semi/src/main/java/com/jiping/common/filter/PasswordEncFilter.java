package com.jiping.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class PasswordEncFilter
 */
@WebFilter(servletNames = {"passwordUpdate","enrollmember"})
public class PasswordEncFilter implements Filter {

    /**
     * Default constructor. 
     */
    public PasswordEncFilter() {
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
		// getParameter메소드를 재정의 해서 사용
		// getParameter의 매개변수가 password에 관련된 내용이면 단방향 암호화 처리
		PasswordEncryptorWrapper pew = new PasswordEncryptorWrapper((HttpServletRequest)request);
		
		// pass the request along the filter chain
		chain.doFilter(pew, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
