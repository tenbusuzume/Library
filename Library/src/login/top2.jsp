<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="library.*"%>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.Librarian" id="librarian" scope="session"/>
<%
String strUser_Id = request.getParameter("user_Id");
String strPassword = request.getParameter("user_password1");
String strMessage = user.Login(strUser_Id,strPassword);
BookList booklist = new BookList();
booklist.Load();

BookList returnBookList = new BookList();
returnBookList.getMyReturnBook(user.getid());

String[] arytype={"����","����","�Q�l��","����"};
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
%>
<html>
<head>
<title>�}���Ǘ�</title>
<link rel="stylesheet" type="text/css" href="../style.css">
  <script type="text/javascript">
  function funcCheck(){
    if(!document.form1.inttype.value==4){
      if(document.form1.search.value==""){
        alert("�󔒂ł�");
        return false;
    }
    }
  }
  </script>
</head>
<body>
  <h1>�}���Ǘ�</h1>
  <div style="text-align:left;background-color:#A6E3E9">
    �悤�����A
    <%if(user.getLevel()==2){%>
      �Ǘ��ҁz��<%=user.getName()%>����
    <%}else if(user.getLevel()==1){%>
      �y�i���z��<%=user.getName()%>����
    <%}else{%>
      <%=user.getName()%>����
    <%}%>
    </div>
  <div style="text-align : left; background-color:#A6E3E9">
    <%
      while(returnBookList.hasNext()){
      Librarian returnBook = returnBookList.getNext();
    %>
    <%if(returnBook.getIntDatediff()>=2){%>
      <font color="yellow">
        <%=returnBook.getStrBook()%>�́A����<%=returnBook.getIntDatediff()%>���ŕԋp�����ł��B<br />
      </font>
    <%}else{%>
    <font color="red">
      <%=returnBook.getStrBook()%>�́A����<%=returnBook.getIntDatediff()%>���ŕԋp�����ł��B<br />
    </font>
    <%}%>
    <%}%>
  </div>
  <div class="main">
    <h2>�}�����X�g</h2>
    <table>
    <tr>
      <th>�ݏo</th>
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
  <form name="form1" method="post" action="../book/search.jsp"
    onsubmit="return funcCheck()">
  <p>
    <%if(user.getLevel()==2){%>
      <A href="../user/list.jsp">���[�U�[�Ǘ�</A>
    <%}%>
    <A href="../book/return.jsp?id=<%=user.getid()%>">�Ԃ�</A>
    <%if(user.getLevel()>=1){%>
      <A href="../librarian/new.jsp">�V�K�o�^</A>
    <%}%>
    <%if(user.getLevel()>=1){%>
    <A href="../book/delete.jsp">�폜</A>
    <%}%>
    |
    <select name="inttype"�@style="margin-left:100px;">
      <option value="4" selected>���ׂ�
      <option value="0">����
      <option value="1">����
      <option value="2">�Q�l��
      <option value="3">����
      </option>
    </select>
    <input type="text" name="search">
    <input type="submit" value="����">
      <A href="../login/logout.jsp">���O�A�E�g</A>
    </p>
</form>
  </div>
</body>
</html>
