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
String[] statustype={"��","�~"};
%>
<html>
<head>
<title>���X�g</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
  <h1>�}���Ǘ�</h1>
  <div class="main">
    <h2>�}�����X�g</h2>
    <table>
    <tr>
      <th>����</th>
      <th>�ݏo</th>
      <th>�{�̖��O</th>
      <th>����</th>
      <th>�o�Ŏ�</th>
      <th>�o�œ�</th>
      <th>����</th>
      <th>�{��ID</th>
      <%if(user.getLevel()>=1){%>
        <th>�}���ْ�����</th>
        <th>�ҏW</th>
      <%}%>
    </tr>
    <%while(booklist.hasNext()){
      Librarian albook = booklist.getNext();
      %>
    <tr>
      <td class="center"><A href="../book/borrow.jsp?id=<%=albook.getIntId()%>">�؂��</A></td>
      <td><%=statustype[albook.getIntStatus()]%></td>
      <td><%=albook.getStrBook()%></td>
      <td><%=albook.getStrWriter()%></td>
      <td><%=albook.getStrCompany()%></td>
      <td><%=albook.getStrDate()%></td>
      <td><%=arytype[albook.getIntType()]%></td>
      <td class="center"><%=albook.getIntId()%></td>
      <%if(user.getLevel()>=1){%>
      <td><%=albook.getStrRGS_Date()%></td>
      <td class="center"><A href="../librarian/edit.jsp?id=<%=albook.getIntId()%>">�ҏW</A></td>
      <%}%>
    </tr>
    <%}%>
  </table>
  <p>
    <%if(user.getLevel()==2){%>
      <A href="../user/list.jsp">���[�U�[�Ǘ�</A>
    <%}%>
    <form name="form2" action="../book/return.jsp" method="post">
      <input type="submit" value="�Ԃ�">
    </form>
    <A href="../librarian/new.jsp">�V�K�o�^</A>
    <A href="..librarian/delete.jsp">�폜</A>
    <form name="form1" method="get" action="../book/search.jsp">
    <input type="text" name="search" style="margin-left:100px;">
    <input type="submit" value="����">
  </p>
</form>
  </div>
</body>
</html>
