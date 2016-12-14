package com.kaishengit.web;

import com.google.gson.Gson;
import com.kaishengit.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
 * Created by shibo on 2016/12/10.
 */
@WebServlet("/jsonp")
public class JsonpServlet extends BasicServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");

        User user = new User("张三","河北",1);
        User user1 = new User("李四","河南",2);
        User user2 = new User("赵武","山东",3);

        List<User> userList = new ArrayList<>();
        userList = Arrays.asList(user,user1,user2);

        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=UTF-8");

        Gson gson = new Gson();
        String json = gson.toJson("userlist");

        PrintWriter out = resp.getWriter();
        out.print(method + "("+json+ ")");//callback({userlist})
        out.flush();
        out.close();

    }
}
