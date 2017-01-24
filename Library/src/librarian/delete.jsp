<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="library.*"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Librarian" id="userEdit" scope="session"/>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout");
  return;
}
BookList booklist = new BookList();
booklist.Load();
String[] arytype={"小説","漫画","参考書","辞書"};
%>
<html>
<head>
<title>削除</title>
<link rel="stylesheet" type="text/css" href="../style.css">
  <script type="text/javascript">
    function funcDelete(){
      if(confirm("削除します。よろしいですか？"));
      location.href="delete_confirm.jsp";
    }
  </script>
</head>
<body>
  <h1>削除</h1>
  <div class="main">
    <h2>図書リスト</h2>
    <form name="form1" action="delete_confirm.jsp" method="post"
      onsubmit="return funcDelete()">
    <table>
    <tr>
      <th>チェック</th>
      <th>本のID</th>
      <th>本の名前</th>
      <th>著者</th>
      <th>出版社</th>
      <th>出版日</th>
      <th>分類</th>
    </tr>
    <%while(booklist.hasNext()){
      Librarian albook = booklist.getNext();
      %>
    <tr>
      <td><input type="checkbox" name="checkbox" value=チェック></td>
      <td class="center"><%=albook.getIntId()%></td>
      <td><%=albook.getStrBook()%></td>
      <td><%=albook.getStrWriter()%></td>
      <td><%=albook.getStrCompany()%></td>
      <td><%=albook.getStrDate()%></td>
      <td><%=arytype[albook.getIntType()]%></td>
    </tr>
    <%}%>
  </table>
  <p>
    <input type="submit" value="削除">
    <input type="button" value="戻る" onclick="javascript:history.back()">
  </p>
</form>
  </div>
</body>
</html>
