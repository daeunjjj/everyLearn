package com.coding5.el.admin.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Balance;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.model.StorageType;
import net.nurigo.sdk.message.request.MessageListRequest;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.MessageListResponse;
import net.nurigo.sdk.message.response.MultipleDetailMessageSentResponse;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.coding5.el.common.randomNum.RandomNumber;

import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.io.IOException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
@Slf4j
@RestController
public class SmsController {

    final DefaultMessageService messageService;

    public SmsController() {
        this.messageService = NurigoApp.INSTANCE.initialize("NCSTE2MQBOGNBXAV", "2X9IKSTZODVK6HJFSUOJYKLIGJD0HOGD", "https://api.coolsms.co.kr");
    }


    /**
     * 단일 메시지 발송 예제
     */
    @PostMapping("admin/send")
    public String sendOne(String phoneNumber) {
    	
//    	String sendNumber = phoneNumber.replaceAll("[-]", "");
//    	log.info(sendNumber);
        
    	String randomNum = RandomNumber.randomNumber();
    	
//    	Message message = new Message();
//        // 하이픈 없이
//        message.setFrom("01027250769");
//        message.setTo(sendNumber);
//        message.setText("에브리런 인증번호를 입력하세요!\n"
//        		+ "["+randomNum+"]");
//
//        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
//        log.info("결과 ::: " + response);
        
        return randomNum;
    }
}

