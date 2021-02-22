<% String strContextPath = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String language = request.getSession().getAttribute("language").toString();%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="<%=language%>"/>
<fmt:setBundle basename="resources"/>
<div class="col-3">
    <div class="card">

        <div class="card-body">
            <a href="<%=strContextPath%>/personalData" class="btn btn-link btn-block">
                <img src="<%=strContextPath%>/resources/rooms_icon/user.png">
                <fmt:message key="left_menu_jsp.manage_account"/>
            </a>
            <hr>
            <a href="<%=strContextPath%>/securitySettings" class="btn btn-link btn-block ">
                <img src="<%=strContextPath%>/resources/settings_icon/verified.png"> <fmt:message key="left_menu_jsp.security_settings"/></a>
            <hr>
            <a href="<%=strContextPath%>/additionalSettings" class="btn btn-link btn-block">
                <img src="<%=strContextPath%>/resources/settings_icon/global.png"> <fmt:message key="left_menu_jsp.language"/></a>
            <hr>
            <a href="<%=strContextPath%>/orders" class="btn btn-link btn-block">
                <img src="<%=strContextPath%>/resources/settings_icon/clipboard.png"> <fmt:message key="left_menu_jsp.orders"/></a>
            <hr>
            <c:if test="${role eq 'MANAGER'}">
                <a href="<%=strContextPath%>/signUp" class="btn btn-link btn-block">
                    <img src="<%=strContextPath%>/resources/settings_icon/request.png"> <fmt:message key="left_menu_jsp.requests"/></a>
                <hr>
                <a href="<%=strContextPath%>/signUp" class="btn btn-link btn-block">
                    <img src="<%=strContextPath%>/resources/settings_icon/login.png"> <fmt:message key="left_menu_jsp.add_new_manager"/></a>
                <hr>
            </c:if>
        </div>
    </div>
</div>