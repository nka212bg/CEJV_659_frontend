<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <!--header -------------->
    <jsp:include page='./includes/header.jsp'>
        <jsp:param name="title" value="Vinyl Shelf | Edit user"/>
    </jsp:include>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
      <body class="page bg-image">

        <!--header menu -------------->
        <jsp:include page="./includes/header_menu.jsp" />

  
        <div class="padding-30">
            <div class="padding-30" style="width: 350px;">
                <h1 class="text-blue capitalize" style="line-height: 0">edit profile</h1>
                <span class="text-blue capitalize">enter your new credentials</span>
                <br/> <br/>
                <form id="login" method="POST" action="Login?login">
                    <input type="text" class="input box-shadow" name="email" placeholder=" Email" />
                    <br>
                    <input type="text" class="input box-shadow" name="name" placeholder=" User Full Name" />
                    <br>
                    <input type="text" class="input box-shadow" name="avatar" placeholder=" Avatar (URL)" />
                    <br>
                    <input type="password"  class="input box-shadow" name="password" placeholder=" Password (Only if is needed.)"/>
                    <br>
                    <input type="password" class="input box-shadow" name="confirm_password" placeholder=" Confirm Password" />

                    <div class="space-between">
                        <a></a>
                        <button class="button margin-v-20 box-shadow" name="edit" value="edit" style="width: 150px">Edit</button>
                    </div>

                </form>
            </div>
        </div>




        <!--footer -------------->
        <div style="position: fixed; bottom: 0; right: 0"><jsp:include page="./includes/footer.jsp" /></div>
    </body>
</html>
