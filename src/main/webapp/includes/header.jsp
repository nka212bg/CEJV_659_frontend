<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8"%>
<!--header HEAD-->
<head>
    <meta http-equiv="Content-Type"  content="text/html; charset=UTF-8">
    <title>${param.title}</title>
    <script src="./resources/js/app.js" type="text/javascript"></script>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/img/logo.png" />
    <link href="${pageContext.request.contextPath}/resources/css/app.css" rel="stylesheet" type="text/css"/>
</head>
<div style="background: #ffffff ;position: fixed; width: 100%; height: 100%; top: 0; left: 0; z-index: 1000;" id="lazy_loader"><div class="mid-div"><img src="resources/img/spiner.svg"/></div></div>
