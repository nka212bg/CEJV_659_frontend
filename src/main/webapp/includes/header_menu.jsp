<%@page pageEncoding="UTF-8"%>
<!--Header MENU-->
<div class="space-between vertica-align-flex padding-5" style="background: rgba(0,76,144,0.5)">
    <div class="space-between vertica-align-flex" style="">

        <a href="./edit_user.jsp" style="cursor: pointer;">
            <img class="user-logo box-shadow" src="" onerror="this.src = './resources/img/logo.jpg'" />
        </a> 

        <a href="./collections.jsp" class="margin-left home_menu a homeLink" >
            <i class="icon"></i> <span class="capitalize bold" >collections</span>
        </a>
    </div>

    <div style="padding-right: 10px; margin-bottom: -4px">
        <i class="icon a" title="contact us"></i>
        <i class="icon a margin-left" title="feedback"></i>
        <i class="icon a margin-left" title="FAQ"></i>
        <i onclick="sessionManager().logOut()" class="icon a margin-left text-orange" title="Logout"></i>
    </div>
</div> 
<script>
    document.querySelector(".user-logo").src = sessionManager().getUser().user_avatar;
</script>