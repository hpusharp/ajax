package com.kaishengit.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by shibo on 2016/12/10.
 */
@WebServlet("/checkemail")
public class CheckEmailServlet extends BasicServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String email = req.getParameter("mail");
        System.out.println("email:"+ email);

        PrintWriter out = resp.getWriter();
        if("tom@qq.com".equals(email)) {
            out.print("false");
        }else {
            out.print("true");
        }
        out.flush();
        out.close();
    }
}
