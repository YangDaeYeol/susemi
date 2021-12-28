package com.jiping.member.model.service;

import static com.jiping.common.JDBCTemplate.close;
import static com.jiping.common.JDBCTemplate.commit;
import static com.jiping.common.JDBCTemplate.rollback;
import static com.jiping.common.JDBCTemplate.getConnection;
import static com.jiping.common.JDBCTemplate.rollback;
import static com.jiping.common.JDBCTemplate.commit;

import java.sql.Connection;
import java.util.List;

import com.jiping.lecture.model.vo.Lecture;
import com.jiping.member.model.dao.MemberDao;
import com.jiping.member.model.vo.Member;

public class MemberService {
	
	private MemberDao dao = new MemberDao();
	
	public List<String> selectAllEmail() {
		Connection conn = getConnection();
		List<String> list = dao.selectAllEmail(conn);
		close(conn);
		return list;
	}
	

	public Member loginMember(String email, String password) {
		Connection conn=getConnection();
		Member m=dao.loginMember(conn, email, password);
		close(conn);
		return m;
	}
	
	public Member findEmail(String userName, String phone) {
		Connection conn = getConnection();
		Member m = dao.findEmail(conn,userName,phone);
		close(conn);
		return m;
	}
	
	public Member selectMember(String email) {
		Connection conn=getConnection();
		Member m=dao.selectMember(conn, email);
		close(conn);
		return m;
	}
	
	public int dropMember(String email) {
		Connection conn=getConnection();
		int result=dao.dropMember(conn, email);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<String> selectAllNickname() {
		Connection conn = getConnection();
		List<String> list = dao.selectAllNickname(conn);
		close(conn);
		return list;
	}

	public int passwordUpdate(String email, String password) {
		Connection conn = getConnection();
		int result = dao.passwordUpdate(conn,email,password);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;	
	}
	
	public int enrollMember(Member m) {
		Connection conn = getConnection();
		int result = dao.enrollMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public Member nicknameDuplicateCheck(String newNick) {
		Connection conn=getConnection();
		Member m=dao.nicknameDuplicateCheck(conn, newNick);
		close(conn);
		return m;
	}


	public List<Member> normalMemberList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<Member> normalMemberList= dao.normalMemberList(conn,cPage,numPerPage);
		close(conn);
		return normalMemberList;
	}


	public List<Member> tutorList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<Member> tutorList= dao.tutorList(conn,cPage,numPerPage);
		close(conn);
		return tutorList;
	}


	public int selectNormalMemberAllCount() {
		Connection conn=getConnection();
		int result = dao.selectNormalMemberAllCount(conn);
		close(conn);
		return result;
	}


	public int selectTutorAllCount() {
		Connection conn=getConnection();
		int result = dao.selectTutorAllCount(conn);
		close(conn);
		return result;
	}

}
