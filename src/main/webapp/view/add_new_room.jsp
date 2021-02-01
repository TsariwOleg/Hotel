<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String strContextPath = request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">

<head>


    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <link rel="stylesheet" href="<%=strContextPath%>/view/style/modalWindow.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


</head>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Hotel</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
        </ul>

        <form class="form-inline my-2 my-lg-0">


            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle ml-4" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                    <input type="text" class="form-control mt-4 ml-auto mr-auto" placeholder="Username" required="required">
                                </div>
                                <div class="form-group">
                                    <i class="fa fa-lock"></i>
                                    <input type="password" class="form-control mt-2 ml-auto mr-auto" placeholder="Password" required="required">
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

<form method="post" action="/Hotel_EPAM_final_project_war/addRoom?id=${hotel_id}">
    <div class="container">
        <div class="row mt-5 pt-5">
            <div class="col-1"></div>
            <h2>Add Room</h2>
            <div class="col-5"></div>
        </div>
        <div class="row mt-2">
            <div class="col-1"></div>
            <div class="col-6">Name of room
                <input name="class_of_room" class="form-control mr-sm-2 mt-2" type="text" placeholder="Search" aria-label="Search">
                <span class="text-secondary ml-2 ">Guest will see this name when they search for a place to stay </span>
            </div>

        </div>

        <div class="row mt-2">
            <div class="col-1"></div>
            <div class="col-6">No of room
                <input name="No_of_room" class="form-control mr-sm-2 mt-2" type="text" placeholder="Search" aria-label="Search">
                <span class="text-secondary ml-2 ">Guest will see this name when they search for a place to stay </span>
            </div>
        </div>


        <div class="row mt-3">
            <div class="col-1"></div>
            <div class="col-6">Count of users

                <select name="count_of_client" class="custom-select">

                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <div class="col-1"></div>
        </div>



        <div class="row mt-2">
            <div class="col-1"></div>
            <div class="col-6">Price per night
                <input name="price_per_night" class="form-control mr-sm-2 mt-2" type="text" placeholder="Search" aria-label="Search">
            </div>
            <div class="col-1"></div>
        </div>


        <div class="row mt-2">
            <div class="col-1"></div>
            <div class="col-6">area of room
                <input name="area_of_room" class="form-control mr-sm-2 mt-2" type="text" placeholder="Search" aria-label="Search">
            </div>
            <div class="col-1"></div>
        </div>

        <div class="row mt-4">
            <div class="col-1"></div>
            <div class="col-6">Description of Room
                <span class="badge badge-secondary" data-toggle="tooltip" data-placement="top" title="Tooltip on top">?</span>
                <textarea name="description" class="form-control" rows="3" style=" resize: none;"></textarea>

            </div>
            <div class="col-1"></div>
        </div>

        <hr>
        <div class="row mt-4">
            <div class="col-1"></div>
            <h4>Facilities and Amenities</h4>
            <div class="col-5"></div>
        </div>

        <div class="row mt-4">
            <div class="col-1"></div>
            <div class="col-10">
                Best amenities in the room
                <div class="container mt-2">
                    <c:forEach items="${amenities_of_room}" var="amenity_of_room">


                        <div class="row">
                            <div class="col-4">
                                <div class="custom-control custom-checkbox">
                                    <input name="case" type="checkbox" class="custom-control-input" id="${amenity_of_room.firstCol.id}" value="${amenity_of_room.firstCol.enumName}">
                                    <label class="custom-control-label" for="${amenity_of_room.firstCol.id}">${amenity_of_room.firstCol.text}
                                        <img
                                                src="<%=strContextPath%>/${amenity_of_room.firstCol.path}"></label>
                                </div>
                            </div>

                            <c:if test="${not empty amenity_of_room.secondCol}">
                                <div class="col-4">
                                    <div class="custom-control custom-checkbox">
                                        <input name="case" type="checkbox" class="custom-control-input" id="${amenity_of_room.secondCol.id}" value="${amenity_of_room.secondCol.enumName}">
                                        <label class="custom-control-label" for="${amenity_of_room.secondCol.id}">${amenity_of_room.secondCol.text}
                                            <img
                                                    src="<%=strContextPath%>/${amenity_of_room.secondCol.path}"></label>
                                    </div>
                                </div>
                            </c:if>


                            <c:if test="${not empty amenity_of_room.thirdCol}">
                                <div class="col-4">
                                    <div class="custom-control custom-checkbox">
                                        <input name="case" type="checkbox" class="custom-control-input" id="${amenity_of_room.thirdCol.id}" value="${amenity_of_room.thirdCol.enumName}">
                                        <label class="custom-control-label" for="${amenity_of_room.thirdCol.id}">${amenity_of_room.thirdCol.text}
                                            <img
                                                    src="<%=strContextPath%>/${amenity_of_room.thirdCol.path}"></label>
                                    </div>
                                </div>
                            </c:if>

                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>




        <div class="row mt-4">
            <div class="col-1"></div>
            <div class="col-6">Additional services and amenities
                <span class="badge badge-secondary" data-toggle="tooltip" data-placement="top" title="Tooltip on top">?</span>
                <textarea name="additional_services" class="form-control" rows="4" style=" resize: none;"></textarea>

            </div>
            <div class="col-1"></div>
        </div>



        <div class="row mt-2 ">
            <div class="col-1 "></div>
            <div class="col-6 "></div>
            <div class="col-4 ">

                <input type="submit" class="btn btn-primary " value="Primary">

            </div>
            <div class="col-1 "></div>
        </div>

    </div>

</form>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.7/holder.min.js" integrity="sha512-O6R6IBONpEcZVYJAmSC+20vdsM07uFuGjFf0n/Zthm8sOFW+lAq/OK1WOL8vk93GBDxtMIy6ocbj6lduyeLuqQ==" crossorigin="anonymous"></script>

<script src="../js/filter.js"></script>


</body>

</html>