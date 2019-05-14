<%@page pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!--Header MENU-->


<c:choose>
    <c:when test="${not empty sessionScope.user_id}">

        <div class="space-between vertica-align-flex padding-30" style="margin-bottom: 50px;">
            <!--left menu-->
            <div class="space-between vertica-align-flex" style="">
                <img id="menu_logo_image" src="${pageContext.request.contextPath}/service_portal_data/users/${sessionScope.user_id}/logo.jpg" class="user-logo"  
                     onerror="this.src='${pageContext.request.contextPath}/service_portal_data/users/logo.jpg'" />

                <a href="${pageContext.request.contextPath}/index.jsp" class="margin-left home_menu a homeLink" ><i class="icon"></i> <span class="capitalize" i18n="home"></span></a>
                <a href="${pageContext.request.contextPath}/services.jsp" class="margin-left home_menu a" ><i class="icon"></i> <span class="capitalize" i18n="services"></span></a>
                <a href="${pageContext.request.contextPath}/profile.jsp" class="margin-left home_menu a" ><i class="icon"></i> <span class="capitalize" i18n="profile"></span></a>
            </div>
            <!--right menu-->
            <div class="vertica-align-flex">
                <select id="set_lang" class="a set_lang" onclick="set_locale()">
                    <option value=""  selected disabled hidden></option>
                    <option value="en-US">en</option>
                    <option value="fr-CA">fr</option>
                    <option value="bg-BG">bg</option>
                </select>
                <a href="${pageContext.request.contextPath}/Login?logout" onclick="document.cookie = 'redirectUrl=; expires=Thu, 01 Jan 1970 00:00:01 GMT;'" class="a hover-button first_upper" i18n="logout"></a>

            </div>
        </div> 

        <script>
            'use strict';
            //*session timeout tracker ------------*/
            var sessionLastAccessedTime = parseInt("${pageContext.session.lastAccessedTime}");
            var sessionExpireInterval = parseInt("${pageContext.session.maxInactiveInterval * 1000}");
            var sessionExpireTime = Math.floor((sessionLastAccessedTime + sessionExpireInterval) / 1000);
            var session_window = '<div id="session_restore" class="profile-menu padding-30" style="z-index: 10000;"><div class="bg-gradient-radial" style="position: fixed;"></div><div class="mid-div" style="position: fixed"><div class="card-base mid-div" style="width: 350px; background: white ;font-family: \'Open Sans\', sans-serif; padding: 20px"><div class="space-between"  style="margin-top: -20px"><h1 class="first_upper" style="color:darkgrey">session expired</h1><i onclick="window.location.replace(\'${pageContext.request.contextPath}/index.jsp\')" style="font-size: 200%" class="icon a"></i></div><div> would you like to restore it?<input class="input" type="password" id="password" placeholder="password"/></div><div class="space-between" style="margin-top: 10px"><span id="session_renew"  onclick="session_restore()" class="button box-shadow">Continue</span></div><br><span onclick="window.location.replace(\'${pageContext.request.contextPath}/login.jsp\')" class="a">I am another user</span></div></div></div>';
            var interval;
            interval = setInterval(() => {
                session_interval();
            }, 1000);

            function  session_interval() {
                var currentTime = Math.floor(new Date().getTime() / 1000);
                if (currentTime > sessionExpireTime) {
                    clearInterval(interval);
                    document.body.insertAdjacentHTML("afterend", session_window);
                    document.body.style.filter = "blur(4px)";
                }
            }

            function session_restore() {
//                return new Promise((resolve, reject) => {
//                    const xhr = new XMLHttpRequest();
//                    xhr.open('POST', 'Login');
//                    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
//                    xhr.onload = () => resolve(xhr.responseText);
//                    xhr.onerror = () => reject(xhr.statusText);
//                    xhr.send('login&p=' + document.getElementById("password").value + '&e=${sessionScope.email}');
//                })

                ajax('Login?login&p=' + document.getElementById("password").value + '&e=${sessionScope.email}').then((result) => {
                    result = JSON.parse(result);
                    if (result.status === "ok") {
                        var sessionLastAccessedTime = parseInt(result.lastAccessed);
                        var sessionExpireInterval = parseInt("${pageContext.session.maxInactiveInterval * 1000}");
                        sessionExpireTime = Math.floor((sessionLastAccessedTime + sessionExpireInterval) / 1000);

                        document.body.removeAttribute("style");
                        $("#session_restore").fadeOut(800, function () {
                            $(this).remove();
                        });

                        getSystemMessage("good", "<b>Success!</b><br>The session is restored");
                        interval = setInterval(() => {
                            session_interval();
                        }, 1000);
                    }
                    if (result.status === "wrong_password") {
                        getSystemMessage("bad", "<b>Unsuccess!</b><br>This password is wrong");
                    }
                    if (result.status === "blocked_user") {
                        getSystemMessage("bad", "<b>Unsuccess!</b><br>This user is blocked, pleace check your email for new password");
                    }
                });
            }
        </script>

    </c:when>

    <c:otherwise>
        <c:if test="${!pageContext.request.servletPath.equals('/index.jsp')}">
            <script>
                document.cookie = "redirectUrl=" + window.location.href;
                window.location.replace("${pageContext.request.contextPath}/login.jsp");
            </script>
        </c:if>

        <div class="space-between vertica-align-flex padding-30" style="margin-bottom: 50px;">
            <!--left menu-->
            <img src="${pageContext.request.contextPath}/resources/img/logo_big.png"  style="height: 50px"/>
            <!--right menu-->
            <div class="vertica-align-flex">
                <select id="set_lang" class="a set_lang" onclick="set_locale()">
                    <option value=""  selected disabled hidden></option>
                    <option value="en-US">en</option>
                    <option value="fr-CA">fr</option>
                    <option value="bg-BG">bg</option>
                </select>
                <a href="${pageContext.request.contextPath}/login.jsp" class="a hover-button first_upper" i18n="login"></a>
                <a href="${pageContext.request.contextPath}/register.jsp" class="a hover-button first_upper" i18n="register"></a>
            </div>
        </div>
    </c:otherwise>
</c:choose>







