<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Librarian" id="bookEdit" scope="session"/>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
request.setCharacterEncoding("Windows-31J");
String values[];
values = request.getParameterValues("cb");
String strMessage=bookEdit.Delete(values);
%>
<html>
  <head>
    <title>íœŒ‹‰Ê</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>íœŒ‹‰Ê</h1>
    <div class="main">
      <%if(strMessage==null){%>
      íœ‚µ‚Ü‚µ‚½<br>
      <A href="register.jsp">ƒŠƒXƒg‚É–ß‚é</A>
      <%}else{%>
      <%=strMessage%>
      <A href="javascript:history.back()">–ß‚é</A>
      <%}%>
    </div>
  </body>
</html>
