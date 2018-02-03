package com.iswfe.dubbo.provider;

import com.qf.pojo.Content;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface SearchMealService {

	List<Content> searchByPage(String keyword, Integer page, Integer pageSize);

}