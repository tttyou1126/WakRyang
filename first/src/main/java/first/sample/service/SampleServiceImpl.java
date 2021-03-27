package first.sample.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import first.sample.controller.SampleController;
import first.sample.dao.SampleDAO;
import first.sample.vo.BoardVO;

@Service("sampleService")
public class SampleServiceImpl implements SampleService {
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);

	@Inject
	SampleDAO sampleDAO;

	@Override
	public List<BoardVO> boardList(int start, int end, String searchOption, String keyword) {
		return sampleDAO.boardList(start, end, searchOption, keyword);
	}


	@Override
	public int countArticle(String searchOption, String keyword) {
		return sampleDAO.countArticle(searchOption, keyword);
	}	
	
	/*
	@Override
	public List<BoardVO> boardList() {
		// TODO Auto-generated method stub
		return sampleDAO.boardList();
	}
*/

	@Override
	public void writeBoard(MultipartFile[] file, BoardVO vo, List<Map<String, Object>> fileList) throws Exception {
		sampleDAO.writeBoard(vo);
		
		// 210325 파일 다중 업로드
	    for(int i=0; i<fileList.size(); i++) {
	    	sampleDAO.addAttach(fileList.get(i));
	    }

	}


	@Override
	public BoardVO viewBoard(int IDX) {
		// TODO Auto-generated method stub
		sampleDAO.updateHitCnt(IDX);
		return sampleDAO.viewBoard(IDX);
	}


	@Override
	public void updateBoard(BoardVO vo) {
		sampleDAO.updateBoard(vo);
		
	}


	@Override
	public BoardVO updateBoardScreen(int iDX) {
		// TODO Auto-generated method stub
		return sampleDAO.updateScreenBoard(iDX);
	}


	@Override
	public void deleteBoard(int IDX) {
		sampleDAO.deleteBoard(IDX);
		
	}



	



}
