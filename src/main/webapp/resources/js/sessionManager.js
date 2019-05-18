"use strict"
        (async function () {
            return await new Promise((resolve, reject) => {
                const xhr = new XMLHttpRequest();
                xhr.open('POST', "http://localhost:8080/CEJV__659_backend/api/user/get_user", true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onload = () => resolve(xhr.responseText);
                xhr.onerror = () => reject(xhr.statusText);
                xhr.send();
            }).then((e) => {
                console.log(JSON.parse(e));
                if (true) {

                } else {
                    location.replace("./login.jsp")
                }
            });
        })();




