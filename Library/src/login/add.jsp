<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="userEdit" scope="page"/>
<%

//new_userからの値を取得し
request.setCharacterEncoding("Windows-31J");
String strUser_Id = request.getParameter("user_Id");
String strName = request.getParameter("user_name");
String strEmail = request.getParameter("user_email");
String strPassword = request.getParameter("user_password1");
int level = 0;
//userEditにセット
userEdit.setId(strUser_Id);
userEdit.setName(strName);
userEdit.setEmail(strEmail);
userEdit.setLevel(level);
//Addメソッドを実行
String strMessage=userEdit.Add(strPassword);
%>
<html>
  <head>
    <title>新規登録</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h2>新規登録</h2>
    <div class="main">
      <p>
<!--ADDメソッドの戻り値の中身がnullなら登録完了-->
      <%if(strMessage==null){%>
        登録が完了しました<br />
        <A href="../login/login_form.jsp">ログイン画面</A>
      <%}else{%>
<!--nullでなければエラー文が表示され未登録-->
      <%=strMessage%><br>
      <A href="javascript:history.back()">戻る</A>
      <%}%>
    </p>
    </div>
  </body>
</html>
