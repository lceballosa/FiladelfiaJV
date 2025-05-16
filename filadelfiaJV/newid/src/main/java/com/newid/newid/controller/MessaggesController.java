package com.newid.newid.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@RestController
public class MessaggesController {

        @GetMapping(value = "/sendSMS")
        public ResponseEntity<String> sendSMS() {

                Twilio.init(System.getenv("MG939098732cd965a0b1a573ee359b494a"), System.getenv("BBMBQ94R9C5CKZV61SPR3RAW"));

                Message.creator(new PhoneNumber("+573002956655"),
                                new PhoneNumber("+19786725636"), "Hello from Twilio 📞").create();

                return new ResponseEntity<String>("Message sent successfully", HttpStatus.OK);
        }
}
