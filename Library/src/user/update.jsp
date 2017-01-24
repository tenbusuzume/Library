<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.User" id="userEdit" scope="session"/>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
request.setCharacterEncoding("Windows-31J");
String strId = request.getParameter("strUser_Id");
String strName = request.getParameter("strUser_Name");
String strEmail = request.getParameter("strUser_Email");
int strLevel = Integer.parseInt(request.getParameter("user_level"));
String strPassword = request.getParameter("password1");
userEdit.setId(strId);
userEdit.setName(strName);
userEdit.setEmail(strEmail);
userEdit.setLevel(strLevel);
String strMessage=userEdit.Update(strPassword);
%>
<html>
  <head>
    <title>���[�U�[�Ǘ�</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>���[�U�[�Ǘ�</h1>
    <div class="main">
      <h2>�X�V����</h2>
      <p>
        <%if(strMessage==null){%>
        �X�V���܂���<br>
        <A href="list.jsp">�ꗗ</A>
        <%}else{%>
        <%=strMessage%><br>
        <A href="javascript:history.back()">�߂�</A>
        <%}%>
      </p>
    </div>
  </body>
</html>
