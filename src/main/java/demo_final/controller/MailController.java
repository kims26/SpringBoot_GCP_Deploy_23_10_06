package demo_final.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import demo_final.service.Mailservice;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MailController {

    private final Mailservice mailService;

    @RequestMapping("/mail")
    @ResponseBody
    public String MailSend(String mail){
       int number = mailService.sendMail(mail);

       String num = "" + number;

       return num;
    }

}
