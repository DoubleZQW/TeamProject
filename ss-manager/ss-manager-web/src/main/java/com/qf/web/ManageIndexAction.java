package com.qf.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManageIndexAction {

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String toIndex(){
        return "index";
    }

    @RequestMapping(value = "/{page}", method = RequestMethod.GET)
    public String page(@PathVariable("page") String page) {
        return page;
    }
}
