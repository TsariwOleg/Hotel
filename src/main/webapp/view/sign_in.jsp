<% String strContextPath = request.getContextPath();%>

<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<%@ include file="myAccount/directive/taglib.jspf" %>


<!DOCTYPE html>
<html lang="en">

<head>


    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet" href="<%=strContextPath%>/view/style/sign_in.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


</head>

<body>
<form action="<%=strContextPath%>/signIn" method="post">
    <jsp:include page="myAccount/includedPage/navbar.jsp"/>


</form>


<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <form class="box" onsubmit='redirect();return false;' method="post">
                    <h1><fmt:message key="sign_in.login"/></h1>
                    <c:if test="${wrongLoginOrPassword == true}">
                        <div class="alert alert-danger" role="alert">
                            <strong><fmt:message key="sign_in.oh_snap"/></strong>
                            <strong><fmt:message key="sign_in.oh_snap"/></strong>
                            <fmt:message key="sign_in.incorrect_login_or_email"/>
                        </div>
                    </c:if>

                    <p class="text-muted"><fmt:message key="sign_in.enter_login_and_password"/></p>
                    <input type="text" name="email" placeholder="<fmt:message key="sign_in.email"/>">
                    <input type="password" name="password" placeholder="<fmt:message key="sign_in.password"/>">

                    <input type="submit" name="" value="<fmt:message key="sign_in.login"/>" href="#">

                <a type="button" class="btn btn-link" href="<%=strContextPath%>/signUp">Sign up</a>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.7/holder.min.js"
        integrity="sha512-O6R6IBONpEcZVYJAmSC+20vdsM07uFuGjFf0n/Zthm8sOFW+lAq/OK1WOL8vk93GBDxtMIy6ocbj6lduyeLuqQ=="
        crossorigin="anonymous"></script>


</body>

</html>