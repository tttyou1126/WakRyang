package first.member.controller;
 
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    
    @RequestMapping("member/register.do") // 컨트롤러의 클래스를 불러올 url (별칭)
    public String register(){
        return "member/member_register"; // jsp
    }    
    
    @RequestMapping("member/insert.do")
    // * 폼에서 입력한 데이터를 받아오는 법 3가지 
    //public String memberInsert(HttpServlet request){
    //public String memberInsert(String userId, String userPw, String userName, String userEmail){
    public String memberInsert(@ModelAttribute MemberVO vo){
        // 테이블에 레코드 입력 
        memberService.insertMember(vo);
        // * (/)의 유무에 차이
        // /member/list.do : 루트 디렉토리를 기준
        // member/list.do : 현재 디렉토리를 기준
        // member_list.jsp로 리다이렉트
        return "redirect:/main/loginScreen.do";
    }
    
}