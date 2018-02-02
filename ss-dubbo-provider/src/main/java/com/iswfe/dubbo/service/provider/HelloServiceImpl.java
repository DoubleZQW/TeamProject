package com.iswfe.dubbo.service.provider;

import com.iswfe.dubbo.service.HelloService;

public class HelloServiceImpl implements HelloService {

	@Override
	public String hello(String str) {
		return "你好啊! "+ str;
	}
}
