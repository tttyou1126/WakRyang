package first.home.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller // 현재의 클래스를 controller bean에 등록시킴
public class homeController {
	
	// @Inject
    // MainService MainService;

    @RequestMapping("home/home.do") // 컨트롤러의 클래스를 불러올 url (별칭)
    public String loginScreen(){
        return "home/home"; // jsp
    }

}