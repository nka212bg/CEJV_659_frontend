<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <!--header -------------->
    <jsp:include page='./includes/header.jsp'>
        <jsp:param name="title" value="Vinyl Shelf | Login"/>
    </jsp:include>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>

    <body class="page bg-image">
        <div class="padding-30">
            <div class="padding-30" style="width: 350px;">
                <h1 class="title_text capitalize">vinyl shelf</h1>
                <span class="subtitle_text capitalize">Personal vinyl collection organiser</span>
                <br/>

            </div>
            <div class="padding-30" style="width: 350px;">
                <h1 class="text-blue capitalize" style="line-height: 0">login</h1>
                <span class="text-blue capitalize">enter your login credentials</span>
                <br/> <br/>
                <form id="login" method="POST" action="Login?login">
                    <input type="text" class="input box-shadow" name="email" placeholder=" Email" />
                    <br>

                    <input type="password"  class="input box-shadow" name="password" placeholder=" Password"/>

                    <div class="space-between">
                        <a href="register.jsp" class="a text-light-blue">Register</a>
                        <button class="button margin-v-20 box-shadow" name="login" value="login" style="width: 150px">Login</button>
                    </div>

                </form>
            </div>
        </div>



        <div style="position: absolute; top: 0; right: 0; margin: 20px">
            <i class="icon a" title="contact us"></i>
            <i class="icon a margin-h-20" title="feedback"></i>
            <i class="icon a" title="FAQ"></i>
        </div>

        <!--footer -------------->
        <div style="position: fixed; bottom: 0; right: 0"><jsp:include page="./includes/footer.jsp" /></div>
    </body>
</html>
