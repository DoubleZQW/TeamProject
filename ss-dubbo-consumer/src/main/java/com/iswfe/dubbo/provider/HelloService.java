package com.iswfe.dubbo.provider;

import org.springframework.stereotype.Component;

@Component
public interface HelloService {
	String hello(String str);
}
