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
String[] arytype={"����","����","�Q�l��","����"};
%>
<html>
<head>
<title>�폜</title>
<link rel="stylesheet" type="text/css" href="../style.css">
  <script type="text/javascript">
    function funcDelete(){
      if(confirm("�폜���܂��B��낵���ł����H"));
      location.href="delete_confirm.jsp";
    }
  </script>
</head>
<body>
  <h1>�폜</h1>
  <div class="main">
    <h2>�}�����X�g</h2>
    <form name="form1" action="delete_confirm.jsp" method="post"
      onsubmit="return funcDelete()">
    <table>
    <tr>
      <th>�`�F�b�N</th>
      <th>�{��ID</th>
      <th>�{�̖��O</th>
      <th>����</th>
      <th>�o�Ŏ�</th>
      <th>�o�œ�</th>
      <th>����</th>
    </tr>
    <%while(booklist.hasNext()){
      Librarian albook = booklist.getNext();
      %>
    <tr>
      <td><input type="checkbox" name="checkbox" value=�`�F�b�N></td>
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
    <input type="submit" value="�폜">
    <input type="button" value="�߂�" onclick="javascript:history.back()">
  </p>
</form>
  </div>
</body>
</html>
