<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="library.*"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
UserList userlist = new UserList();
userlist.Load();
String[] aryLevelName={"���p��","�i��","�V�X�e���Ǘ���"};
%>
<html>
  <head>
    <title>���[�U�[�Ǘ�</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>���[�U�[�Ǘ�</h1>
    <div class="main">
      <h2>�ꗗ</h2>
      <table>
        <tr>
          <th>ID</th>
          <th>����</th>
          <th>���[�U�[���x��</th>
          <th>Email</th>
          <th>����</th>
        </tr>
        <%while(userlist.hasNext()){
          User anUser = userlist.getNext();
          %>
        <tr>
          <td class="center"><%=anUser.getId()%></td>
          <td><%=anUser.getName()%></td>
          <td><%=aryLevelName[anUser.getLevel()]%></td>
          <td><%=anUser.getEmail()%></td>
          <td class="center"><A href="edit.jsp?id=<%=anUser.getid()%>">�ҏW</td>
        </tr>
        <%}%>
      </table>
      <p>
        <A href="new.jsp">�V�K�o�^</A>
        <A href="../login/top2.jsp">�g�b�v�y�[�W</A>
        <A href="../login/logout.jsp">���O�A�E�g</A>
      </p>
    </div>
  </body>
</html>
