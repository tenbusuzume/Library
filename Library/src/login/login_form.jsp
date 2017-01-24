<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<html>
  <head>
    <title>ログイン</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>ログイン</h1>
    <div class="main">
      <form action="top2.jsp" method="post">
        <table>
          <!--設定したIDとパスワードを入力-->
          <tr>
            <td>ID</td>
            <td><input type="text" name="user_Id" size="30"></td>
          </tr>
          <tr>
            <td>パスワード</td>
            <td><input type="password" name="user_password1" size="30"></td>
          </tr>
        </table>
        <p>
          <input type="submit" value="送信">
        </p>
      </form>
    </div>
  </body>
</html>
