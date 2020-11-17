package first.main.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller // 현재의 클래스를 controller bean에 등록시킴
public class MainController {
	
	// @Inject
    // MainService MainService;

    @RequestMapping("main/loginScreen.do") // 컨트롤러의 클래스를 불러올 url (별칭)
    public String loginScreen(){
        return "main/loginScreen"; // jsp
    }

}