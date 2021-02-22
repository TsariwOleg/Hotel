<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String strContextPath = request.getContextPath();%>
<!DOCTYPE html>
<html>

<head>


    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%=strContextPath%>/view/style/modalWindow.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" href="<%=strContextPath%>/view/style/calendar.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">


</head>

<body style="height: 2000px;">

<form action="<%=strContextPath%>/signIn" method="post">
    <jsp:include page="myAccount/includedPage/navbar.jsp"/>
</form>

<form onsubmit='redirect();return false;' method="post">

<div class="container">
    <div class="row mt-5 pt-5">
        <div class="col-4">

            <div class="card">

                <div class="card-body">
                    <h4 class="card-title">You chose</h4>
                    <p class="card-text">
                        <br>
                    <h5>Solo appartment</h5>

                    <h5>Price</h5>
                    Some quick example text to build on the card title and make up the bulk of the card's content.
                    </p>
                    <a href="#!" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
        <div class="col-8">

            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="#" data-src="holder.js/900x400?theme=social">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="#" data-src="holder.js/900x400?theme=industrial">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="#" data-src="holder.js/900x400?theme=industrial">
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
    </div>

    <div class="row mt-4">
        <div class="col-4"></div>
        <div class="col-8  " style="background-color: #b8daff;"><br>
            <h3>Input your persone data</h3>

            <div class="container mt-5">
                <div class="row">
                    <div class="col-3">

                        <div class="form-group">
                            <label for="formGroupExampleInput">Example label</label>
                            <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Example input">
                        </div>


                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="formGroupExampleInput2">Another label</label>
                            <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-3">
                        <div class="form-group">
                            <label for="formGroupExampleInput2">Email label</label>
                            <input type="text" class="form-control" id="formGroupExampleInput3" placeholder="Another input">
                        </div>
                    </div>
                </div>



                <div class="row">

                    <form autocomplete="off">
                        <div class="flex-row d-flex ">
                            <div class="col-12 ">
                                <div class="input-group input-daterange">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-6">
                                                Start Date
                                            </div>
                                            <div class="col-6">
                                                End Date
                                            </div>
                                        </div>
                                    </div>

                                    <input  type="text" id="start" autocomplete="off" class="form-control text-left mr-2" name="start_date">
                                    <span class="fa fa-calendar" id="fa-1"></span>


                                    <input   type="text" id="end" autocomplete="off" class="form-control text-left ml-2" name="end_date" placeholder="Another input">
                                    <span class="fa fa-calendar" id="fa-2"></span>


                                </div>
                            </div>
                        </div>
                    </form>

                </div>




                <div class="row">
                    <div class="col-5 mt-3">
                        Ви записуєте на себе?
                        <div class="custom-control custom-radio">
                            <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input">
                            <label class="custom-control-label" for="customRadio1">Toggle this custom radio</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
                            <label class="custom-control-label" for="customRadio2">Or toggle this other custom radio</label>
                        </div>
                    </div>
                </div>

                <div class="row mt-3 mb-3">
                    <div class="col-3">

                        <input type="submit" class="btn btn-secondary" value="lol" data-container="body" data-toggle="popover" data-placement="top" data-content="Для початку зарегайтесь на сайті" data-original-title="" title="">




                    </div>
                </div>

            </div>




        </div>
    </div>


</div>
</form>


<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.7/holder.min.js" integrity="sha512-O6R6IBONpEcZVYJAmSC+20vdsM07uFuGjFf0n/Zthm8sOFW+lAq/OK1WOL8vk93GBDxtMIy6ocbj6lduyeLuqQ==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>

<script src="<%=strContextPath%>/view/js/calendar.js"></script>
</body>

</html>