<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="library.*"%>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Librarian" id="librarian" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
BookList booklist = new BookList();
booklist.Load();
String[] arytype={"����","����","�Q�l��","����"};
%>
<html>
<head>
<title>�}���Ǘ�</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
  <h1>�}���Ǘ�</h1>
  <div class="main">
    <h2>�}�����X�g</h2>
    <table>
    <tr>
      <th>�{��ID</th>
      <th>�{�̖��O</th>
      <th>����</th>
      <th>�o�Ŏ�</th>
      <th>�o�œ�</th>
      <th>����</th>
      <th>�ҏW</th>
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
      <td class="center"><A href="edit.jsp?id=<%=albook.getIntId()%>">�ҏW</A></td>
    </tr>
    <%}%>
  </table>
  <p>
    <A href="new.jsp">�V�K�o�^</A>
    <A href="javascript:history.back()">�߂�</A>
    <A href="delete.jsp">�폜</A>
  </p>
  </div>
</body>
</html>
