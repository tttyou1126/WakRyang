package first.home.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller // 현재의 클래스를 controller bean에 등록시킴
public class homeController {
	
	// @Inject
    // MainService MainService;

    @RequestMapping("home/home.do") // 컨트롤러의 클래스를 불러올 url (별칭) home/home.do home/home /home/home.do /home/home 다 됨
    public String homeScreen(){
        return "home/home"; // jsp
    }

    @RequestMapping("home/about.do") // 컨트롤러의 클래스를 불러올 url (별칭)
    public String aboutScreen(){
        return "Temporary/about"; // jsp
    }
}