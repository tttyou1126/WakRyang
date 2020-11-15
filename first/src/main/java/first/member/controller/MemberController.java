package first.member.controller;
 
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.member.service.MemberService;
import first.member.vo.MemberVO;
 
@Controller // 현재의 클래스를 controller bean에 등록시킴
public class MemberController {
    // MemberService 객체를 스프링에서 생성하여 주입시킴
    @Inject // @Inject는 자바, @Autowired는 스프링 제공
    MemberService memberService;
    // 01 회원 목록
    // url pattern mapping
    @RequestMapping("member/list.do") // 컨트롤러의 클래스를 불러올 url (별칭)
    public String memberList(Model model){
    // controller => service => dao => sql => vo 요청
        List<MemberVO> list = memberService.memberList();
        model.addAttribute("list", list);
        return "member/member_list"; // jsp
    }
}