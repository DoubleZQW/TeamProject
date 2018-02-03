package com.iswfe.dubbo.provider;

import com.qf.vo.TbSearchMealResult;
import org.springframework.stereotype.Component;

@Component
public interface SearchMealIndexService {

	TbSearchMealResult searchIndex(String keyword, Integer page, Integer rows) throws Exception;
}