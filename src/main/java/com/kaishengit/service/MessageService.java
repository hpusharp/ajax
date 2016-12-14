package com.kaishengit.service;

import com.kaishengit.dao.MessageDao;
import com.kaishengit.entity.Message;

import java.util.List;

/**
 * Created by shibo on 2016/12/10.
 */
public class MessageService {
    private MessageDao messageDao = new MessageDao();
    public   List<Message> findByMaxId(Integer id) {
        return messageDao.findByMaxId(id);
    }
}
