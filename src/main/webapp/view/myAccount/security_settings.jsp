<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<% String strContextPath = request.getContextPath();%>

<%@ include file="directive/taglib.jspf" %>

<!DOCTYPE html>
<html>

<head>


    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet" href="<%=strContextPath%>/view/style/security.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


</head>

<body>
<form action="<%=strContextPath%>/signIn" method="post">
    <jsp:include page="includedPage/navbar.jsp"/>

</form>





<div class="container">
    <div class="row mt-5 pt-5">
        <jsp:include page="includedPage/left_menu.jsp"/>



        <div class="col-9 border" style="border-color: #212529;">
            <div class="container">
                <div class="row">
                    <div class="col-7 mt-2">
                        <h2><fmt:message key="security_settings_jsp.security_settings"/></h2>
                    </div>
                </div>


                <div class="row mt-3">
                    <div class="col-9"><img src="<%=strContextPath%>/resources/myAccount_icon/padlock.png"><fmt:message key="security_settings_jsp.password"/></div>
                    <div class="col-3">
                        <p>
                            <a class="btn btn-primary" data-toggle="collapse" href="#collapsePersoneData" aria-expanded="false" aria-controls="collapseExample">
                                <fmt:message key="edit"/>
                            </a>
                        </p>
                    </div>
                </div>

                <form onsubmit='redirect();return false;' method="post">
                <div class="collapse " id="collapsePersoneData">
                    <div class="card card-body border-0 ml-4">
                        <div class="container">
                            <div class="row">
                                <div class="col-4"> <strong><fmt:message key="security_settings_jsp.password"/></strong>
                                    <input name="password" class="form-control mr-sm-2" type="password" required>
                                </div>
                                <div class="col-4"> <strong><fmt:message key="security_settings_jsp.repeat_password"/></strong>
                                    <input name="repeated_password"class="form-control mr-sm-2" type="password" required>
                                </div>
                                <div class="col-4 mt-4"> <input type="submit" class="btn btn-primary float-righ" value="<fmt:message key="save"/>"></div>
                            </div>
                        </div>
                        <br>

                    </div>
                </div>
                </form>
                <hr>



<%--                <div class="row mt-4">--%>
<%--                    <div class="col-9"><img src="<%=strContextPath%>/resources/myAccount_icon/delete.png"> Видалити акк &nbsp;&nbsp;&nbsp;--%>
<%--                    </div>--%>
<%--                    <div class="col-3">--%>
<%--                        <p>--%>
<%--                            <a href="#areUSure" class="btn btn-primary" data-toggle="modal">--%>
<%--                                Link with href--%>
<%--                            </a>--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <hr>--%>




            </div>

        </div>
    </div>




</div>


<%--<form onsubmit='redirect();return false;' method="post">--%>

<%--<div class="modal" id="areUSure" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <div class="icon-box">--%>
<%--                    <i class="material-icons">&#xE5CD;</i>--%>
<%--                </div>--%>
<%--                <br>--%>

<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <h4 class="modal-title" id="exampleModalLabel">Are you sure?</h4>--%>
<%--                <br>--%>
<%--                <p>Do you really want to delete these records? This process cannot be undone.--%>
<%--                </p>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <div class="container">--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-2"></div>--%>
<%--                        <div class="col-4"><button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button></div>--%>
<%--                        <div class="col-4"><input name="delete_account" type="submit" class="btn btn-danger" value="Delete"></div>--%>
<%--                        <div class="col-2"></div>--%>
<%--                    </div>--%>
<%--                </div>--%>


<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</form>--%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.7/holder.min.js" integrity="sha512-O6R6IBONpEcZVYJAmSC+20vdsM07uFuGjFf0n/Zthm8sOFW+lAq/OK1WOL8vk93GBDxtMIy6ocbj6lduyeLuqQ==" crossorigin="anonymous"></script>


</body>

</html>