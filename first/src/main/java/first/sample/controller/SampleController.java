package first.sample.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.sample.service.SampleService;
import first.sample.vo.BoardPager;
import first.sample.vo.BoardVO;

@Controller
public class SampleController {
	Log log = LogFactory.getLog(this.getClass());
	@Resource(name = "sampleService")
	private SampleService sampleService;

	@RequestMapping("sample/board.do")
	public ModelAndView BoardList(@RequestParam(defaultValue="title") String searchOption,
            @RequestParam(defaultValue="") String keyword,
            @RequestParam(defaultValue="1") int curPage) throws Exception {
	    // 레코드의 갯수
	    int count = sampleService.countArticle(searchOption, keyword);
	    
		// 페이지 나누기 관련 처리
	    BoardPager boardPager = new BoardPager(count, curPage);
	    int start = boardPager.getPageBegin();
	    int end = boardPager.getPageEnd();
		
		
		List<BoardVO> list = sampleService.boardList(start, end, searchOption, keyword);
		

	    // 데이터를 맵에 저장
	    /*
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("list", list); // list
	    map.put("count", count); // 레코드의 갯수
	    map.put("searchOption", searchOption); // 검색옵션
	    map.put("keyword", keyword); // 검색키워드
	    */
		
		ModelAndView mav = new ModelAndView();
		
	    mav.addObject("list", list); // 데이터를 저장
	    mav.addObject("count", count);
	    mav.addObject("searchOption", searchOption);
	    mav.addObject("keyword", keyword);
	    mav.addObject("boardPager", boardPager);
	    mav.addObject("list", list); // 맵에 저장된 데이터를 mav에 저장
	    mav.setViewName("sample/boardList"); // 뷰를 list.jsp로 설정
	    return mav; // list.jsp로 List가 전달된다.
	}	
	

	
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
		return "sample/boardWrite"; // /sample/boardWrite도 됨
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
