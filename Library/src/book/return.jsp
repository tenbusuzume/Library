<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="library.*"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Librarian" id="bookEdit" scope="session"/>
<jsp:useBean class="library.BookList" id="list" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
request.setCharacterEncoding("Windows-31J");
String strNow = request.getParameter("id");
int intNow = Integer.parseInt(strNow);
BookList booklist = new BookList();
booklist.ReturnList(intNow);
%>
<html>
  <head>
    <title>返却リスト</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>返却リスト</h1>
    <div class="main">
      <h2>一覧</h2>
      <table>
        <tr>
          <th>操作</th>
          <th>本の名前</th>
          <th>著者</th>
          <th>出版社</th>
          <th>出版日</th>
          <th>分類</th>
          <th>本のID</th>
        </tr>
        <%while(booklist.hasNext()){
          Librarian albook = booklist.getNext();
          %>
        <tr>
          <td class="center"><A href="return_confirm.jsp?id=<%=albook.getIntId()%>">返却</A></td>
          <td><%=albook.getStrBook()%></td>
          <td><%=albook.getStrWriter()%></td>
          <td><%=albook.getStrCompany()%></td>
          <td><%=albook.getStrDate()%></td>
          <td><%=albook.getIntType()%></td>
          <td><%=albook.getIntId()%></td>
        <%}%>
        </tr>
      </table>
      <p>
        <input type="button" value="戻る" onclick="history.back()">
      </p>
    </div>
  </body>
</html>
