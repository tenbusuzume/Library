<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="library.*"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Librarian" id="bookEdit" scope="session"/>
<jsp:useBean class="library.Message" id="message" scope="session"/>
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
<title>�}���Ǘ�</title>
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
      <th>�}���ْ�����</th>
    </tr>
    <%while(booklist.hasNext()){
      Librarian albook = booklist.getNext();
      %>
    <tr>
      <%if(albook.getIntStatus()==0){%>
      <td class="center"><A href="../book/delete_confirm.jsp?id=<%=albook.getIntId()%>">�폜</A></td>
      <%}else{%>
      <td class="center"><input type="button" value="�ݏo��"></td>
      <%}%>
      <td><%=statustype[albook.getIntStatus()]%></td>
      <td><%=albook.getStrBook()%></td>
      <td><%=albook.getStrWriter()%></td>
      <td><%=albook.getStrCompany()%></td>
      <td><%=albook.getStrDate()%></td>
      <td><%=arytype[albook.getIntType()]%></td>
      <td class="center"><%=albook.getIntId()%></td>
      <td><%=albook.getStrRGS_Date()%></td>
    </tr>
    <%}%>
  </table>
  <p>
    <A href="javascript:history.back()">�߂�</A>
  </p>
</form>
  </div>
</body>
</html>
