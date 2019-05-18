"use strict"
document.addEventListener('DOMContentLoaded', function () {
    $("#lazy_loader").fadeOut(1000, function () {
        $(this).hide();
    });
    
});


async function ajax(url, data="") {
    return await new Promise((resolve, reject) => {
        const xhr = new XMLHttpRequest();
        xhr.open('POST', url, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = () => resolve(xhr.responseText);
        xhr.onerror = () => reject(xhr.statusText);
        xhr.send(data);
    });
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








