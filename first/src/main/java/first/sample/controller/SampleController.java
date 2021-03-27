package first.sample.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Mode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import first.sample.service.SampleService;
import first.sample.vo.BoardPager;
import first.sample.vo.BoardVO;

@Controller
public class SampleController {
	@Resource(name = "sampleService")
	private SampleService sampleService;
	
    @Resource(name="uploadPath")
    String uploadPath;
	
	
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);

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

	
	@RequestMapping("sample/writeScreen.do")
	public String writeBoardScreen() throws Exception {
		return "sample/boardWrite"; // /sample/boardWrite도 됨
	}	
	
	@RequestMapping(value="sample/writeBoard.do", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String writeBoard( @RequestParam MultipartFile[] file, @ModelAttribute BoardVO vo) throws Exception { // 210325 파일 다중 업로드
		// MultipartFile[] 앞에 @RequestParam 없으면 에러남
		
        List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();

        for(int i=0; i<file.length; i++) {
        	String savedName = file[i].getOriginalFilename();
        	File target = new File(uploadPath, savedName);
            if(!target.exists()) target.mkdirs();

            String orgFileName = file[i].getOriginalFilename();
            String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
            String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;
            Long saveFileSize = file[i].getSize();
            
            logger.info("================== file start ==================");
            logger.info("파일 실제 이름: "+orgFileName);
            logger.info("파일 저장 이름: "+saveFileName);
            logger.info("파일 크기: "+saveFileSize);
            logger.info("content type: "+file[i].getContentType());
            logger.info("================== file   END ==================");
 
            target = new File(uploadPath, saveFileName);
            file[i].transferTo(target);
            
            Map<String, Object> fileInfo = new HashMap<String, Object>();
 
            fileInfo.put("ORG_FILE_NAME", orgFileName);
            fileInfo.put("SAVE_FILE_NAME", saveFileName);
            fileInfo.put("FILE_SIZE", saveFileSize);
            fileList.add(fileInfo);
            

			 if(file[i].getOriginalFilename() == null || file[i].getOriginalFilename() == "") {
		        	
		        }
		        else {
		        	// 랜덤생성+파일이름 저장
		            // 파일명 랜덤생성 메서드호출
		            savedName = uploadFile(savedName, file[i].getBytes());


		        }
			 
			 
			 new ResponseEntity<String>(uploadFile(uploadPath, file[i].getOriginalFilename(), file[i].getBytes()), HttpStatus.OK);
        }

		sampleService.writeBoard(file, vo, fileList);

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

   
	
	// 파일명 랜덤생성 메서드
    private String uploadFile(String originalName, byte[] fileData) throws Exception{
        // uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
        UUID uuid = UUID.randomUUID();
        // 랜덤생성+파일이름 저장
        String savedName = uuid.toString()+"_"+originalName;
        File target = new File(uploadPath, savedName);

        return savedName;
    }
	
	
	
	
	   // 파일명 랜덤생성 메서드
		public String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
	        // UUID 발급
	        UUID uuid = UUID.randomUUID();
	        // 저장할 파일명 = UUID + 원본이름
	        String savedName = uuid.toString() + "_" + originalName;
	        // 업로드할 디렉토리(날짜별 폴더) 생성 
	        String savedPath = calcPath(uploadPath);
	        // 파일 경로(기존의 업로드경로+날짜별경로), 파일명을 받아 파일 객체 생성
	        File target = new File(uploadPath + savedPath, savedName);
	        // 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
	        FileCopyUtils.copy(fileData, target);
	        // 썸네일을 생성하기 위한 파일의 확장자 검사
	        // 파일명이 aaa.bbb.ccc.jpg일 경우 마지막 마침표를 찾기 위해
	        String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
	        String uploadedFileName = null;
	        // 이미지 파일은 썸네일 사용
	        if (getMediaType(formatName) != null) {
	            // 썸네일 생성
	            uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
	        // 나머지는 아이콘
	        } else {
	            // 아이콘 생성
	            uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
	        }
	        return uploadedFileName;
	    }


	        // 날짜별 디렉토리 추출
	        private String calcPath(String uploadPath) {
	            Calendar cal = Calendar.getInstance();
	            // File.separator : 디렉토리 구분자(\\)
	            // 연도, ex) \\2017 
	            String yearPath = File.separator + cal.get(Calendar.YEAR);
	            System.out.println(yearPath);
	            // 월, ex) \\2017\\03
	            String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	            System.out.println(monthPath);
	            // 날짜, ex) \\2017\\03\\01
	            String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
	            System.out.println(datePath);
	            // 디렉토리 생성 메서드 호출
	            makeDir(uploadPath, yearPath, monthPath, datePath);
	            return datePath;
	        }

	        // 디렉토리 생성
	        private void makeDir(String uploadPath, String... paths) {
	            // 디렉토리가 존재하면
	            if (new File(paths[paths.length - 1]).exists()){
	                return;
	            }
	            // 디렉토리가 존재하지 않으면
	            for (String path : paths) {
	                // 
	                File dirPath = new File(uploadPath + path);
	                // 디렉토리가 존재하지 않으면
	                if (!dirPath.exists()) {
	                    dirPath.mkdir(); //디렉토리 생성
	                }
	            }
	        }    

	        // 썸네일 생성
	        private String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
	            // 이미지를 읽기 위한 버퍼
	            BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
	            // 100픽셀 단위의 썸네일 생성
	            BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Mode.FIT_TO_HEIGHT, 100);
	            // 썸네일의 이름을 생성(원본파일명에 's_'를 붙임)
	            String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
	            File newFile = new File(thumbnailName);
	            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
	            // 썸네일 생성
	            ImageIO.write(destImg, formatName.toUpperCase(), newFile);
	            // 썸네일의 이름을 리턴함
	            return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	        }

	        // 아이콘 생성
	        private String makeIcon(String uploadPath, String path, String fileName) throws Exception {
	            // 아이콘의 이름
	            String iconName = uploadPath + path + File.separator + fileName;
	            // 아이콘 이름을 리턴
	            // File.separatorChar : 디렉토리 구분자
	            // 윈도우 \ , 유닉스(리눅스) /         
	            return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	        }

		    private Map<String, MediaType> mediaMap;
		    // 자동로딩
		    {
		        mediaMap = new HashMap<String, MediaType>();
		        mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		        mediaMap.put("GIF", MediaType.IMAGE_GIF);
		        mediaMap.put("PNG", MediaType.IMAGE_PNG);
		    }
		    public MediaType getMediaType(String type) {
		        return mediaMap.get(type.toUpperCase());
		    }	
	
	
	
	
	
}
