package first.sample.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
    
    // 댓글 목록(@Controller방식 : veiw(화면)를 리턴)
    @RequestMapping("reply/list.do")
    public ModelAndView list(@RequestParam int IDX, ModelAndView mav, HttpSession session){
        List<ReplyVO> list = replyService.list(IDX, session);
        // 뷰이름 지정
        mav.setViewName("board/replyList");
        // 뷰에 전달할 데이터 지정
        mav.addObject("list", list);
        // replyList.jsp로 포워딩
        return mav;
    }
    
    // 댓글 목록(@RestController Json방식으로 처리 : 데이터를 리턴)
    @RequestMapping("reply/listJson.do")
    @ResponseBody // 리턴데이터를 json으로 변환(생략가능)
    public List<ReplyVO> listJson(@RequestParam int IDX, HttpSession session){
        List<ReplyVO> list = replyService.list(IDX, session);
        return list;
    }	

   
}
