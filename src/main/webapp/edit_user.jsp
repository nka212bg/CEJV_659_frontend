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

                <div class="space-between">
                    <div>
                        <h1 class="text-blue capitalize" style="line-height: 0">edit profile</h1>
                        <span class="text-blue capitalize">enter your new credentials</span>
                    </div>

                    <img class="user-logo box-shadow" src="${pageContext.request.contextPath}/users/${sessionScope.user_id}/logo.jpg" 
                         onerror="this.src='${pageContext.request.contextPath}/resources/img/logo.jpg'" style="width: 150px; height: 150px;"/>
                </div>

                <br>

                <form id="edit_user" method="POST" action="Login?login">
                    <input type="text" class="input box-shadow" name="email" placeholder=" Email" />
                    <br>
                    <input type="text" class="input box-shadow" name="name" placeholder=" User Full Name" />
                    <br>
                    <input type="text" class="input box-shadow" name="avatar" placeholder=" Avatar (URL / any image format)" />
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
       <jsp:include page="./includes/footer.jsp" />
        <script>
           
            document.forms["edit_user"].avatar.onblur = () => {
                console.log(document.querySelectorAll(".menu_logo_image"));
                document.querySelectorAll(".user-logo").forEach((e) => {
                    e.src = document.forms["edit_user"].avatar.value;
                });
            }


        </script>
    </body>
</html>
