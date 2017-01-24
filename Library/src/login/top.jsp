<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("session_timeout.jsp");
  return;
}
%>
<html>
  <head>
    <title>�g�b�v�y�[�W</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
      <style type="text/css">
      A.menu{
        display: block;
        width: 200;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
      }
      </style>
  </head>
  <body>
    <h2>���j���[</h2>
    <div class="main">
      <A class="menu" href="">�p�X���[�h�ύX</A>
      <A class="menu" href="">�{���؂��</A>
      <A class="menu" href="">�{��Ԃ�</A>
      <%if(user.getLevel()==1){%>
      <A class="menu" href="../librarian/register.jsp">�{��o�^</A>
      <%}%>
      <%if(user.getLevel()==2){%>
      <A class="menu" href="../user/list.jsp">���[�U�[�Ǘ�</A>
      <%}%>
      <A class="menu" href="../login/logout.jsp">���O�A�E�g</A>
    </div>
  </body>
</html>
