"use strict";
function lifecycleMount(callback = null, phase = null) {
    if (callback != null && phase != null) {
        document.addEventListener('readystatechange', event => {
            if (event.target.readyState === 'interactive' && phase == 1) {
                console.log('DOM phase 1 interactive...');
                callback();

            }
            if (event.target.readyState === 'complete' && phase == 2) {
                console.log('DOM phase 2 completed...');
                callback();
            }
            if (event.target.readyState === 'complete' && phase == 3) {
                console.log('DOM phase 3 completed with delay 300ms...');
                setTimeout(callback, 1000);
            }
        });
    } else if (callback != null) {
        document.addEventListener('readystatechange', event => {
            if (event.target.readyState === 'complete') {
                console.log('DOM phase 2 completed (lifecycleMount - from else) ...');
                callback();
            }
        });

}
}
//* App init  ------------*/
sessionManager().checkForUser();
lifecycleMount(iterator, 1);
lifecycleMount(lazyLoaderRemove);



//*ajax function ------------*/
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

//*get all the form data and give to ajax(); ------------*/
function formManager(form) {
    return {
        setData: (url) => {
            var serialized = [];
            for (var i = 0; i < form.elements.length; i++) {
                var field = form.elements[i];
                if (!field.name || field.disabled || field.type === 'file' || field.type === 'reset' || field.type === 'submit' || field.type === 'button') {
                    continue;
                }
                if (field.type === 'select-multiple') {
                    for (var n = 0; n < field.options.length; n++) {
                        if (!field.options[n].selected)
                            continue;
                        serialized.push(encodeURIComponent(field.name) + "=" + encodeURIComponent(field.options[n].value));
                    }
                } else if ((field.type !== 'checkbox' && field.type !== 'radio') || field.checked) {
                    serialized.push(encodeURIComponent(field.name) + "=" + encodeURIComponent(field.value));
                }
            }
            var q = ajax(url, serialized.join('&'));
            console.log(serialized.join('&'));
            return q;
        }
    }
}


//*Remove the lazy loader after DOM loade ------------*/
function lazyLoaderRemove() {
    $("#lazy_loader").fadeOut(1000, function () {
        $(this).hide();
    });
}


//*Iterating objects in the HTML (for loop) ------------*/
function iterator() {
    var for_elements = [];
    var text_elements = [];

    document.querySelectorAll("*").forEach(attr => {
        if ("for" in attr.attributes) {
            for_elements.push(attr);
//          attr.style.display = "none"; 
        }
        if ("text" in attr.attributes) {
            text_elements.push(attr);
        }
    });

    text_elements.forEach(element => {
        var text = element.attributes.text.value;
        element.removeAttribute("text");
        console.log(urlParam().name);
        element.innerHTML = eval(text);
    });

    for_elements.forEach(element => {
        var url = element.attributes.for.value;
        element.removeAttribute("for");
        var htmlElementContent = element.innerHTML.replace(/\s\s+/g, ' ').trim();
        element.innerHTML = "";

        ajax(eval(url).toString()).then((res) => {
            res = JSON.parse(res.replace(/(?:\r\n|\r|\n)/g, ' '));
            if (Array.isArray(res)) {
                for (var w = 0; w <= res.length - 1; w++) {
                    element.insertAdjacentHTML('beforeend', elementConstruct(res[w], htmlElementContent));
                }
                return;
            }
            if (typeof res === 'object') {
                element.insertAdjacentHTML('beforeend', elementConstruct(res, htmlElementContent));
            }
//          element.style.display = "block";
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

            if (objectItem[userParam] != undefined) {
                constructedElement += beforeStart + objectItem[userParam] + afterObject;
                return elementConstruct(objectItem, constructedElement);
            }
        } else {
            return temp;
        }
    }
}


//*URL paramethers to js object converter ------------*/
function urlParam() {
    var keyObj = {};
    var key = window.location.search.trim().substr(1).split("&");
    key.forEach((e) => {
        e = e.split("=");
        keyObj[e[0]] = decodeURI(e[1]);
    });
    return keyObj;
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


//*Manage the session state of the user ------------*/
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
            console.log("Session is set ->" + sessionManager().getSessionId());
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
                ajax('http://nkatanasov.ca:85/CEJV__659_backend/api/user/delete/' + sessionManager().getSessionId()).then(() => {
                    localStorage.clear();
                    window.location.href = "./register.jsp";
                })
            }
            );
        }

    }
}


//*Helper collection manager ------------*/
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
            confirmWindow("Are you sure you want to delete this collection?", () => {
                ajax('http://nkatanasov.ca:85/CEJV__659_backend/api/collections/delete/' + sessionManager().getSessionId() + "/" + collection_id).then(() => {
                    window.location.href = "./collections.jsp";
                })
            }
            );
        }

    }
}


//*Helper vinyl manager ------------*/
function vinylManager() {
    return {
        addVinyl: () => {
            getSystemMessage("good", "<b>Success!</b><br>");
        },
        editVinyl: () => {
            getSystemMessage("good", "<b>Success!</b><br>The vinyl was edited");
        },
        deleteVinyl: (vinyl_id) => {
            confirmWindow("Are you sure you want to delete this vinyl?", () => {
                ajax('http://nkatanasov.ca:85/CEJV__659_backend/api/vinyls/delete/' + vinyl_id).then(() => {
                    window.history.back();
                })
            }
            );
        }

    }
}


