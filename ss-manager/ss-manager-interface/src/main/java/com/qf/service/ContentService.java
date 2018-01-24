package com.qf.service;

import com.qf.pojo.Content;

import java.util.List;

public interface ContentService {
    List<Content> getContentListByCid(Integer cid);
}
