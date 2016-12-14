package com.kaishengit.dao;

import com.kaishengit.entity.Message;
import com.kaishengit.util.DbHelp;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.util.List;

/**
 * Created by shibo on 2016/12/10.
 */
public class MessageDao {
    public List<Message> findByMaxId(Integer id) {
        String sql = "select * from t_message where id > ? order by id desc";
        return DbHelp.query(sql,new BeanListHandler<>(Message.class),id);
    }
}
