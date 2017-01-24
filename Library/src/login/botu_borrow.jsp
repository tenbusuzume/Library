<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="library.*"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Librarian" id="bookEdit" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
BookList booklist = new BookList();
booklist.Load();
String[] arytype={"����","����","�Q�l��","����"};
String[] statustype={"��","�~"};
%>
<html>
  <head>
    <title>�ݏo���X�g</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h1>�ݏo���X�g</h1>
    <div class="main">
      <table>
        <tr>
          <th>�{��ID</th>
          <th>�{�̖��O</th>
          <th>����</th>
          <th>�o�Ŏ�</th>
          <th>�o�œ�</th>
          <th>����</th>
          <th>������</th>
          <th>�ݏo</th>
        </tr>
        <%while(booklist.hasNext()){
          Librarian albook = booklist.getNext();
          %>
        <tr>
          <td class="center"><%=albook.getIntId()%></td>
          <td><%=albook.getStrBook()%></td>
          <td><%=albook.getStrWriter()%></td>
          <td><%=albook.getStrCompany()%></td>
          <td><%=albook.getStrDate()%></td>
          <td><%=arytype[albook.getIntType()]%></td>
          <td><%=albook.getStrRGS_Date()%></td>
          <td><%=statustype[albook.getIntStatus()]%></td>
        </tr>
        <%}%>
      </table>
      <p>
        <input type="submit" value="�؂��">
        <input type="button" value="�߂�" onclick="history.back()">
      </p>
    </div>
  </body>
</html>
