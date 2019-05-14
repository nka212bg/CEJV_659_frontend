<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <!--header -------------->
    <jsp:include page='./includes/header.jsp'>
        <jsp:param name="title" value="Vinyl Shelf | Register"/>
    </jsp:include>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>

    <body class="page bg-image">
        <div class="padding-30">
            <div class="padding-30" style="width: 350px;">
                <h1 class="title_text capitalize">vinyl shelf</h1>
                <span class="subtitle_text capitalize">Personal vinyl collection organiser</span>
                <br/>

            </div>
            <div class="padding-30" style="width: 350px;">
                <h1 class="text-blue capitalize" style="line-height: 0">Register</h1>
                <span class="text-blue capitalize">enter your credentials</span>
                <br/> <br/>
                <form id="login" method="POST" action="Login?login">
                    <input type="text" class="input" name="email" placeholder=" Email" />
                    <br>
                    <input type="text" class="input" name="name" placeholder=" User Full Name" />
                    <br>
                    <input type="password"  class="input" name="password" placeholder=" Password"/>
                    <br>
                    <input type="password" class="input" name="confirm_password" placeholder=" Confirm Password" />

                    <div class="space-between">
                        <a href="login.jsp" class="a text-light-blue">Login</a>
                        <button class="button margin-v-20 box-shadow" name="register" value="register" style="width: 150px">Register</button>
                    </div>

                </form>
            </div>
        </div>




        <!--footer -------------->
        <div style="position: fixed; bottom: 0; right: 0"><jsp:include page="./includes/footer.jsp" /></div>
    </body>
</html>
