package com.jiping.member.model.service;

import static com.jiping.common.JDBCTemplate.close;
import static com.jiping.common.JDBCTemplate.commit;
import static com.jiping.common.JDBCTemplate.getConnection;
import static com.jiping.common.JDBCTemplate.rollback;

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
	
	public List<Lecture> lectureList(String email){
		Connection conn=getConnection();
		List<Lecture> list=dao.lectureList(conn, email);
		close(conn);
		return list;
	}
	
	public int lectureCount(String email) {
		Connection conn=getConnection();
		int count=dao.lectureCount(conn, email);
		close(conn);
		return count;
	}
	
	public List<Lecture> lectureVodList(String email){
		Connection conn=getConnection();
		List<Lecture> list=dao.lectureVodList(conn, email);
		close(conn);
		return list;
	}
	
	public int lectureVodListCount(String email) {
		Connection conn=getConnection();
		int count=dao.lectureVodListCount(conn, email);
		close(conn);
		return count;
	}
	
	public List<Lecture> endLectureList(String email){
		Connection conn=getConnection();
		List<Lecture> list=dao.endLectureList(conn, email);
		close(conn);
		return list;
	}
	
	public int endLectureCount(String email) {
		Connection conn=getConnection();
		int count=dao.lectureCount(conn, email);
		close(conn);
		return count;
	}


	public int updateMember(Member m) {
		Connection conn=getConnection();
		int result=dao.updateMember(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Lecture> lectureTutorList(String nickname){
		Connection conn=getConnection();
		List<Lecture> list=dao.lectureTutorList(conn, nickname);
		close(conn);
		System.out.println(list);
		return list;
	}
	
	public int lectureTutorListCount(String nickname) {
		Connection conn=getConnection();
		System.out.println(nickname);
		int count=dao.lectureTutorListCount(conn, nickname);
		close(conn);
		return count;
	}

	public List<Lecture> lectureTutorEndList(String nickname){
		Connection conn=getConnection();
		List<Lecture> list=dao.lectureTutorEndList(conn, nickname);
		close(conn);
		System.out.println(list);
		return list;
	}
	
	public int lectureTutorEndListCount(String nickname) {
		Connection conn=getConnection();
		System.out.println(nickname);
		int count=dao.lectureTutorEndListCount(conn, nickname);
		close(conn);
		return count;
	}
	
}
