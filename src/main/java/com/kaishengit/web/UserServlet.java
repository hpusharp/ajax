package com.kaishengit.web;

import com.kaishengit.entity.User;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

/**
 * Created by shibo on 2016/12/6.
 */
@WebServlet("/user.xml")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User("jack","上海",1);
        User user1 = new User("tom","北京",2);
        User user2 = new User("lilei","广州",3);

        List<User> userList = Arrays.asList(user,user1,user2);

        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/xml");

        PrintWriter out = resp.getWriter();
        out.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        out.print("<users>");
        for(User u : userList) {
            out.print("<user id=\""+u.getId()+"\">");
            out.print("<name>"+u.getUsername()+"</name>");
            out.print("<address>"+u.getAddress()+"</address>");
            out.print("</user>");
        }
        out.print("</users>");
        out.flush();
        out.close();

    }
}
