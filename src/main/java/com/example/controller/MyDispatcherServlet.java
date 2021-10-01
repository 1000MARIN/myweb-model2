package com.example.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// MVC(모델2) 			: Moedl-View-Controller 패턴으로 작성하는 방식

// 컨트롤러 			: 뷰와 모델 사이에서 제어를 담당하는 클래스

// 프론트 컨트롤러 패턴 : 모든 사용자 요청을 전담해서 받아 처리하는 클래스
//						  뷰(JSP)가 직접적으로 요청을 받으면 안됨!

// MydispatcherServlet 클래스를 프론트 컨트롤러 역할로 작성.

//@WebServlet("*.do")
public class MyDispatcherServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// http://localhost:8090/myweb/
		// http://localhost:8090/
		
		// 1. 사용자 요청주소를 통해 요청 명령어 구하기
		
		String requestURI = request.getRequestURI();
		System.out.println("requestURI : " + requestURI);				// "/myweb/index.do"
																		// "/index.do"
		
		String contextPath = request.getContextPath();
		System.out.println("contextPath : " + contextPath);				// "/myweb"
																		// ""
		
		String command = requestURI.substring(contextPath.length() + 1);	
		System.out.println("command : " + command);						// "/index.do"
		
		
		// 2. 요청 명령어에 해당하는 작업 처리하기
		
		
		
		// 3. 작업 처리 후 사용자에게 알맞은 응답(화면 또는 데이터)을 보내기
		
		
		
		
	} // end of service
	

}
