package com.min.iamport;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.dao.PayDao;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.siot.IamportRestClient.response.PaymentBalance;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping(value = "/payment/**")
public class IamportController {
	IamportClient client;
	
	@Autowired
	private PayDao dao;
	
	public IamportController() {
		this.client = this.getTestClient();
	}

	IamportClient getTestClient() {
		String test_api_key = "6254766231323012";
		String test_api_secret = "pPahPWfgL5Xjc0j1CQgSNRxcOYIV6CpwrzNhw3xi8vBlwVn9LD1zuzMjxveE7EazeYQL2o3bUFxqAUzm";
		return new IamportClient(test_api_key, test_api_secret);
	}
	
	void getToken() {
		try {
			IamportResponse<AccessToken> auth_response = client.getAuth();
			assertNotNull(auth_response.getResponse());
			assertNotNull(auth_response.getResponse().getToken());
			
			System.out.println("get token str: " + auth_response.getResponse().getToken());
			
		}catch(IamportResponseException e){
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 : System.out.println("401");break;
			case 500 : System.out.println("500");break;
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	//결제 및 insert
	@PostMapping("pay.do")
	public void getPay(String merchant_uid, String imp_uid,String payRow,String payDiscount,int payUmilage,String payCounum) {
		System.out.println("merchant_uid 는 ?? : " + merchant_uid);
		System.out.println("imp_uid는 ?? : " + imp_uid); //주문번호
		
		try {
			//payco와 kcp만 지원
			//카카오페이의 경우 pay_response를 활용
			//IamportResponse<PaymentBalance> payment_response = client.paymentBalanceByImpUid(test_Imp_uid);
			IamportResponse<Payment> pay_response = client.paymentByImpUid(imp_uid);
			
			System.out.println(pay_response.getResponse().getMerchantUid()); //주문번호 o
			System.out.println(pay_response.getResponse().getBuyerName()); //구매자이름 o
			System.out.println(pay_response.getResponse().getName()); // 주문명 o
			System.out.println(pay_response.getResponse().getAmount()); // 가격 o
			System.out.println(pay_response.getResponse().getStatus()); // 주문상태 o
			System.out.println(pay_response.getResponse().getPayMethod()); // 결제수단 o
			System.out.println(pay_response.getResponse().getPaidAt()); // 결제시각 o
			System.out.println(pay_response.getResponse().getPgProvider()); //payco (pg사)
			System.out.println(pay_response.getResponse().getPgTid()); // 20220517

//			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//			String formatData = simpleDateFormat.format(pay_response.getResponse().getPaidAt());
//			System.out.println(formatData + "변환된 날짜"); 
			
			Map<String, Object> map= new HashMap<String, Object>();
			map.put("pay_num", pay_response.getResponse().getImpUid()); // 주문번호
			map.put("pay_tra_buyer","thdwndrl1234"); // 구매자아이디 : 세션값 받아오기
			map.put("pay_cla_num", "CLA003"); // 과정번호 : 결제 페이지에서 전송
			map.put("pay_price", pay_response.getResponse().getAmount()); //가격
			map.put("pay_method", pay_response.getResponse().getPayMethod()); //결제수단
			map.put("pay_pg", pay_response.getResponse().getPgProvider()); // payco(pg사)
			map.put("pay_status", "결제"); //결제상태(결제,환불대기,환불승인)
			map.put("pay_date", pay_response.getResponse().getPaidAt()); //결제일자
			map.put("pay_content", pay_response.getResponse().getName()); //결제명
			map.put("pay_raw", payRow);	//결제페이지에서 전송
			map.put("pay_discount", payDiscount);	//결제페이지에서 전송
			map.put("pay_candate", "");
			map.put("pay_cancate", "");
			map.put("pay_cancontent", "");
			if(payUmilage == 0) {
				map.put("pay_ucounum", "");
			}else {
				map.put("pay_ucounum", payCounum);
			}
			if(payUmilage == 0) {
				map.put("pay_umilage", "");
			}else {
				map.put("pay_umilage", payUmilage);
			}
			
			
			
			//insert 가자
			int n = dao.payInsert(map);
			System.out.println(n + "@@@!!@@@@@@@@");
			
		} catch (IamportResponseException e) {
			
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401: System.out.println("401임다");break;
			case 500: System.out.println("500임다");break;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//vo로 넣어서 db 저장? or Map 넣어서 db 저장
		this.getToken();
	}
	
	//환불 승인.
	@RequestMapping(value = "cancel.do", method = RequestMethod.POST)
	public String testCancelPaymentAlreadyCancelledImpUid() {
        String test_already_cancelled_imp_uid = "imp_317120240807";
        CancelData cancel_data = new CancelData(test_already_cancelled_imp_uid, true); //imp_uid를 통한 전액취소
        System.out.println("환불 ok~");
        try {
            IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
           
            if(payment_response.getResponse() == null) {
            	System.out.println("이미 처리된 환불입니다.!!");
            }
//            assertNull(payment_response.getResponse()); // 이미 취소된 거래는 response가 null이다
        } catch (IamportResponseException e) {
            System.out.println(e.getMessage());

            switch (e.getHttpStatusCode()) {
                case 401:
                    //TODO
                    break;
                case 500:
                    //TODO
                    break;
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "nextpage";
    }
	
	@RequestMapping(value = "moveNext.do" ,method = RequestMethod.GET)
	public String nextPage() {
		System.out.println("NEXTPAGE 진입");
		return "nextpage";
	}
	
	//주문조회
	@PostMapping("payInfo.do")
	@ResponseBody
	public String getPayInfo() {
		
		String test_Imp_uid = "imp_422570689158"; //payco 주문 아이디
		
		try {
			//payco와 kcp만 지원
			//카카오페이의 경우 pay_response를 활용
			//IamportResponse<PaymentBalance> payment_response = client.paymentBalanceByImpUid(test_Imp_uid);
			IamportResponse<Payment> pay_response = client.paymentByImpUid(test_Imp_uid);
			
			System.out.println(pay_response.getResponse().getMerchantUid()); //주문번호 o
			System.out.println(pay_response.getResponse().getBuyerName()); //구매자이름 o
			System.out.println(pay_response.getResponse().getName()); // 주문명 o
			System.out.println(pay_response.getResponse().getAmount()); // 가격 o
			System.out.println(pay_response.getResponse().getStatus()); // 주문상태 o
			System.out.println(pay_response.getResponse().getPayMethod()); // 결제수단 o
			System.out.println(pay_response.getResponse().getPaidAt()); // 결제시각 o
			
		} catch (IamportResponseException e) {
			
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401: System.out.println("401임다");break;
			case 500: System.out.println("500임다");break;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
}
