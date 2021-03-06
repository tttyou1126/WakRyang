package first.sample.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.sample.vo.BoardVO;

@Repository("sampleDAO")
public interface SampleDAO {
	
/*
	public void insertBoard(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("sample.insertBoard", map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("sample.updateHitCnt", map);

	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("sample.selectBoardDetail", map);

	}

	public void updateBoard(Map<String, Object> map) throws Exception {
		update("sample.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("sample.deleteBoard", map);
	}
*/
	public List<BoardVO> boardList(int start, int end, String searchOption, String keyword);

	public void writeBoard(BoardVO vo);

	public BoardVO viewBoard(int IDX);

	public void updateBoard(BoardVO vo);

	public BoardVO updateScreenBoard(int iDX);

	public void updateHitCnt(int iDX);

	public void deleteBoard(int iDX);

	public int countArticle(String searchOption, String keyword);

	public void addAttach(Map<String, Object> map);

	public List<BoardVO> fileList(int IDX); // 210503 첨부파일 보여주기

	public List<BoardVO> selectFileInfo(String fullname); // 210503 첨부파일 다운로드



}
