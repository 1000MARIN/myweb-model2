package com.example.controller.member;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import com.example.controller.Action;
import com.example.controller.ActionForward;
import com.example.domain.MemberVO;
import com.example.repository.MemberDAO;

public class MemberJoinProAcion implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		MemberVO memberVO = new MemberVO();
		
		memberVO.setId(request.getParameter("id"));
		memberVO.setPasswd(request.getParameter("passwd"));
		memberVO.setName(request.getParameter("name"));
		memberVO.setBirthday(request.getParameter("birthday"));
		memberVO.setGender(request.getParameter("gender"));
		memberVO.setEmail(request.getParameter("email"));
		memberVO.setRecvEmail(request.getParameter("recvEmail"));
		
		memberVO.setRegDate(new Timestamp(System.currentTimeMillis()));
		
		// 비밀번호를 jbcrypt 라이브러리 사용해서 암호화하여 저장하기
		String passwd = memberVO.getPasswd();
		String pwHash = BCrypt.hashpw(passwd, BCrypt.gensalt()); // 60글자로 암호화된 문자열 리턴함
		memberVO.setPasswd(pwHash); // 암호화된 비밀번호 문자열로 수정하기
	
		// 생년월일 문자열에서 하이픈(-) 기호 제거하기
		String birthday = memberVO.getBirthday();
		birthday = birthday.replace("-", ""); // 하이픈 문자열을 빈문자열로 대체
		memberVO.setBirthday(birthday);

		System.out.println(memberVO); // 서버 콘솔 출력
		
		// MemberDAO 객체 준비
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		// 회원가입 insert 처리하기
		memberDAO.insert(memberVO);
		
		
		// 리다이렉트 방식 1
		// 폼 태그로 부터 사용자 입력값을 받아서 처리한 이후에 
		// 응답을 줄때는 항상 리다이렉트 방식을 원함
//		ActionForward forward = new ActionForward();
//		forward.setRedirect(true);
//		forward.setPath("member/login");
		
		// 리다이렉트 방식 2
		// 자바스크립트 코드가 간단할 경우는 다음과 같이 처리 가능함.
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("	alert('회원가입 성공');");
		out.println("	location.href = '/member/login.jsp';");
		out.println("</script>");
		out.flush();
		// 자바스크립트 코드가 여러줄로 아주 많을 경우에는
		// 별도의 jsp 파일로 만들어서 forwarding 방식으로
		// 자바스크립트 실행문이 들어있는 해당 jsp 파일을 바로 실행하는 방식이 좋음.ㅇ
		return null;
	}

}
