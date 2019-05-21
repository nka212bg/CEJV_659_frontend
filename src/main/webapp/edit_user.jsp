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
                    <div>
                        <i onclick="sessionManager().deleteUser()" class="icon a text-orange bg-light-blue border_radius" style="position: absolute; font-size: 1.5em; padding: 5px;margin: 5px;z-index: 2" title="Delete user"></i>
                        <img class="user-logo box-shadow" src="" 
                             onerror="this.src='./resources/img/logo.jpg'" style="width: 150px; height: 150px;"/>
                    </div>
                </div>

                <br>


                <form id="edit_user" onsubmit="event.preventDefault(), formManager(this).setData('http://nkatanasov.ca:85/CEJV__659_backend/api/user/edit_user/' + sessionManager().getSessionId()).then((e) => {
                            sessionManager().setUser(e);
                        })">
                    <input type="text" class="input box-shadow" name="user_name" placeholder=" User Full Name" />
                    <br>
                    <input type="text" class="input box-shadow" name="user_avatar" placeholder=" Avatar (URL / any image format)" />
                    <br>
                    <input type="password"  class="input box-shadow" name="user_password" placeholder=" Password (Only if is needed.)"/>
                    <br>
                    <input type="password" class="input box-shadow" name="confirm_user_password" placeholder=" Confirm Password" />

                    <div class="space-between">
                        <div></div>
                        <button class="button margin-v-20 box-shadow" style="width: 150px">Edit</button>
                    </div>

                </form>
            </div>
        </div>




        <!--footer -------------->
        <jsp:include page="./includes/footer.jsp" />
        <script>

            document.forms["edit_user"].user_avatar.onblur = () => {
                document.querySelectorAll(".user-logo").forEach((e) => {
                    e.src = document.forms["edit_user"].user_avatar.value;
                });
            }

            var form = document.forms["edit_user"];
            ajax('http://nkatanasov.ca:85/CEJV__659_backend/api/user/get_user/' + sessionManager().getSessionId()).then((e) => {
                e = JSON.parse(e);
                console.log(e);
                form["user_name"].value = e.user_name;
                form["user_avatar"].value = e.user_avatar;
                document.querySelectorAll(".user-logo").forEach((e) => {
                    e.src = document.forms["edit_user"].user_avatar.value;
                });


            });


        </script>
    </body>
</html>
