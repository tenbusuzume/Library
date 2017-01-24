<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
%>
<html>
  <head>
    <title>図書の新規登録</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
      <script type="text/javascript">
      function funcConfirm(){
        if(document.form1.strbook.value==""){
          alert("名前が空白です");
          return false;
        }
        if(document.form1.strwriter.value==""){
          alert("著者が空白です");
          return false;
        }
        if(document.form1.strcompany.value==""){
          alert("出版社が空白です");
          return false;
        }
        if(!document.form1.strdate.value.match(/^\d{4}\/\d{2}\/\d{2}$/)){
          alert("出版日の記入が不適切です");
          return false;
        }
      }
      </script>
  </head>
  <body>
    <h1>図書の新規登録</h1>
    <div class="main">
      <form name="form1" action="new_confirm.jsp" method="post"
         onsubmit="return funcConfirm()">
      <table>
        <tr>
          <td>名前</td>
          <td><input type="text" name="strbook" size="60"></td>
        </tr>
        <tr>
          <td>著者</td>
          <td><input type="text" name="strwriter" size="60"></td>
        </tr>
        <tr>
          <td>出版社</td>
          <td><input type="text" name="strcompany" size="60"></td>
        </tr>
        <tr>
          <td>出版日</td>
          <td><input type="text" name="strdate" size="60"></td>
        </tr>
        <tr>
          <td>分類</td>
          <td>
          <select name="inttype">
            <option value="1" selected>分類選択
            <option value="1">小説
            <option value="2">漫画
            <option value="3">参考書
            <option value="4">辞書
            </option>
          </select>
        </td>
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
