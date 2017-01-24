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
<title>ユーザー削除</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
  <h1>ユーザー削除</h1>
  <div class="main">
    <h2>ユーザーリスト</h2>
    <table>
      <tr>
        <th></th>
        <th>氏名</th>
        <th>ユーザーレベル</th>
        <th>Email</th>
      </tr>
      <%while(userlist.hasNext()){
        User anUser = userlist.getNext();
      }%>
      <tr>
        <td><A href="delete_confirm()?id=<%=user.getId()%>">削除</A></td>
        <td><%=anUser.getName()%></td>
        <td><%=anUser.getLevel()%></td>
        <td><%=anUser.getEmail()%></td>
      </tr>
    </table>
    <p>
      <input type="button" value="戻る" href="javascript:history.back()">
    </p>
  </div>
</body>
</html>
