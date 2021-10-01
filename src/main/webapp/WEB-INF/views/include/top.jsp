<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 사용자 세션에서 id 가져오기 --%>
<% String id = (String) session.getAttribute("id"); %>

  <nav class="nav-extended light-blue lighten-1">
    <div class="nav-wrapper container">
      <a id="logo-container" href="/index.jsp" class="brand-logo">Logo</a>
      <ul id="mainMenu" class="right hide-on-med-and-down">
      <%
      if (id == null) {
    	  %>
    	<!-- 로그아웃 상태일때 -->
        <li><a href="/member/login.jsp" id="loginMenu" data-has-submenu="false">로그인</a></li>
        <li><a href="/member/join.jsp" id="joinMenu" data-has-submenu="false">회원가입</a></li>
    	  <%
      } else {
    	  %>
    	<!-- 로그인 상태일때 -->
        <li><a href="/member/logout.jsp" id="logoutMenu" data-has-submenu="false">로그아웃</a></li>
        <li><a href="#!" id="memberMenu" data-has-submenu="true">내정보(<%=id %>)</a></li>
    	  <%
      }
      %>
        <!-- 로그인 관계없이 보이는 메뉴 -->
        <li><a href="#!" id="boardMenu" data-has-submenu="true">게시판</a></li>
        <li><a href="#!" id="chatMenu" data-has-submenu="true">채팅</a></li>
      </ul>

      <ul id="nav-mobile" class="sidenav">
        <li><a href="#">Navbar Link</a></li>
      </ul>
      <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
    </div>
    
    <div id="subMenuArea" class="nav-content container">
      <ul id="subMenu" class="tabs tabs-transparent">
      	<!-- 내정보 서브메뉴 -->
      	<li class="tab submenu-member"><a href="/member/changePasswd.jsp">비밀번호 변경</a></li>
      	<li class="tab submenu-member"><a href="/member/modifyMember.jsp">내정보 수정</a></li>
      	<li class="tab submenu-member"><a href="/member/removeMember.jsp">회원탈퇴</a></li>
      	<!-- 게시판 서브메뉴 -->
      	<li class="tab submenu-board"><a href="/board/boardList.jsp">게시판</a></li>
      	<li class="tab submenu-board"><a href="#!">자료실</a></li>
      	<!-- 채팅 서브메뉴 -->
      	<li class="tab submenu-chat"><a href="#!">간단한 채팅</a></li>
      	<li class="tab submenu-chat"><a href="#!">채팅방 목록</a></li>
      </ul>
    </div>
  </nav>
  
<script>
	// html 문서 로딩 완료됐을때
	$(document).ready(function () {
		
		// 주메뉴 a태그에 클릭 이벤트 연결
		$('ul#mainMenu a').on('click', function (event) {
			
			// 선택한 주메뉴 a태그의 id 속성값 가져오기
			var menuId = $(this).attr('id');
			console.log('menuId : ' + menuId);
			
			// 서브메뉴 li 모두 숨기기
			$('ul#subMenu > li').hide();  // display: none;
			// 선택한 주메뉴에 해당하는 서브메뉴 보이기
			if (menuId == 'memberMenu') {
				$('li.submenu-member').show(); // display: block;
			} else if (menuId == 'boardMenu') {
				$('li.submenu-board').show();
			} else if (menuId == 'chatMenu') {
				$('li.submenu-chat').show();
			}
			
			
			// 선택한 주메뉴가 서브메뉴를 가졌는지 data 속성으로 확인하기
			var hasSubmenu = $(this).data('hasSubmenu');
			console.log('hasSubmenu : ' + hasSubmenu);
			
			if (hasSubmenu == true) { // 서브메뉴가 있으면
				event.preventDefault(); // 주메뉴 a태그의 기본동작 막기
				//$('div#subMenuArea').slideDown(200); // 서브메뉴영역 열기
				
				// class 속성에 active 가졌는지 확인. (사용자가 이전에 이미 선택했던 메뉴인지 확인)
				var thisMenuAlreadySelected = $(this).closest('li').hasClass('active');
				if (thisMenuAlreadySelected == true) { // 이미 선택했던 메뉴이면
					$('div#subMenuArea').slideToggle(200); // 서브메뉴영역 토글하기
				} else { // 선택하지 않은 메뉴이면
					$('div#subMenuArea').slideDown(200); // 서브메뉴영역 열기
				}
			} else { // 서브메뉴가 없으면
				$('div#subMenuArea').slideUp(200); // 서브메뉴영역 닫기
			}
			
			// 주메뉴 li의 클래스 속성에 active 값 모두 제거하기
			$('ul#mainMenu > li').removeClass('active');
			// 현재 선택한 주메뉴 li에 클래스 속성 active 추가하기
			$(this).closest('li').addClass('active');
		}); // click event
	});
</script>















