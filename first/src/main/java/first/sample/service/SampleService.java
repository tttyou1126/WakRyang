package first.sample.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import first.sample.vo.BoardVO;

public interface SampleService {

	public List<BoardVO> boardList(int start, int end, String searchOption, String keyword);

	void writeBoard(MultipartFile[] file, BoardVO vo, List<Map<String, Object>> fileList) throws Exception;

	// BoardVO viewBoard(int iDX);
	
	BoardVO viewBoard(int IDX);

	void updateBoard(BoardVO vo);

	BoardVO updateBoardScreen(int iDX);

	void deleteBoard(int iDX);

	public int countArticle(String searchOption, String keyword);

	List<BoardVO> fileList(int IDX); // 210503 첨부파일 보여주기
	
	List<BoardVO> selectFileInfo(String fullname) throws Exception; // 210503 파일 다운로드

}
