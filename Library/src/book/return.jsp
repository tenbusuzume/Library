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
    <title>�ԋp���X�g</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>�ԋp���X�g</h1>
    <div class="main">
      <h2>�ꗗ</h2>
      <table>
        <tr>
          <th>����</th>
          <th>�{�̖��O</th>
          <th>����</th>
          <th>�o�Ŏ�</th>
          <th>�o�œ�</th>
          <th>����</th>
          <th>�{��ID</th>
        </tr>
        <%while(booklist.hasNext()){
          Librarian albook = booklist.getNext();
          %>
        <tr>
          <td class="center"><A href="return_confirm.jsp?id=<%=albook.getIntId()%>">�ԋp</A></td>
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
        <input type="button" value="�߂�" onclick="history.back()">
      </p>
    </div>
  </body>
</html>
