<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style/modalWindow.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Hotel</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
        </ul>

        <form class="form-inline my-2 my-lg-0">


            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle ml-4" type="button" id="dropdownMenu1"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="bi bi-globe2"></i> Language
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <a class="dropdown-item" href="#!">English</a>
                    <a class="dropdown-item" href="#!">Ukranian</a>
                </div>
            </div>

            <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                <i class="bi bi-person-circle"></i> Sign in
            </button>


            <!-- Modal HTML -->
            <div id="myModal" class="modal fade">
                <div class="modal-dialog modal-login">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Member Login</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form action="/examples/actions/confirmation.php" method="post">
                                <div class="form-group">
                                    <i class="fa fa-user"></i>
                                    <input type="text" class="form-control mt-4 ml-auto mr-auto" placeholder="Username"
                                           required="required">
                                </div>
                                <div class="form-group">
                                    <i class="fa fa-lock"></i>
                                    <input type="password" class="form-control mt-2 ml-auto mr-auto"
                                           placeholder="Password" required="required">
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary btn-block btn-lg mt-4" value="Login">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <a href="#">Forgot Password?</a>
                        </div>
                    </div>
                </div>
            </div>

        </form>
    </div>
</nav>

<form method="post" action="/Hotel_EPAM_final_project_war/editHotel?id=${hotel.id}">
    <div class="container">
        <div class="row mt-5 pt-5">
            <div class="col-1"></div>
            <div class="col-10">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <img class="d-block w-100"
                                 src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22900%22%20height%3D%22400%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20900%20400%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1772f63df66%20text%20%7B%20fill%3A%23FFFFFF%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A45pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1772f63df66%22%3E%3Crect%20width%3D%22900%22%20height%3D%22400%22%20fill%3D%22%233a5a97%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22333.203125%22%20y%3D%22220.1%22%3E900x400%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
                                 data-src="holder.js/900x400?theme=social" alt="900x400" data-holder-rendered="true"
                                 style="width: 900px; height: 400px;">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100"
                                 src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22900%22%20height%3D%22400%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20900%20400%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1772f63dfed%20text%20%7B%20fill%3A%23C2F200%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A45pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1772f63dfed%22%3E%3Crect%20width%3D%22900%22%20height%3D%22400%22%20fill%3D%22%23434A52%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22333.203125%22%20y%3D%22220.1%22%3E900x400%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
                                 data-src="holder.js/900x400?theme=industrial" alt="900x400" data-holder-rendered="true"
                                 style="width: 900px; height: 400px;">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-1"></div>
        </div>

        <div class="row   mt-5">
            <div class="col-1"></div>
            <div class="col-6 ">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <button type="button" class="btn btn-link" data-toggle="collapse" href="#changeName"
                                    aria-expanded="false" aria-controls="collapseExample">
                                <h1>${hotel.name}</h1>
                            </button>


                            <div class="collapse" id="changeName">
                                <div class="card card-body">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-8"> Імя
                                                <input name="newName" class="form-control mr-sm-2" type="text"
                                                       placeholder="Search" aria-label="Search">
                                            </div>
                                            <div class="col-4 mt-4">
                                                <input type="submit" class="btn btn-primary float-righ" value="Primary">
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <button type="button" class="btn btn-link" data-toggle="collapse" href="#changeRating"
                                    aria-expanded="false" aria-controls="collapseExample">
                                ${hotel.rating}
                                <c:forEach begin="1" end="${hotel.rating}" varStatus="loop">
                                    <i class="bi bi-star"> </i>
                                </c:forEach></button>
                            <div class="collapse" id="changeRating">
                                <div class="card card-body">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-8"> Імя
                                                <select name="newStarRating" class="custom-select">
                                                    <option value="" selected disabled hidden>Виберіть відділення
                                                    </option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                </select></div>
                                            <div class="col-4 mt-4"><input type="submit"
                                                                           class="btn btn-primary float-righ"
                                                                           value="Primary"></div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-12">
                            ${hotel.description}
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-9"></div>
                        <div class="col-3">
                            <button type="button" class="btn btn-primary" data-toggle="collapse"
                                    href="#changeDescription" aria-expanded="false" aria-controls="collapseExample">
                                Primary
                            </button>
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-12">
                            <div class="collapse" id="changeDescription">
                                <div class="card card-body">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-12"> Імя
                                                <span class="badge badge-secondary" data-toggle="tooltip"
                                                      data-placement="top" title="Tooltip on top">?</span>


                                                <textarea name="newFullHotelsDescription" class="form-control"
                                                          id="full_hotels_description" rows="5" style=" resize: none;"
                                                          name="full_hotels_description"></textarea>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <col-3>
                                                <div class="col-4 mt-4"><input type="submit"
                                                                               class="btn btn-primary float-righ"
                                                                               value="Primary"></div>
                                            </col-3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-12">
                            <br> <strong>Найпопулярніші зручності</strong>

                            <ul>
                                <c:forEach items="${best_facilities}" var="best_facility">
                                    <li>${best_facility.text} <img src="${best_facility.path}"></li>
                                </c:forEach>
                            </ul>

                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-9"></div>
                        <div class="col-3">
                            <button type="button" class="btn btn-primary" data-toggle="collapse"
                                    href="#changeBestPropose" aria-expanded="false" aria-controls="collapseExample">
                                Primary
                            </button>
                        </div>
                    </div>


                    <div class="row mt-2">
                        <div class="col-12">
                            <div class="collapse" id="changeBestPropose">
                                <div class="card card-body">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-12"> Імя
                                                <span class="badge badge-secondary" data-toggle="tooltip"
                                                      data-placement="top" title="Tooltip on top">?</span>


                                                <textarea class="form-control" id="full_hotels_description" rows="5"
                                                          style=" resize: none;"
                                                          name="full_hotels_description"></textarea>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <col-3>
                                                <div class="col-4 mt-4"><input type="submit"
                                                                               class="btn btn-primary float-righ"
                                                                               value="Primary"></div>
                                            </col-3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr>

                </div>


            </div>

            <div class="row">
                <div class="col-1">
                </div>

                <div class="col-6">

                </div>
            </div>

            <div class="col-4  mt-5">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">

                                <div class="card-body">
                                    <h4 class="card-title">We offer</h4>
                                    <ul>
                                        <c:forEach items="${offers}" var="offer">
                                            <li>${offer}</li>
                                        </c:forEach>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-1">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Maps</h4>
                                    <p class="card-text">
                                        Adress:
                                    </p>


                                    <p>
                                        <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample"
                                           aria-expanded="false" aria-controls="collapseExample">
                                            Link with href
                                        </a>

                                    </p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>


        </div>


        <div class="collapse mt-2" id="collapseExample">
            <div class="card card-body">
                <div class="row  ml-5 mr-5">
                    <div class="col-4">
                        <strong class="mt-4">Address:</strong>
                        <h5 class="mt-4">About position</h5>
                        SDfsdfsdfsdfsdfsfsdfsdfsdfssdfsdfsdfsdf SDfsdfsdfsdfsdfsfsdfsdfsdfssdfsdf sdf
                    </div>
                    <div class="col-8">
                        <div id="map" style="  height: 450px;
                        /* The height is 400 pixels */
                        width: 100%;
                        /* The width is the width of the web page */"></div>
                    </div>

                </div>
            </div>
        </div>

        <div class="row mt-5 ml-4 mr-4">

            <div class="col-12">
                <h1>sdfsdf</h1>
                <table class="table table-bordered">
                    <thead>
                    <tr class="table-primary">
                        <th>Номер</th>
                        <th>Вміщує</th>
                        <th>Ціна за ніч</th>
                        <th>На ваш вибір</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty hotel.rooms}">
                            <tr>

                                <td colspan="4">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-5"></div>
                                            <div class="col-2">
                                                <h1>EMPTY</h1>
                                            </div>
                                        </div>
                                    </div>

                                </td>

                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${hotel.rooms}" var="room">


                                <tr>
                                    <td>
                                        <h5><strong>${room.name}</strong></h5><br> ${room.areaOfRoom} кв\м
                                        <c:forEach items="${room.facilitiesEntities}" var="facility">
                                            ${facility.text}

                                            <img src=" ${facility.path}">&nbsp;
                                            <br>
                                        </c:forEach>


                                        <hr>
                                        <span style="font-size: 11pt">${room.description}</span>
                                    </td>

                                    <td>
                                        <c:forEach begin="1" end="${room.countOfClient}" varStatus="loop">
                                            <img src="../resources/rooms_icon/user.png">
                                        </c:forEach>
                                       </td>


                                    <td>
                                       ${room.price}
                                    </td>
                                    <td>
                                        22
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>

                    </tbody>
                </table>
            </div>


        </div>

        <div class="row">
            <div class="col-10">
            </div>
            <div class="col-2">
                <a href="${pageContext.request.contextPath}/addRoom?id=${hotel.id}" class="btn btn-primary">Primary</a>
            </div>
        </div>


        <div class="row ml-4 mr-4 mt-5">

            <div class="col-2"></div>
            <div class="col-3 " style="background-color: #b8daff;">
                <h1>sdfsdfsdf</h1>
            </div>

            <div class="col-5">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <p>
                                <a class="btn btn-link" data-toggle="collapse" href="#collapseFAQ" aria-expanded="false"
                                   aria-controls="collapseExample">
                                    Link with href <i class="bi bi-chevron-down"></i>
                                </a>

                            </p>
                            <div class="collapse" id="collapseFAQ">
                                <div class="card card-body border-0">
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry
                                    richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson
                                    cred nesciunt sapiente ea proident.
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-12">dsfsdf</div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-12">dsfsdf</div>
                    </div>
                    <hr>
                </div>

            </div>
            <div class="col-2"></div>

        </div>

    </div>
</form>

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

<script src="../js/filter.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIwzALxUPNbatRBj3Xi1Uhp0fFzwWNBkE&callback=initMap&libraries=&v=weekly"
        defer></script>

</body>

</html>