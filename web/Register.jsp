
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <!-- CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="styles.css">

        <style>

            .primary-background{
                background:#607d8b;
            }
            .banner-background {
                clip-path: polygon(0% 0%, 100% 0%, 100% 75%, 100% 100%, 93% 89%, 68% 100%, 0 100%);
            }
        </style>

    </head>
    <body class="banner-background">

        <%@include file="normal_navbar.jsp" %>

        <main class="primary-background banner-background" style="padding-bottom: 60px">
            <br>
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register Here
                        </div>
                        <div class="card-body">
                            <form action="RegisterServlet" method="POST" id="reg-form">
                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">


                                </div>



                                <div class="form-group">
                                    <label for="user_email">Email address</label>
                                    <input type="email"  name="user_email"class="form-control" id="exampleInputEmail1"
                                           aria-describedby="emailHelp" placeholder="Enter email" required
                                           pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}">

                                </div>


                                <div class="form-group">
                                    <label for="user_password">Password</label>
                                    <input type="password"  name="user_password" class="form-control" id="exampleInputPassword1"
                                           placeholder="Password" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$">
                                    <small class="form-text text-muted">Password must contain at least 8 characters, including at least one uppercase letter, one lowercase letter, one number, and one special character (!@#$%^&*).</small>
                                </div>


                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio"  id="gender" name="gender" value="male"> Male

                                    <input type="radio"  id="gender" name="gender" value="female"> Female
                                </div>

                                <div class="form-group">
                                    <textarea name="about" class="form-control" id="" cols="10" rows="5" placeholder="Enter something about yourself"></textarea>
                                </div>



                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
                                </div>
                                <br>
                                <div class="container text-center">
                                    <span class="fa fa-refresh fa-spin fa-3x" id="loader" style="display:none"></span>
                                    <h4 id="loader1" style="display:none">Please wait form submitting </h4>
                                </div>
                                <button type="submit " class="btn btn-primary " id="submit-btn">Submit</button>
                            </form>
                        </div>
                        <div class="card-footer">

                        </div>
                    </div>
                </div>
            </div>
        </main>
        <br>
        <br>
        <!-- JavaScript and jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded......");
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);


                    $("#submit-btn").hide();
                    $("#loader").show();
                    $("#loader1").show();
//                ..send register servlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);

                            $("#submit-btn").show();
                            $("#loader").hide();
                            $("#loader1").hide();

                            if (data.trim() === 'done')
                            {

                                swal({
                                    title: "Are you sure?",
                                    text: "Once deleted, you will not be able to recover this imaginary file!",
                                    icon: "warning",
                                    buttons: true,
                                    dangerMode: true,
                                })
                                        .then((willDelete) => {
                                            if (willDelete) {
                                                swal("Poof! Your imaginary file has been deleted!", {
                                                    icon: "success",
                                                }).then(()=>{
                                                    window.location ="login.jsp";
                                                });
                                            } else {
                                                swal("Your imaginary file is safe!");
                                            }
                                            
                                        });
                            } else
                            {

                                swal(data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");

                        },
                        processData: false,
                        contentType: false

                    });



                });


            });
        </script>


    </body>
</html>
