<%@ page contentType="text/css; charset=Windows-31J"%>
<%@ page import="library.*"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.User" id="userEdit" scope="session"/>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
UserList userlist = new UserList();
userlist.Load();
%>
<html>
<head>
<title>���[�U�[�폜</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
  <h1>���[�U�[�폜</h1>
  <div class="main">
    <h2>���[�U�[���X�g</h2>
    <table>
      <tr>
        <th></th>
        <th>����</th>
        <th>���[�U�[���x��</th>
        <th>Email</th>
      </tr>
      <%while(userlist.hasNext()){
        User anUser = userlist.getNext();
      }%>
      <tr>
        <td><A href="delete_confirm()?id=<%=user.getId()%>">�폜</A></td>
        <td><%=anUser.getName()%></td>
        <td><%=anUser.getLevel()%></td>
        <td><%=anUser.getEmail()%></td>
      </tr>
    </table>
    <p>
      <input type="button" value="�߂�" href="javascript:history.back()">
    </p>
  </div>
</body>
</html>
