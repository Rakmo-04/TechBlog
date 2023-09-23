package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.helper;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession.*;
import jakarta.servlet.http.Part;
import java.io.File;
import jakarta.servlet.http.*;

@MultipartConfig
@WebServlet(name = "EditServlet", urlPatterns = {"/EditServlet"})
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use the following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            // In your EditServlet class
// ...
            String userEmail = request.getParameter("user_email");
            String userName = request.getParameter("user_name");
            String userPassword = request.getParameter("user_password");
            String userAbout = request.getParameter("user_about");
            Part part = request.getPart("image");

            String imageName = part.getSubmittedFileName();

// Check if userName is null or empty
            if (userName != null && !userName.isEmpty()) {
                //get the user from the session
                HttpSession s = request.getSession();
                User user = (User) s.getAttribute("currentUser");
                user.setEmail(userEmail);
                user.setName(userName);
                user.setAbout(userAbout);
                String oldFile = user.getProfile();
                user.setProfile(imageName);

                //update the new data in the database
                UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                boolean ans = userDao.updateUser(user);
                if (ans) {
                    out.println("Updated to Database");
                    out.println();
                    ServletContext context = getServletContext();
                    String realPath = context.getRealPath("/");
                    out.println("Profile Updated...");
                        Message msg = new Message("Profile details Updated..", "success", "alert-success");

                        s.setAttribute("msg", msg);

                        

                    String path = realPath + File.separator + "pics" + File.separator + user.getProfile();

                    //delete code
                    String pathOldFile = realPath + File.separator + "pics" + File.separator + oldFile;
                    
                    if(!oldFile.equals("default.png")){
                    helper.deleteFile(pathOldFile);
                    }
                    if (helper.saveFile(part.getInputStream(), path)) {
                        out.println("Profile Updated...");
                         msg = new Message("Profile details Updated..", "success", "alert-success");

                        s.setAttribute("msg", msg);

                        
                    } else {
                       
                    }

                } else {
                        Message msg = new Message("Something went wrong!!", "error", "alert-danger");

                        s.setAttribute("msg", msg);

                        
                        out.println("Profile not Updated");
                    
                }
            } else {
                out.println("User name cannot be null or empty.");
            }
// ...     
            response.sendRedirect("profile.jsp");
           

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
