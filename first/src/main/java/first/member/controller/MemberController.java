package first.member.controller;
 
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import first.member.service.MemberService;
import first.member.vo.MemberVO;
 
@Controller // 현재의 클래스를 controller bean에 등록시킴
public class MemberController {
	Log log = LogFactory.getLog(this.getClass());
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
    
    @RequestMapping("member/view.do")
    public String memberView(String userId, Model model){
        // 회원 정보를 model에 저장
        model.addAttribute("dto", memberService.viewMember(userId));
        //System.out.println("클릭한 아이디 확인 : "+userId);
        log.debug("클릭한 아이디 : "+userId);
        // member_view.jsp로 포워드
        return "member/member_view";
    }
    
    @RequestMapping("member/update.do")
    public String memberUpdate(@ModelAttribute MemberVO vo){
        memberService.updateMember(vo);
        return "redirect:/member/list.do";
    }
    /*
    @RequestMapping("member/delete.do")
    public String memberDelete(@RequestParam String userId, @RequestParam String userPw, Model model){
    	boolean result = memberService.checkPw(userId, userPw);
        if(result){ // 비밀번호가 맞다면 삭제 처리후, 전체 회원 목록으로 리다이렉트
            memberService.deleteMember(userId);
            return "redirect:/member/list.do";
        } else { // 비밀번호가 일치하지 않는다면, div에 불일치 문구 출력, viwe.jsp로 포워드
            model.addAttribute("message", "비밀번호 불일치");
            model.addAttribute("dto", memberService.viewMember(userId));
            return "member/member_list";
        }
    }
    */
    
    @RequestMapping("member/delete.do")
    public String memberDelete(String userId){
    	memberService.deleteMember(userId);
        //System.out.println("클릭한 아이디 확인 : "+userId);
        log.debug("삭제 원하는 아이디 : "+userId);
        return "redirect:/member/list.do";
    }
}