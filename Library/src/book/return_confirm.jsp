<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="library.*"%>
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
bookEdit.setIntId(intId);
String strMessage=bookEdit.Return();
%>
<html>
  <head>
    <title>•Ô‹p</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>•Ô‹p</h1>
    <div class="main">
      <%if(strMessage==null){%>
      •Ô‹pŠ®—¹I<br>
      <A href="../login/top2.jsp">ˆê——‚Ö–ß‚é</A>
      <%}else{%>
      <%=strMessage%>
      <A href="javascript:history.back()">–ß‚é</A>
      <%}%>
    </div>
  </body>
</html>
