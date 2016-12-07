package com.kaishengit.web;



import com.google.gson.Gson;
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
@WebServlet("/data.json")
public class JsonDataServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json,charset=UTF=8");

        //String json = "{\"id\":1,\"name\":\"zhangsan\",\"address\":\"beijing\"}";
        User user = new User("张三","上海",1);
        User user1 = new User("李四","北京",2);
        User user2 = new User("赵武","广州",3);




        List<User> list = Arrays.asList(user,user1,user2);
        Gson gson = new Gson();
        String json = gson.toJson(list);


        PrintWriter out = resp.getWriter();
       // out.print("{\"id\":1,\"name\":\"jack\",\"address\":\"shanghai\"}");
        out.print(json);
        out.flush();
        out.close();
    }
}
