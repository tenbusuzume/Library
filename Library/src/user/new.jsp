<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<%
if(user.getName()==null){
  response.sendRedirect("../login/session_timeout.jsp");
  return;
}
%>
  <html>
    <head>
      <title>�V�K�o�^</title>
      <link rel="stylesheet" type="text/css" href="../style.css">
        <style type="text/css">
        td{
          width:900px;
        }
        table{
          width:auto;
        }
        </style>
        <script type="text/javascript">
        //�`�F�b�N��true�Ȃ�A���[�g��

        function funcConform(){
          if(!document.form1.user_Id.value.match(/^[A-Za-z0-9]+$/)){
            alert("ID�͔��p�p�����œ��͂��Ă�������");
            return false;
          }
          if(document.form1.user_name.value==""){
            alert("���������͂���Ă��܂���");
            return false;
          }
          if(!document.form1.user_password1.value.match(/^[\x20-\x7E]+$/)){
            alert("�p�X���[�h�͔��p�p�����œ��͂��Ă�������");
            return false;
          }
          if(document.form1.user_password1.value!=document.form1.user_password2.value){
              alert("�m�F�p�p�X���[�h�ƈ�v���܂���");
              return false;
          }
        }
        </script>
    </head>
    <body>
      <h1>�V�K�o�^</h1>
      <div class="main">
        <h2>�V�K���[�U�[</h2>
        <form name="form1" action="add.jsp" method="post"
           onsubmit="funcConform()">
          <table>
            <tr>
              <td>ID</td>
              <td><input type="text" name="user_Id" size="50"></td>
            </tr>
            <tr>
              <td>����</td>
              <td><input type="text" name="user_name" size="50"></td>
            </tr>
            <tr>
              <td>Email-Address</td>
              <td><input type="text" name="user_email" size="50"></td>
            </tr>
            <tr>
              <td>���[�U�[���x��</td>
              <td>
                <select name="user_level">
                  <option value="0" selected>���p��
                  <option value="1">�i��
                  <option value="2">�V�X�e���Ǘ���
                  </option>
                </select>
              </td>
            </tr>
            <tr>
              <td>�p�X���[�h</td>
              <td><input type="password" name="user_password1" size="50"></td>
            </tr>
            <tr>
              <td>�p�X���[�h�̊m�F</td>
              <td><input type="password" name="user_password2" size="50"></td>
            </tr>
          </table>
          <p>
            <input type="submit" value="���M">
            <input type="button" value="�߂�" onclick="history.back()">
          </p>
        </form>
      </div>
    </body>
  </html>
