package first.sample.service;

import java.util.List;

import first.sample.vo.BoardVO;

public interface SampleService {

	List<BoardVO> boardList();

	void writeBoard(BoardVO vo);

	BoardVO viewBoard(int iDX);

	void updateBoard(BoardVO vo);

	BoardVO updateBoardScreen(int iDX);

	void deleteBoard(int iDX);

	

}
