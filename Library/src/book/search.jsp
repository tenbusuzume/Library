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
request.setCharacterEncoding("Windows-31J");
String strName = request.getParameter("search");
String strType = request.getParameter("inttype");
int intType = Integer.parseInt(strType);
BookList booklist = new BookList();
booklist.setName(strName);
if(intType==4){
  String strMessage=booklist.allSearch(strName);
}else{
  String strMessage=booklist.search(strName,intType);
}
String[] arytype={"����","����","�Q�l��","����"};
%>
<html>
<head>
<title>�}�����X�g</title>
<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
  <h1>�}�����X�g</h1>
  <div class="main">
    <h2>��������</h2>
    <%if(booklist.getSize()>=1){%>
    <table>
    <tr>
      <th>�ݏo</th>
      <th>�{��ID</th>
      <th>�{�̖��O</th>
      <th>����</th>
      <th>�o�Ŏ�</th>
      <th>�o�œ�</th>
      <th>����</th>
      <%if(user.getLevel()>=1){%>
        <th>�}���ْ�����</th>
        <th>�ҏW</th>
      <%}%>
    </tr>
    <%while(booklist.hasNext()){
      Librarian albook = booklist.getNext();
      %>
    <tr>
      <%if(albook.getIntStatus()==0){%>
      <td class="center"><A href="../book/borrow.jsp?id=<%=albook.getIntId()%>">�؂��</A></td>
      <%}else{%>
      <td class="center"><input type="button" value="�ݏo��"></td>
      <%}%>
      <td class="center"><%=albook.getIntId()%></td>
      <td><%=albook.getStrBook()%></td>
      <td><%=albook.getStrWriter()%></td>
      <td><%=albook.getStrCompany()%></td>
      <td><%=albook.getStrDate()%></td>
      <td><%=arytype[albook.getIntType()]%></td>
      <%if(user.getLevel()>=1){%>
      <td><%=albook.getStrRGS_Date()%></td>
      <td class="center"><A href="../librarian/edit.jsp?id=<%=albook.getIntId()%>">�ҏW</A></td>
      <%}%>
    </tr>
    <%}%>
  </table>
  <%}else{%>
  <table>
    <tr>
      <td>
        �Y������{�͂���܂���B
      </td>
    </tr>
  </table>
    <%}%>
  <p>
    <input type="button" value="�߂�" onclick="history.back()">
  </p>
  </div>
</body>
</html>
