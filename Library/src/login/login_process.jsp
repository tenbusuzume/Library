<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<%
String strUser_Id = request.getParameter("user_Id");
String strPassword = request.getParameter("user_password1");
String strMessage = user.Login(strUser_Id,strPassword);
%>
<html>
  <head>
    <title>���O�C��</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <div class="main">
      <p>
  <!--Login���\�b�h�̖߂�l�̒��g��null�Ȃ�o�^����-->
        <%if(strMessage==null){%>
        ����ɂ���<%=user.getName()%>����<br>
        <A href="top2.jsp">�g�b�v�y�[�W</A>�ֈړ�
        <%}else{%>
  <!--null�łȂ���΃G���[�����\�����ꖢ�o�^-->
        <%=strMessage%><br>
        <A href="first.jsp">�߂�</A>
        <%}%>
      </p>
    </div>
  </body>
</html>
