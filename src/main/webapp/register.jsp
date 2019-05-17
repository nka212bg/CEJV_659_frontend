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

    <body class="page bg-image">
        <div class="padding-30">
            <div class="padding-30" style="width: 350px;">
                <h1 class="title_text capitalize">vinyl shelf</h1>
                <span class="subtitle_text capitalize">Personal vinyl collection organiser</span>
                <br/>

            </div>

            <div class="padding-30" style="width: 350px;">

                <div class="space-between">
                    <div>
                        <h1 class="text-blue capitalize" style="line-height: 0">create profile</h1>
                        <span class="text-blue capitalize">enter your credentials</span>
                    </div>

                    <img class="user-logo box-shadow" src="${pageContext.request.contextPath}/users/${sessionScope.user_id}/logo.jpg" 
                         onerror="this.src='${pageContext.request.contextPath}/resources/img/logo.jpg'" style="width: 150px; height: 150px;"/>
                </div>

                <br>

                <form id="register" method="POST" action="http://localhost:8080/CEJV__659_backend/api/user/register">
                    <input type="text" class="input box-shadow" name="user_email" placeholder=" Email" />
                    <br>
                    <input type="text" class="input box-shadow" name="user_name" placeholder=" User Full Name" />
                    <br>
                    <input type="text" class="input box-shadow" name="user_avatar" placeholder=" Avatar (URL / any image format)" />
                    <br>
                    <input type="password"  class="input box-shadow" name="user_password" placeholder=" Password (Only if is needed.)"/>
                    <br>
                    <input type="password" class="input box-shadow" name="confirm_user_password" placeholder=" Confirm Password" />

                    <div class="space-between">
                        <a href="login.jsp" class="a text-light-blue">Login</a>
                        <button class="button margin-v-20 box-shadow" style="width: 150px">Register</button>
                    </div>

                </form>
            </div>



            <div style="position: absolute; top: 0; right: 0; margin: 20px">
                <i class="icon a" title="contact us"></i>
                <i class="icon a margin-h-20" title="feedback"></i>
                <i class="icon a" title="FAQ"></i>
            </div>

            <!--footer -------------->
            <jsp:include page="./includes/footer.jsp" />
            <script>

                document.forms["register"].user_avatar.onblur = () => {
                    console.log(document.querySelectorAll(".menu_logo_image"));
                    document.querySelectorAll(".user-logo").forEach((e) => {
                        e.src = document.forms["add_user"].user_avatar.value;
                    });
                }


            </script>
    </body>
</html>
