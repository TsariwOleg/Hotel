<!DOCTYPE html>
<html lang="en">

<head>


    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet" href="sec.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


</head>

<body>
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



<div class="container">
    <div class="row mt-5 pt-5">
        <div class="col-3">
            <div class="card">

                <div class="card-body">
                    <a href="#!" class="btn btn-link btn-block">Personal data</a>
                    <hr>
                    <a href="sdfsdf" class="btn btn-link btn-block disabled">Security</a>
                    <hr>
                    <a href="#!" class="btn btn-link btn-block">par of search</a>
                    <hr>
                    <hr>
                    <a href="#!" class="btn btn-link btn-block">My busines</a>
                </div>
            </div>
        </div>


        <div class="col-9 border" style="border-color: #212529;">
            <div class="container">
                <div class="row">
                    <div class="col-7 mt-2">
                        <h2>Налаштування секюр</h2>
                    </div>
                </div>


                <div class="row mt-3">
                    <a href="${pageContext.request.contextPath}/editHotel?id=1">sdsdf</a>
                </div>


                <hr>









            </div>

        </div>
    </div>




</div>



<div class="modal" id="areUSure" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="icon-box">
                    <i class="material-icons">&#xE5CD;</i>
                </div>
                <br>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h4 class="modal-title" id="exampleModalLabel">Are you sure?</h4>
                <br>
                <p>Do you really want to delete these records? This process cannot be undone.
                </p>
            </div>
            <div class="modal-footer">
                <div class="container">
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-4"><button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button></div>
                        <div class="col-4"><button type="button" class="btn btn-danger">Delete</button></div>
                        <div class="col-2"></div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>

<div id="" class="modal fade">
    <div class="modal-dialog modal-confirm">
        <div class="modal-content">
            <div class="modal-header">


                <h4 class="modal-title">Are you sure?</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <p>Do you really want to delete these records? This process cannot be undone.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger">Delete</button>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.7/holder.min.js" integrity="sha512-O6R6IBONpEcZVYJAmSC+20vdsM07uFuGjFf0n/Zthm8sOFW+lAq/OK1WOL8vk93GBDxtMIy6ocbj6lduyeLuqQ==" crossorigin="anonymous"></script>


</body>

</html>