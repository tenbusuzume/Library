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
    <title>�폜����</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>�폜����</h1>
    <div class="main">
      <%if(strMessage==null){%>
      �폜���܂���<br>
      <A href="register.jsp">���X�g�ɖ߂�</A>
      <%}else{%>
      <%=strMessage%>
      <A href="javascript:history.back()">�߂�</A>
      <%}%>
    </div>
  </body>
</html>
