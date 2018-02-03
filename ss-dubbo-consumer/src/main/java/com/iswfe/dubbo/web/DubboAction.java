package com.iswfe.dubbo.web;

import com.iswfe.dubbo.provider.HelloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DubboAction {

	@Autowired
	private HelloService helloService;

	@ResponseBody
	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String helloDubbo(String str) {
		return helloService.hello(str);
	}
}
