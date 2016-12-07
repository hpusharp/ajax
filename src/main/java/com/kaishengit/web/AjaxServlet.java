package com.kaishengit.web;

import com.kaishengit.util.HttpUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by shibo on 2016/12/6.
 */
@WebServlet("/ajax")
public class AjaxServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       //获取客户端的数据
        String name = req.getParameter("name");
        // 将数据转码成中文
        name = new String(name.getBytes("ISO8859-1"),"UTF-8");

        //声明禁止浏览器缓存结果的响应头
        resp.setHeader("pragma","no-cache");
        resp.setHeader("cache-control","no-cache");
        resp.setHeader("expries","0");

        System.out.println("Hello,Ajax doget !!!" + name);

        PrintWriter out = resp.getWriter();
        out.print("Hello,网页");
        out.flush();
        out.close();


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //表单提交（post）含中文
        req.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        System.out.println("获取客户端的值" + name);
        //设置响应编码
        resp.setCharacterEncoding("UTF-8");
        //设置响应内容（纯字符串）
        resp.setContentType("text/plain,charset=UTF-8");

        PrintWriter out = resp.getWriter();
        if("tom".equals(name)) {
            System.out.println("账号被占用");
            out.print("No");
        }else  {
            System.out.println("账号能用");
            out.print("yes");
        }
        System.out.println("hello,Ajax dopost" + name);

        out.flush();
        out.close();

    }
}
