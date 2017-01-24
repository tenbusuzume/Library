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
    <title>�ݏo</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>�ݏo</h1>
    <div class="main">
      <%if(strMessage==null){%>
      �ݏo�����I<br>
      <p>
      <A href="../login/top2.jsp">�ꗗ�֖߂�</A><br>
      </p>
      <%}else{%>
      <%=strMessage%>
      <A href="javascript:history.back()">�߂�</A>
      <%}%>
    </div>
  </body>
</html>
