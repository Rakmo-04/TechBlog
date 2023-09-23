package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            //login
            //fetch username and password from request
            
            String userName = request.getParameter("email");
            
            String userPassword = request.getParameter("password");
            
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            
            User u =dao.getUserByEmailAndPassword(userName, userPassword);
            
            if(u == null){
                //login error
//                out.println("Invalid Details ! Try again");
                Message msg = new Message("Invalid Details! Try again","error","alert-danger");
                
                HttpSession s = request.getSession();
                s.setAttribute("msg",msg);
                
                response.sendRedirect("login.jsp");
            }else{
                //....
                //login success
                HttpSession s = request.getSession();
                s.setAttribute("currentUser",u);
                response.sendRedirect("profile.jsp");
            }
            
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
