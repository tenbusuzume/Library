<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<%
String strUser_Id = request.getParameter("user_Id");
String strPassword = request.getParameter("user_password1");
String strMessage = user.Login(strUser_Id,strPassword);
%>
<html>
  <head>
    <title>ログイン</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <div class="main">
      <p>
  <!--Loginメソッドの戻り値の中身がnullなら登録完了-->
        <%if(strMessage==null){%>
        こんにちは<%=user.getName()%>さん<br>
        <A href="top2.jsp">トップページ</A>へ移動
        <%}else{%>
  <!--nullでなければエラー文が表示され未登録-->
        <%=strMessage%><br>
        <A href="first.jsp">戻る</A>
        <%}%>
      </p>
    </div>
  </body>
</html>
