package com.jiping.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jiping.member.model.service.MemberService;
import com.jiping.member.model.vo.Member;

/**
 * Servlet implementation class AdminTutorMemberList
 */
@WebServlet(name="adminTutorList", urlPatterns={"/admin/adminTutorList"})
public class AdminTutorList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTutorList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		///////////////////
		// =======================페이징 복붙======================
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		int numPerPage=10;//페이지당 출력 데이터수
		
		List<Member> tutorList= new MemberService().tutorList(cPage,numPerPage);
		
		//pageBar 작성하기
		int totalData = new MemberService().selectTutorAllCount();
		//System.out.println("totalData : "+totalData);
		//전체 페이지수
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		//페이지에 출력할 페이지의 갯수
		int pageBarSize = 5;
		//페이지 숫자의 시작값을 설정
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		//페이지 숫자의 끝값을 설정
		int pageEnd = pageNo+pageBarSize-1;
		
		String pageBar="";
		//이전 버튼 만들기
		if(pageNo==1) {
			pageBar="<span>[이전]</span>";
		}else {
			pageBar="<a href='"+request.getContextPath()
					+"/admin/adminNormalMemberList?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		//while(!(pageNo<=pageEnd&&pageNo<=totalPage)) {
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
						+"/admin/adminTutorList?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		
		}else {
			pageBar+="<a href='"+request.getContextPath()
					+"/admin/adminTutorList?cPage="+pageNo+"'>[다음]</a>";
		}
		
		//생성된 페이지 버튼을 프론트로 전달
		request.setAttribute("pageBar", pageBar);
		//System.out.println(pageBar);
		
		//////////////////////////////////////////////////////////
		
		request.setAttribute("tutorList",tutorList);
		System.out.println(tutorList);
		request.getRequestDispatcher("/views/admin/adminTutorList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
