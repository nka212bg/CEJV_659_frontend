"use strict";
sessionManager().checkForUser();
function sessionManager() {
    return {
        login: (_this, event) => {
            event.preventDefault();
            var url = "http://localhost:8080/CEJV__659_backend/api/user/login";
            var data = "user_email=" + _this["user_email"].value + "&user_password=" + _this["user_password"].value;
            ajax(url, data).then((e) => {
                e = JSON.parse(e);
                if (Object.keys(e).indexOf("SessionLinker") !== -1) {
                    document.cookie = "SessionLinker=" + e.SessionLinker;
                    location.replace("./collections.jsp");
                } else {
                    getSystemMessage("bad", "<b>Unsuccess!</b><br>wrong user or password");
                }
            });
        },
        logOut: () => {
            document.cookie = 'SessionLinker=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
            location.replace("./login.jsp");
        },
        getSessionId: () => {
            var session_id = null;
            if (document.cookie.indexOf('SessionLinker=') !== -1) {
                session_id = document.cookie.replace(/(?:(?:^|.*;\s*)SessionLinker\s*\=\s*([^;]*).*$)|^.*$/, "$1").replace(/["']/g, "");
            }
            return session_id;
        },
        checkForUser: () => {
            if (!sessionManager().getSessionId()) {
                var fileName = window.location.pathname.split("/")[window.location.pathname.split("/").length - 1];
                if (fileName !== "login.jsp" || fileName !== "register.jsp") {
                    location.replace("./login.jsp");
                }
            }
        }

    }
}



