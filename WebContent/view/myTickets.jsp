<%@page import="java.util.ArrayList"%>
<%@page import="vo.TicketVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ include file="../header.jsp" %>

<%
	ArrayList<TicketVO> data = new ArrayList<TicketVO>();

	if(user == null) {
		out.print("<script>alert('로그인 후 이용 가능합니다.'); location.href = '/view/login.jsp';</script>");
		return;
	}else {
		if(request.getAttribute("myTicket") == null) {
			response.sendRedirect("/myTicket.do?user=" + user.getId());
		}else {
			data = (ArrayList) request.getAttribute("myTicket");
		}
	}
%>

<div class="ui container">
    <div class="visual">
        <img src="/images/logo.jpg" alt="visualImg">
    </div>

    <div class="main" style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
    <% if(user.getId().equals("admin")) {%>
        <h2>전체 예매 목록(관리자 모드)</h2>
     <% }else { %>
        <h2><%=user.getId() %>님의 예매 목록</h2>
     <% } %>

		<table class="ui inverted pink table">
			<thead>
				<tr>
					<th>티켓 번호</th>
					<th>결제한 날짜</th>
					<th>스케줄 번호</th>
					<th>좌석 번호</th>
					<th>회원아이디</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(TicketVO item : data) {
				%>
				<tr>
					<td><%=item.getTicketNo() %></td>
					<td><%=item.getBookDate() %></td>
					<td><%=item.getSchNo() %></td>
					<td><%=item.getSeatNo() %></td>
					<td><%=item.getId() %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

	</div>
</div>


<%@ include file="../footer.jsp" %>