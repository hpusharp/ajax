package com.kaishengit;

import com.google.gson.Gson;
import com.kaishengit.entity.User;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by shibo on 2016/12/6.
 */
public class Test {
    public static void main(String[] args) {
        /*User user = new User("jack","shanghai",1);
        User user1 = new User("lisi","guangzhou",2);

        List<User> list = new ArrayList<>();
        list = Arrays.asList(user,user1);
        Gson gson = new Gson();
        String json = gson.toJson(list);

        System.out.println(json);*/

        List<String> list = new ArrayList<>();
        list = Arrays.asList("rose","jack","mary");
        String json = new Gson().toJson(list);
        System.out.println(json);

    }

}
