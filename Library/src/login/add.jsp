<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="userEdit" scope="page"/>
<%

//new_user����̒l���擾��
request.setCharacterEncoding("Windows-31J");
String strUser_Id = request.getParameter("user_Id");
String strName = request.getParameter("user_name");
String strEmail = request.getParameter("user_email");
String strPassword = request.getParameter("user_password1");
int level = 0;
//userEdit�ɃZ�b�g
userEdit.setId(strUser_Id);
userEdit.setName(strName);
userEdit.setEmail(strEmail);
userEdit.setLevel(level);
//Add���\�b�h�����s
String strMessage=userEdit.Add(strPassword);
%>
<html>
  <head>
    <title>�V�K�o�^</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <body>
    <h2>�V�K�o�^</h2>
    <div class="main">
      <p>
<!--ADD���\�b�h�̖߂�l�̒��g��null�Ȃ�o�^����-->
      <%if(strMessage==null){%>
        �o�^���������܂���<br />
        <A href="../login/login_form.jsp">���O�C�����</A>
      <%}else{%>
<!--null�łȂ���΃G���[�����\�����ꖢ�o�^-->
      <%=strMessage%><br>
      <A href="javascript:history.back()">�߂�</A>
      <%}%>
    </p>
    </div>
  </body>
</html>
