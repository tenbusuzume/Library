<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<html>
  <head>
    <title>���O�C��</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>���O�C��</h1>
    <div class="main">
      <form action="top2.jsp" method="post">
        <table>
          <!--�ݒ肵��ID�ƃp�X���[�h�����-->
          <tr>
            <td>ID</td>
            <td><input type="text" name="user_Id" size="30"></td>
          </tr>
          <tr>
            <td>�p�X���[�h</td>
            <td><input type="password" name="user_password1" size="30"></td>
          </tr>
        </table>
        <p>
          <input type="submit" value="���M">
        </p>
      </form>
    </div>
  </body>
</html>
