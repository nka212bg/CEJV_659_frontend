<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <!--header -------------->
    <jsp:include page='./includes/header.jsp'>
        <jsp:param name="title" value="Vinyl Shelf | Add collection"/>
    </jsp:include>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body class="page bg-image">

        <!--header menu -------------->
        <jsp:include page="./includes/header_menu.jsp" />
        <!--collections_sub_header_menu -------------->
        <jsp:include page='./includes/collections_sub_header_menu.jsp'>
            <jsp:param name="bread_crumbs" value="collections &nbsp;&nbsp;<span style='color : orangered'>»</span>&nbsp;&nbsp; add new collection"/>
        </jsp:include>



        <div class="padding-30">
            <div class="padding-30" style="width: 350px;">




                <div class="space-between">

                    <h1 class="text-blue capitalize" style="line-height: 30px;">add new <br>collection</h1>


                    <img class="user-logo box-shadow" src="" id="collection_logo" onerror="this.src='./resources/img/logo.jpg'" style="width: 150px; height: 150px;"/>
                </div>

                <br>


                <form id="add_collection" onsubmit="event.preventDefault(), formManager(this).setData('http://localhost:8080/CEJV__659_backend/api/collections/add_collection/' + sessionManager().getSessionId()).then((e) => {
                            collectionManager().addCollection(e);
                        })">
                    <input type="text" class="input box-shadow" name="collection_name" placeholder=" Collection Name" />
                    <br>
                    <input type="text" class="input box-shadow" name="collection_genre" placeholder=" Genre" />
                    <br>
                    <input type="text" class="input box-shadow" name="collection_cover" placeholder="  Cover (URL / any image format)" />
                    <br>
                    <textarea name="collection_note" class="input box-shadow" style="min-height: 100px" placeholder=" Note..."></textarea>

                    <div class="space-between">
                        <a></a>
                        <button class="button margin-v-20 box-shadow" style="width: 150px">Add</button>
                    </div>

                </form>
            </div>
        </div>




        <!--footer -------------->
        <jsp:include page="./includes/footer.jsp" />
        <script>
            document.forms["add_collection"].collection_cover.onblur = () => {
                document.querySelector("#collection_logo").src = document.forms["add_collection"].collection_cover.value;
            }

        </script>

    </body>
</html>
