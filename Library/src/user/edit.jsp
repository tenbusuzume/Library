<%@ page contentType="text/html; charset=Windows-31J"%>
<jsp:useBean class="library.User" id="user" scope="session"/>
<jsp:useBean class="library.User" id="userEdit" scope="session"/>
<jsp:useBean class="library.Message" id="message" scope="session"/>
<%
 if(user.getName()==null){
   response.sendRedirect("../login/session_timeout.jsp");
   return;
  }
  String strUserId = request.getParameter("id");
  int intUserId = Integer.parseInt(strUserId);
  String strMessage = userEdit.Load(intUserId);
  if(strMessage!=null){
    message.setMessage(strMessage);
    response.sendRedirect("error.jsp");
  }
  %>
  <html>
    <head>
      <title>ユーザー管理</title>
      <link rel="stylesheet" type="text/css" href="../style.css">
        <script type="text/javascript">
        function funcConfirm(){
          if(!document.form1.strUser_Id.value.match(/^[A-Za-z0-9]+$/)){
            alert("IDは半角英数字で入力してください");
            return false;
          }
          if(document.form1.strName.value==""){
            alert("氏名が入力されていません");
            return false;
          }
          if(!document.form1.strEmail.value.match(/^[A-Za-z0-9@\.]+$/)){
            alert("Emailは半角英数字で入力してください");
            return false;
          }
          if(document.form1.password1.value!=document.form1.password2.value){
            alert("パスワードが一致しません")
            return false;
          }
        }
        function funcPasswordChange(){
          if(document.form1.password_change.checked==true){
            document.form1.password1.disabled=false;
            document.form1.password1.value="";
            document.form1.password2.disabled=false;
            document.form1.password2.value="";
          }else{
            document.form1.password1.disabled=true;
            document.form1.password1.value="*******";
            document.form1.password2.disabled=true;
            document.form1.password2.value="*******";
          }
        }
        function funcDelete(){
          if(confirm("削除します。よろしいですか？")){
            location.href="delete.jsp";
          }
        }
        </script>
    </head>
    <body>
      <h1>ユーザー管理</h1>
    
      <div class="main">
        <h2>ユーザー編集</h2>
        <form name="form1" action="update.jsp" method="post" onsubmit="return funcConfirm()">
          <table>
            <tr>
              <td>ID</td>
              <td><input type="text" name="strUser_Id" size="20" value="<%=userEdit.getId()%>"</td>
            </tr>
            <tr>
              <td>氏名</td>
              <td><input type="text" name="strUser_Name" size="20" value="<%=userEdit.getName()%>"</td>
            </tr>
            <tr>
              <td>Email</td>
              <td><input type="text" name="strUser_Email" size="20" value="<%=userEdit.getEmail()%>"</td>
            </tr>
            <tr>
              <td>ユーザーレベル</td>
              <td>
                <select name="user_level">
                <option value="0" <%if(userEdit.getLevel()==0){%>selected<%}%>>利用者
                <option value="1" <%if(userEdit.getLevel()==1){%>selected<%}%>>司書
                <option value="2" <%if(userEdit.getLevel()==2){%>selected<%}%>>システム管理者
                </select>
              </td>
            </tr>
          </table>
          <br>
            <table>
              <tr>
                <td colspan="2">
                  <input type="checkbox" name="password_change" onclick="funcPasswordChange()">
                    パスワードを変更
                </td>
              </tr>
              <tr>
                <td>パスワード</td>
                <td><input type="password" name="password1" size="20"
                  value="*******" disable></td>
              </tr>
              <tr>
                <td>パスワード（確認）</td>
                <td><input type="password" name="password2" size="20"
                  value="*******" disable></td>
              </tr>
            </table>
            <p>
              <input type="submit" value="送信">
              <input type="button" value="戻る" onclick="history.back()">
              <input type="button" value="削除" onclick="funcDelete()">
            </p>
        </form>
      </div>
    </body>
  </html>
