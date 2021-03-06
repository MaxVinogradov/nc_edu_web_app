<%@ page import="nc.sumy.edu.webapp.logic_processors.ApplicationPostProcessor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Create post</title>
    <jsp:include page="jsp-parts/header-part.jsp"/>
    <link href="css/posting.css" rel="stylesheet">
</head>

<body>
<jsp:include page="jsp-parts/nav_bar.jsp"/>
<div class="main">
    <div id="massageBox" class="mainBox col-md-offset-1 col-sm-offset-1 col-md-10 col-sm-10">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <img class="img-responsive" src="images/logo-large.svg" alt="logo" style="margin-top: 10px;">
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title text-center">Your posts</div>
            </div>
            <div class="panel-body">
                    <%=(new ApplicationPostProcessor()).process(request, response)%>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<jsp:include page="jsp-parts/script-part.jsp"/>
<script type="text/javascript" src="js/menu.js"></script>
</body>

</html>