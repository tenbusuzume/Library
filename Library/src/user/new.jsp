<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
%>
  <html>
    <head>
      <title>新規登録</title>
      <link rel="stylesheet" type="text/css" href="../style.css">
        <style type="text/css">
        td{
          width:900px;
        }
        table{
          width:auto;
        }
        </style>
        <script type="text/javascript">
        //チェックしtrueならアラートす

        function funcConform(){
          if(!document.form1.user_Id.value.match(/^[A-Za-z0-9]+$/)){
            alert("IDは半角英数字で入力してください");
            return false;
          }
          if(document.form1.user_name.value==""){
            alert("氏名が入力されていません");
            return false;
          }
          if(!document.form1.user_password1.value.match(/^[\x20-\x7E]+$/)){
            alert("パスワードは半角英数字で入力してください");
            return false;
          }
          if(document.form1.user_password1.value!=document.form1.user_password2.value){
              alert("確認用パスワードと一致しません");
              return false;
          }
        }
        </script>
    </head>
    <body>
      <h1>新規登録</h1>
      <div class="main">
        <h2>新規ユーザー</h2>
        <form name="form1" action="add.jsp" method="post"
           onsubmit="funcConform()">
          <table>
            <tr>
              <td>ID</td>
              <td><input type="text" name="user_Id" size="50"></td>
            </tr>
            <tr>
              <td>氏名</td>
              <td><input type="text" name="user_name" size="50"></td>
            </tr>
            <tr>
              <td>Email-Address</td>
              <td><input type="text" name="user_email" size="50"></td>
            </tr>
            <tr>
              <td>ユーザーレベル</td>
              <td>
                <select name="user_level">
                  <option value="0" selected>利用者
                  <option value="1">司書
                  <option value="2">システム管理者
                  </option>
                </select>
              </td>
            </tr>
            <tr>
              <td>パスワード</td>
              <td><input type="password" name="user_password1" size="50"></td>
            </tr>
            <tr>
              <td>パスワードの確認</td>
              <td><input type="password" name="user_password2" size="50"></td>
            </tr>
          </table>
          <p>
            <input type="submit" value="送信">
            <input type="button" value="戻る" onclick="history.back()">
          </p>
        </form>
      </div>
    </body>
  </html>
