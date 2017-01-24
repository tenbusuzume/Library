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
String[] aryLevelName={"利用者","司書","システム管理者"};
%>
<html>
  <head>
    <title>ユーザー管理</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>ユーザー管理</h1>
    <div class="main">
      <h2>一覧</h2>
      <table>
        <tr>
          <th>ID</th>
          <th>氏名</th>
          <th>ユーザーレベル</th>
          <th>Email</th>
          <th>操作</th>
        </tr>
        <%while(userlist.hasNext()){
          User anUser = userlist.getNext();
          %>
        <tr>
          <td class="center"><%=anUser.getId()%></td>
          <td><%=anUser.getName()%></td>
          <td><%=aryLevelName[anUser.getLevel()]%></td>
          <td><%=anUser.getEmail()%></td>
          <td class="center"><A href="edit.jsp?id=<%=anUser.getid()%>">編集</td>
        </tr>
        <%}%>
      </table>
      <p>
        <A href="new.jsp">新規登録</A>
        <A href="../login/top2.jsp">トップページ</A>
        <A href="../login/logout.jsp">ログアウト</A>
      </p>
    </div>
  </body>
</html>
