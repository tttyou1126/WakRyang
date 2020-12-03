package first.sample.vo;

import java.sql.Timestamp;

public class BoardVO {
	private int IDX;
	private int PARENT_IDX;
	private String TITLE;
	private String CONTENTS;
	private Timestamp CREA_DTM; // java.sql.Timestamp  (Date는 시간표시가 안됨)
	private int HIT_CNT;
	private String DEL_GB; 
	private String CREA_ID;
	
	public int getIDX() {
		return IDX;
	}
	public void setIDX(int iDX) {
		IDX = iDX;
	}
	public int getPARENT_IDX() {
		return PARENT_IDX;
	}
	public void setPARENT_IDX(int pARENT_IDX) {
		PARENT_IDX = pARENT_IDX;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getCONTENTS() {
		return CONTENTS;
	}
	public void setCONTENTS(String cONTENTS) {
		CONTENTS = cONTENTS;
	}
	public Timestamp getCREA_DTM() {
		return CREA_DTM;
	}
	public void setCREA_DTM(Timestamp cREA_DTM) {
		CREA_DTM = cREA_DTM;
	}
	public int getHIT_CNT() {
		return HIT_CNT;
	}
	public void setHIT_CNT(int hIT_CNT) {
		HIT_CNT = hIT_CNT;
	}
	public String getDEL_GB() {
		return DEL_GB;
	}
	public void setDEL_GB(String dEL_GB) {
		DEL_GB = dEL_GB;
	}
	public String getCREA_ID() {
		return CREA_ID;
	}
	public void setCREA_ID(String cREA_ID) {
		CREA_ID = cREA_ID;
	}
	@Override
	public String toString() {
		return "BoardVO [IDX=" + IDX + ", PARENT_IDX=" + PARENT_IDX + ", TITLE=" + TITLE + ", CONTENTS=" + CONTENTS
				+ ", CREA_DTM=" + CREA_DTM + ", HIT_CNT=" + HIT_CNT + ", DEL_GB=" + DEL_GB + ", CREA_ID=" + CREA_ID
				+ "]";
	}

	
}