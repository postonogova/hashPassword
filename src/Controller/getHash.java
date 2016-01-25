package Controller;

import Model.Hashing;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/getHash")
public class getHash extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        response.setContentType("text/plain; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        String password = request.getParameter("password");
        String salt = request.getParameter("salt");
        String alg = request.getParameter("alg");
        String hex = Hashing.getHash(password, salt, alg);
        response.getWriter().write(hex);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
