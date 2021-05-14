package first.home.controller;


import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
 
@Controller // 현재의 클래스를 controller bean에 등록시킴
public class homeController {
	
	// @Inject
    // MainService MainService;

    @RequestMapping("home/sunhome.do") // 컨트롤러의 클래스를 불러올 url (별칭) home/sunhome.do home/sunhome /home/sunhome.do /home/sunhome 다 됨
    public String homeScreen(){
        return "home/home"; // jsp
    }

    @RequestMapping("home/about.do") // 컨트롤러의 클래스를 불러올 url (별칭)
    public String aboutScreen(){
        return "Temporary/about"; // jsp
    }
    
    @RequestMapping("home/contact.do") 
    public String contactScreen(){
        return "home/contact"; // jsp
    }
    
    @Autowired
    private JavaMailSender mailSender;

	// mailSending 코드
	@RequestMapping(value = "home/mailSending.do")
	@ResponseBody
	public String mailSending(HttpServletRequest request) {

		String tomail = "aboutdaybreak@gmail.com";
		String setfrom = request.getParameter("contactEmail"); // 받는 사람 이메일
		String title = request.getParameter("contactSubject"); // 제목
		String content = request.getParameter("contactMessage"); // 내용
		String name = request.getParameter("contactName"); // 이름
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText("보낸사람 이름 : " + name + "     보낸사람 이메일 : " + setfrom + "     내용 : " + content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "redirect:/home/contact.do";
	}
    
}