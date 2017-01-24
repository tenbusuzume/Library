<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<jsp:useBean class="library.Librarian" id="bookEdit" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
request.setCharacterEncoding("Windows-31J");
String strId = request.getParameter("id");
int intId = Integer.parseInt(strId);
int intid=user.getid();
bookEdit.setIntUser(intid);
bookEdit.setIntId(intId);
String strMessage=bookEdit.borrow();
%>
<html>
  <head>
    <title>貸出</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>貸出</h1>
    <div class="main">
      <%if(strMessage==null){%>
      貸出完了！<br>
      <p>
      <A href="../login/top2.jsp">一覧へ戻る</A><br>
      </p>
      <%}else{%>
      <%=strMessage%>
      <A href="javascript:history.back()">戻る</A>
      <%}%>
    </div>
  </body>
</html>
