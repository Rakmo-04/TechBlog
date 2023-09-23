

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechBlog</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
          
        <style>
            .banner-background{
               clip-path: polygon(0% 0%, 100% 0%, 100% 75%, 100% 100%, 93% 89%, 68% 100%, 0 100%);
            }
        </style>
    </head>
    <body>
        
        
        <%@include file="normal_navbar.jsp" %>
        
        <!--//banner-->
        <div class="container-fluid p-0 m-0 banner-background">
            
            <div class="jumbotron ">
                <div class="container"> 
                    <h3 class="display-3">Welcome to TechBlog </h3>
                <p>"Welcome to our tech blog, your go-to source for the latest in cutting-edge technology trends and insightful tech-related articles."</p>
                <p>Explore our tech blog to stay updated on emerging technologies, discover practical tips, and dive deep into thought-provoking discussions on the ever-evolving world of technology. Whether you're a tech enthusiast, a seasoned IT professional, or simply curious about the digital landscape, our blog has something for everyone."</p>
                <button class="btn btn-outline-dark btn-lg"> <span class="fa fa-binoculars"></span> Explore Now!!</button>
                <a href="login.jsp" class="btn btn-outline-dark btn-lg"> <span class="fa fa-user fa-spin"></span> Login</a>
                </div>
            </div>
            
        </div>
        
        <!--//cards-->
        <div class="container">
            <div class="row ">
                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">JAVA Programming </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                       </div>
                    </div>
                    
                </div>
                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">JAVA Programming </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                       </div>
                    </div>
                    
                </div>
                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">JAVA Programming </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                       </div>
                    </div>
                    
                </div>
                
            </div>
                        <div class="row">
                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">JAVA Programming </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                       </div>
                    </div>
                    
                </div>
                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">JAVA Programming </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                       </div>
                    </div>
                    
                </div>
                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body">
                            <h5 class="card-title">JAVA Programming </h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                       </div>
                    </div>
                    
                </div>
                
            </div>
            
  
        </div>
        
        <!--javascripy-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
//            $(document).ready(function(){
//                swal("Welcome to TechBlog!!");
//            })
        </script>
    </body>
</html>
