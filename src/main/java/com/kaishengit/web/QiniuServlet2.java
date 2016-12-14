package com.kaishengit.web;

import com.qiniu.util.Auth;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by shibo on 2016/12/12.
 */
@WebServlet("/qiniu2")
public class QiniuServlet2 extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ak = "EnGJsq5Q6zZri0ASQCYUET0vBzaAzzaXS9R_wnTM";
        String sk = "ZsLKp5jWtiOz0AkS-HHhjusArla9y_BwSX70CIam";
        String bucketName = "picture";

        Auth auth = Auth.create(ak,sk);

        String token = auth.uploadToken(bucketName);

        req.setAttribute("id",1111);
        req.setAttribute("token",token);
        req.getRequestDispatcher("upload_qiniu.jsp").forward(req,resp);

    }
}
