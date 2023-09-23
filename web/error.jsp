

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>"Oops! We Hit a Snag: Our Apologies for the Inconvenience"</title>
        
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
        
        <div class="container text-center ">
            <img src="images/browser.png" class="img-fluid">
            <h3 class="display-3">Sorry! Something went wrong..</h3>
            <%= exception%>
            <a href="index.jsp" class="btn btn-primary btn-lg text-white mt-3 mb-5">Home</a>
            <br>
        </div>
    </body>
</html>
