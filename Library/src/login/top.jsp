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
    <title>トップページ</title>
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
    <h2>メニュー</h2>
    <div class="main">
      <A class="menu" href="">パスワード変更</A>
      <A class="menu" href="">本を借りる</A>
      <A class="menu" href="">本を返す</A>
      <%if(user.getLevel()==1){%>
      <A class="menu" href="../librarian/register.jsp">本を登録</A>
      <%}%>
      <%if(user.getLevel()==2){%>
      <A class="menu" href="../user/list.jsp">ユーザー管理</A>
      <%}%>
      <A class="menu" href="../login/logout.jsp">ログアウト</A>
    </div>
  </body>
</html>
