<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String strContextPath = request.getContextPath();%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="resources"/>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Hotel</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse mr-5 pr-4" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
        </ul>

        <form class="form-inline my-2 my-lg-0">
            <div class="dropdown mr-1">
                <button class="btn btn-secondary dropdown-toggle"
                        type="button" id="dropdownLanguage" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                    <img src="<%=strContextPath%>/resources/settings_icon/global.png">
                    <fmt:message key="navbar.language"/>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownLanguage">
                    <a class="dropdown-item" href="<%=strContextPath%>/changeLanguage?lang=ua">UA</a>
                    <a class="dropdown-item" href="<%=strContextPath%>/changeLanguage?lang=en">EN</a>
                </div>
            </div>

            <c:choose>
                <c:when test="${empty role}">
                    <a href="<%=strContextPath%>/signIn" class="btn btn-primary"><fmt:message key="navbar.sign_in"/></a>
                </c:when>
                <c:otherwise>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="<%=strContextPath%>/resources/rooms_icon/user.png" > &nbsp;<fmt:message key="navbar.account"/>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <a class="dropdown-item" href="<%=strContextPath%>/personalData">
                                <img src="<%=strContextPath%>/resources/settings_icon/settings.png" >&nbsp;<fmt:message key="navbar.manage_account"/></a>
                            <c:choose>
                                <c:when test="${role eq 'CLIENT'}">
                                    <a class="dropdown-item" href="<%=strContextPath%>/orders">
                                        <img src="<%=strContextPath%>/resources/settings_icon/clipboard.png">&nbsp;<fmt:message key="navbar.my_orders"/></a>

                                    <a class="dropdown-item" href="<%=strContextPath%>/roomRequest">
                                        <img src="<%=strContextPath%>/resources/settings_icon/request.png">&nbsp;<fmt:message key="navbar.my_requests"/></a>
                                </c:when>
                                <c:otherwise>
                                    <a class="dropdown-item" href="<%=strContextPath%>/addRoom">
                                        <img src="<%=strContextPath%>/resources/settings_icon/clipboard.png">&nbsp;<fmt:message key="navbar.add_room"/></a>


                                    <a class="dropdown-item" href="<%=strContextPath%>/orders">
                                        <img src="<%=strContextPath%>/resources/settings_icon/clipboard.png">&nbsp;<fmt:message key="navbar.orders"/></a>

                                    <a class="dropdown-item" href="<%=strContextPath%>/roomRequest">
                                        <img src="<%=strContextPath%>/resources/settings_icon/request.png">&nbsp;<fmt:message key="navbar.requests"/></a>
                                </c:otherwise>
                            </c:choose>

                            <a class="dropdown-item" href="<%=strContextPath%>/securitySettings">
                                <img src="<%=strContextPath%>/resources/settings_icon/verified.png">&nbsp;<fmt:message key="navbar.security_settings"/></a>
                            <a class="dropdown-item" href="<%=strContextPath%>/additionalSettings">
                                <img src="<%=strContextPath%>/resources/settings_icon/global.png">&nbsp;<fmt:message key="navbar.language"/></a>
                            <a class="dropdown-item" href="<%=strContextPath%>/logOut">
                                <img src="<%=strContextPath%>/resources/settings_icon/logout.png">&nbsp;<fmt:message key="navbar.log_out"/></a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>





        </form>
    </div>
</nav>
