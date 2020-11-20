package first.sample.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.sample.service.SampleService;
import first.sample.vo.BoardVO;

@Controller
public class SampleController {
	Log log = LogFactory.getLog(this.getClass());
	@Resource(name = "sampleService")
	private SampleService sampleService;
	
	@RequestMapping("main/main.do")
	public String openSampleBoardList1(Model model) throws Exception {
		List<BoardVO> list = sampleService.boardList();
		model.addAttribute("list", list);
		return "main/main";
	}
	
	@RequestMapping("sample/board.do")
	public String openSampleBoardList(Model model) throws Exception {
		List<BoardVO> list = sampleService.boardList();
		model.addAttribute("list", list);
		return "sample/boardList";
	}	
	
	/*
	@RequestMapping("main/main.do")
	public String openSampleBoardList(Model model) throws Exception {
		List<BoardVO> list = boardService.listAll();
        // ModelAndView - 모델과 뷰
        ModelAndView mav = new ModelAndView();
        mav.setViewName("board/list"); // 뷰를 list.jsp로 설정
        mav.addObject("list", list); // 데이터를 저장
        return mav; // list.jsp로 List가 전달된다.
	}
	*/
	
	@RequestMapping(value = "/sample/testMapArgumentResolver.do")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("");
		if (commandMap.isEmpty() == false) {
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		return mv;
	}

	
	@RequestMapping("sample/writeScreen.do")
	public String writeBoardScreen() throws Exception {
		return "sample/boardWrite";
	}	
	
	@RequestMapping("sample/writeBoard.do")
	public String writeBoard(@ModelAttribute BoardVO vo) throws Exception {
		sampleService.writeBoard(vo);
		return "redirect:/sample/board.do";
	}		
	
	@RequestMapping("sample/viewBoard.do")
	public String viewBoard(int IDX, Model model) throws Exception {
		model.addAttribute("dto", sampleService.viewBoard(IDX));
		return "sample/boardDetail";
	}
	
	@RequestMapping("sample/updateScreen.do")
	public String updateBoardScreen(int IDX, Model model) throws Exception {
		model.addAttribute("dto", sampleService.updateBoardScreen(IDX));
		return "sample/boardUpdate";
	}	
	
	@RequestMapping("sample/updateBoard.do")
	public String updateBoard(@ModelAttribute BoardVO vo) throws Exception {
		sampleService.updateBoard(vo);
		return "redirect:/sample/board.do";
	}	
	
	
	@RequestMapping("sample/deleteBoard.do")
	public String deleteBoard(int IDX) throws Exception {
		sampleService.deleteBoard(IDX);
		return "redirect:/sample/board.do";
	}		

   
}
