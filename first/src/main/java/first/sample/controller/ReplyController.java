package first.sample.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import first.sample.service.ReplyService;
import first.sample.vo.ReplyVO;

@Controller
public class ReplyController {
	@Inject
	ReplyService replyService;

    @RequestMapping("reply/insert.do")
    @ResponseBody
    public void insert(@ModelAttribute ReplyVO vo, HttpSession session){
        String userId = (String) session.getAttribute("userId");
        vo.setReplyer(userId);
        replyService.create(vo);
    }
    
    
 // 1_2. 댓글입력 (@RestController방식으로 json전달하여 댓글입력)
    // @ResponseEntity : 데이터 + http status code
    // @ResponseBody : 객체를 json으로 (json - String)
    // @RequestBody : json을 객체로
    @RequestMapping(value="reply/insertRest.do", method=RequestMethod.POST)
    public ResponseEntity<String> insertRest(@RequestBody ReplyVO vo, HttpSession session){
        ResponseEntity<String> entity = null;
        try {
            // 세션에 저장된 회원아이디를 댓글작성자에 세팅
            String userId = (String) session.getAttribute("userId");
            vo.setReplyer(userId);
            // 댓글입력 메서드 호출
            replyService.create(vo);
            // 댓글입력이 성공하면 성공메시지 저장
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 댓글입력이 실패하면 실패메시지 저장
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 입력 처리 HTTP 상태 메시지 리턴
        return entity;
    }
    

    // 댓글 목록(@RestController Json방식으로 처리 : 데이터를 리턴)
    @RequestMapping("reply/listJson.do")
    @ResponseBody // 리턴데이터를 json으로 변환(생략가능)
    public List<ReplyVO> listJson(@RequestParam int IDX, HttpSession session){
        List<ReplyVO> list = replyService.list(IDX, session);
        return list;
    }	
    
    
    // 2_3. 댓글 목록(@RestController방식 :  json으로 전달하여 목록생성)
    // /reply/list/1 => 1번 게시물의 댓글 목록 리턴
    // /reply/list/2 => 2번 게시물의 댓글 목록 리턴
    // @PathVariable : url에 입력될 변수값 지정
    @RequestMapping(value="reply/list/{IDX}.do", method=RequestMethod.GET)
    @ResponseBody
    public ModelAndView replyList(@PathVariable int IDX, ModelAndView mav, HttpSession session){
       
        List<ReplyVO> list = replyService.list(IDX, session);
        // 뷰이름 지정
        mav.setViewName("sample/replyList");
        // 뷰에 전달할 데이터 지정
        mav.addObject("list", list);
        // replyList.jsp로 포워딩
        return mav;
    }
    
    
    
    // 3. 댓글 상세 보기
    // /reply/detail/1 => 1번 댓글의 상세화면 리턴
    // /reply/detail/2 => 2번 댓글의 상세화면 리턴
    // @PathVariable : url에 입력될 변수값 지정
    @RequestMapping(value="reply/detail/{replyidx}.do", method=RequestMethod.GET)
    public ModelAndView replyDetail(@PathVariable("replyidx") Integer replyidx, ModelAndView mav){
        ReplyVO vo = replyService.detail(replyidx);
        // 뷰이름 지정
        mav.setViewName("sample/replyDetail");
        // 뷰에 전달할 데이터 지정
        mav.addObject("vo", vo);
        // replyDetail.jsp로 포워딩
        return mav;
    }
    
    // 4. 댓글 수정 처리 - PUT:전체 수정, PATCH:일부수정
    // RequestMethod를 여러 방식으로 설정할 경우 {}안에 작성
    @RequestMapping(value="reply/update/{replyidx}.do", method={RequestMethod.PUT})
    public ResponseEntity<String> replyUpdate(@PathVariable("replyidx") Integer replyidx, @RequestBody ReplyVO vo){
        ResponseEntity<String> entity = null;
        try {
            vo.setreidx(replyidx);
            replyService.update(vo);
            // 댓글 수정이 성공하면 성공 상태메시지 저장
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 댓글 수정이 실패하면 실패 상태메시지 저장
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 수정 처리 HTTP 상태 메시지 리턴
        return entity;
    }
    
    // 5. 댓글 삭제처리
    @RequestMapping(value="reply/delete/{rno}.do")
    public ResponseEntity<String> replyDelete(@PathVariable("rno") Integer rno){
        ResponseEntity<String> entity = null;
        try {
            replyService.delete(rno);
            // 댓글 삭제가 성공하면 성공 상태메시지 저장
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 댓글 삭제가 실패하면 실패 상태메시지 저장
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 삭제 처리 HTTP 상태 메시지 리턴
        return entity;
    }

   
}
