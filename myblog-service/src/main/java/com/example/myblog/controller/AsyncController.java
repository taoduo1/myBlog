package com.example.myblog.controller;

import com.example.myblog.service.AsyncService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/async")
public class AsyncController {

    @Resource
    private AsyncService asyncService;

    @GetMapping("/asy")
    public void asy(){
        asyncService.executeAsync();
    }
}
