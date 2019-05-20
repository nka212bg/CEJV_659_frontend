"use strict";
document.addEventListener('readystatechange', event => {
    sessionManager().checkForUser();

    if (event.target.readyState === 'interactive') {
        console.log('DOM interactive...');
        iterator();

    }
    if (event.target.readyState === 'complete') {
        console.log('DOM completed...');
        $("#lazy_loader").fadeOut(1000, function () {
            $(this).hide();
        });
    }
});



async function ajax(url, data = "") {
    return await new Promise((resolve, reject) => {
        const xhr = new XMLHttpRequest();
        xhr.open('POST', url, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = () => resolve(xhr.responseText);
        xhr.onerror = () => reject(xhr.statusText);
        xhr.send(data);
    });
}


function iterator() {

    var all_elements = [];
    document.querySelectorAll("*").forEach(attr => {
        if ("for" in attr.attributes) {
            all_elements.push(attr);
//            attr.style.display = "none"; 
        }
    });

    all_elements.forEach(element => {
        var url = element.attributes.for.value;
        element.removeAttribute("for");
        var htmlElementContent = element.innerHTML.replace(/\s\s+/g, ' ').trim();
        element.innerHTML = "";

        ajax(eval(url)).then((res) => {
            res = JSON.parse(res.replace(/(?:\r\n|\r|\n)/g, ' '));
            console.log(res);

            if (Array.isArray(res)) {
                console.log("Array -----------");
                for (var w = 0; w <= res.length; w++) {
                    element.insertAdjacentHTML('beforeend', elementConstruct(res[w], htmlElementContent));
                }
            }
            if (typeof res === 'object') {
                console.log("object -------------");
                element.insertAdjacentHTML('beforeend', elementConstruct(res, htmlElementContent));
            }

//            element.style.display = "block";
        });

    });

    function elementConstruct(objectItem, element) {
        var temp = element;
        var constructedElement = "";
        if (element.indexOf("{{") !== -1 && element.indexOf("}}") !== -1) {
            var start = element.indexOf("{{");
            var end = element.indexOf("}}") + 2;
            var userParam = element.substring(start + 2, end - 2).trim();

            var beforeStart = element.substring(0, start);
            var afterObject = element.substring(end, element.length);

            constructedElement += beforeStart + objectItem[userParam] + afterObject;
            return elementConstruct(objectItem, constructedElement);
        } else {
            return temp;
        }
    }
}


//* function for display and hide a containers ------------*/
function showHide(element, userValue, recursive = false) {
    if (recursive === true) {
        document.querySelectorAll(element).forEach((e) => {
            e.style.display = userValue;
        });
    } else {
        document.querySelector(element).style.display = userValue;
}
}


//*System messages ------------*/
function getSystemMessage(status, message) {
    var color = "";
    var icon = "";

    if (message !== "") {
        $(".systemMessage").fadeOut("normal", function () {
            $(this).remove();
        });
        if (status === "bad") {
            color = "#ff4400";
            icon = "";
            runMessage();
        }
        if (status === "good") {
            color = "white";
            icon = "";
            runMessage();
        }
    }

    if ((document.cookie.indexOf('message_good=') !== -1) || (document.cookie.indexOf('message_bad=') !== -1)) {
        $(".systemMessage").fadeOut("normal", function () {
            $(this).remove();
        });
        if (document.cookie.indexOf('message_bad=') !== -1) {
            message = document.cookie.replace(/(?:(?:^|.*;\s*)message_bad\s*\=\s*([^;]*).*$)|^.*$/, "$1").replace(/["']/g, "");
            color = "#ff4400";
            icon = "";
            document.cookie = 'message_bad=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
            runMessage();
        }
        if (document.cookie.indexOf('message_good=') !== -1) {
            message = document.cookie.replace(/(?:(?:^|.*;\s*)message_good\s*\=\s*([^;]*).*$)|^.*$/, "$1").replace(/["']/g, "");
            color = "white";
            icon = "";
            document.cookie = 'message_good=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
            runMessage();
        }
    }

    function runMessage() {
        var messageHolder = '<div class="systemMessage" style="color: ' + color + ';"><div class="systemMessageMessage"><i class="icon" style="font-size: 20px">' + icon + ' </i>' + message + '</div></div>';
        document.body.insertAdjacentHTML('afterend', messageHolder);
        setTimeout(() => {
            $(".systemMessage").fadeOut("normal", function () {
                $(this).remove();
            });
        }, 8000);
    }

}


//* Popup window for confirming actions yes/no ------------*/
function  confirmWindow(message, callback) {
    var confirm_window = '<div id="confirm_window" class="profile-menu padding-30"><div class="bg-gradient-radial" style="position: fixed;"></div><div class="mid-div" style="position: fixed"><div class="card-base mid-div" style="width: 350px; padding: 20px ;background: white;"><div class="space-between"  style="margin-top: -20px"><h1 class="first_upper" style="color:darkgrey">' + message + '</h1></div><div class="space-between" style="margin-top: 30px"><span id="yes" class="button box-shadow bg-orange">Yes</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="no" class="button box-shadow">No</span></div><br></div></div></div>';
    document.body.insertAdjacentHTML("afterend", confirm_window);
    document.body.style.filter = "blur(4px)";

    document.getElementById("yes").onmouseup = () => {
        document.body.removeAttribute("style");
        $("#confirm_window").fadeOut(300, function () {
            $(this).remove();
            callback();
        });
    }

    document.getElementById("no").onmousedown = () => {
        document.body.removeAttribute("style");
        $("#confirm_window").fadeOut(300, function () {
            $(this).remove();
        });
    }
}



function formManager(_this) {
    return {
        setData: (url) => {
            var data = "";
            for (var i = 0; i < _this.length; i++) {
                if (_this[i].nodeName == "INPUT" || _this[i].nodeName == "TEXTAREA") {
                    data += _this[i].name + "=" + _this[i].value;
                }
                if (i < _this.length - 2) {
                    data += "&";
                }
            }
            var q = ajax(url, data);
            return q;
        },
        getData: (_this, url) => {
            alert();
        }
    }
}



function sessionManager() {
    return {
        login: (e) => {
            e = JSON.parse(e);
            if (Object.keys(e).indexOf("SessionLinker") !== -1) {
                localStorage.clear();
                localStorage.setItem("SessionLinker", JSON.stringify(e));
                location.replace("./collections.jsp");
            } else {
                getSystemMessage("bad", "<b>Unsuccess!</b><br>" + e.message);
            }

        },
        register: (e) => {
            e = JSON.parse(e);
            console.log(e);
            if (Object.keys(e).indexOf("SessionLinker") !== -1) {
                localStorage.clear();
                localStorage.setItem("SessionLinker", JSON.stringify(e));
                location.replace("./collections.jsp");
            } else {
                getSystemMessage("bad", "<b>Unsuccess!</b><br>" + e.message);
            }
        },
        logOut: () => {
            localStorage.clear();
            location.replace("./login.jsp");
        },
        getUser: () => {
            if (localStorage.getItem('SessionLinker')) {
                return JSON.parse(localStorage.getItem('SessionLinker'));
            }
        },
        getSessionId: () => {
            if (localStorage.getItem('SessionLinker')) {
                return JSON.parse(localStorage.getItem('SessionLinker')).SessionLinker;
            }
        },
        setUser: (e) => {
            e = JSON.parse(e);
            getSystemMessage("good", "<b>Success!</b><br>" + e.message);
        },
        checkForUser: () => {
            var fileName = window.location.pathname.split("/")[window.location.pathname.split("/").length - 1].trim();
            console.log(!sessionManager().getSessionId());
            if (!sessionManager().getSessionId()) {
                if (!(fileName.indexOf("login.jsp") !== -1 || fileName.indexOf("register.jsp") !== -1)) {
                    window.location.href = "./login.jsp";
                }
            }
            if (sessionManager().getSessionId()) {
                if ((fileName.indexOf("login.jsp") !== -1 || fileName.indexOf("register.jsp") !== -1)) {
                    window.location.href = "./collections.jsp";
                }
            }
        },
        deleteUser: () => {
            confirmWindow("Are you sure you want to delete your profile?", () => {
                ajax('http://localhost:8080/CEJV__659_backend/api/user/delete/' + sessionManager().getSessionId()).then(() => {
                    localStorage.clear();
                    window.location.href = "./register.jsp";
                })
            }
            );
        }

    }
}





function collectionManager() {
    return {
        addCollection: (e) => {
            e = JSON.parse(e);
            getSystemMessage("good", "<b>Success!</b><br>" + e.message);
        },
        editCollection: (e) => {
            e = JSON.parse(e);
            getSystemMessage("good", "<b>Success!</b><br>" + e.message);
        },
        deleteCollection: (collection_id) => {
            confirmWindow("Are you sure you want to delete your profile?", () => {
                ajax('http://localhost:8080/CEJV__659_backend/api/collections/delete/' + sessionManager().getSessionId() + "/" + collection_id).then(() => {
                    window.location.href = "./collections.jsp";
                })
            }
            );
        }

    }
}





