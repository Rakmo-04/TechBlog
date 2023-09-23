<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="java.sql.*"%>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>

<%@page import="com.tech.blog.entities.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!-- CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="styles.css">
        <style>
            .banner-background {
                clip-path: polygon(0% 0%, 100% 0%, 100% 75%, 100% 100%, 93% 89%, 68% 100%, 0 100%);
            }
            /* Additional styles for the login form */
            .card {
                margin-top: 50px;
                border: none;
            }
            .card-header {
                background-color: #607d8b;
                color: white;
                text-align: center;
            }
            .primary-background{
                background:#607d8b;
            }

        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>

        <main class="d-flex align-items-center primary-background banner-background" style="height: 80vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <h3>Login</h3>
                            </div>

                            <%
                            Message m = (Message)session.getAttribute("msg");
                            if(m!=null){
                            %>
                            <div class="alert <%=m.getCssClass()%>" role="alert">
                                <%= m.getContent() %>
                            </div>
                            <%
                                session.removeAttribute("msg");
                                }
                                
                            %>

                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="inputEmail3">Email</label>
                                        <input name="email" required type="email" class="form-control" id="inputEmail3" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword3">Password</label>
                                        <input name="password" required type="password" class="form-control" id="inputPassword3" placeholder="Password">
                                    </div>
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary btn-block" style="background-color: #607d8b;">Sign in</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- JavaScript and jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
