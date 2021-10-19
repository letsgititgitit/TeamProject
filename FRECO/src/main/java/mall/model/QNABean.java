package mall.model;

import java.sql.Timestamp;

import org.hibernate.validator.constraints.NotBlank;

public class QNABean {
	private int QNUM;
	
	@NotBlank(message = "작성자를 입력하세요.")
	private String QID;
	
	@NotBlank(message = "제목을 입력하세요.")
	private String QSUBJECT;
	
	@NotBlank(message = "비밀번호를 입력하세요.")
	private String  QPW ;
	private Timestamp  QREGDATE;
	
	@NotBlank(message = "내용을 입력하세요.")
	private String  QCONTENT ;
	private String  QREPLY ;
	private int  QREF;
	private int  QRESTEP;
	private int QRELEVEL;
	
	private int ORIGINQNUM;
		
	public int getORIGINQNUM() {
		return ORIGINQNUM;
	}
	public void setORIGINQNUM(int oRIGINQNUM) {
		ORIGINQNUM = oRIGINQNUM;
	}
	public int getQNUM() {
		return QNUM;
	}
	public void setQNUM(int qNUM) {
		QNUM = qNUM;
	}
	public String getQID() {
		return QID;
	}
	public void setQID(String qID) {
		QID = qID;
	}
	public String getQSUBJECT() {
		return QSUBJECT;
	}
	public void setQSUBJECT(String qSUBJECT) {
		QSUBJECT = qSUBJECT;
	}
	public String getQPW() {
		return QPW;
	}
	public void setQPW(String qPW) {
		QPW = qPW;
	}
	public Timestamp getQREGDATE() {
		return QREGDATE;
	}
	public void setQREGDATE(Timestamp qREGDATE) {
		QREGDATE = qREGDATE;
	}
	public String getQCONTENT() {
		return QCONTENT;
	}
	public void setQCONTENT(String qCONTENT) {
		QCONTENT = qCONTENT;
	}
	public String getQREPLY() {
		return QREPLY;
	}
	public void setQREPLY(String qREPLY) {
		QREPLY = qREPLY;
	}
	public int getQREF() {
		return QREF;
	}
	public void setQREF(int qREF) {
		QREF = qREF;
	}
	public int getQRESTEP() {
		return QRESTEP;
	}
	public void setQRESTEP(int qRESTEP) {
		QRESTEP = qRESTEP;
	}
	public int getQRELEVEL() {
		return QRELEVEL;
	}
	public void setQRELEVEL(int qRELEVEL) {
		QRELEVEL = qRELEVEL;
	}
	public QNABean(int qNUM, String qID, String qSUBJECT, String qPW, Timestamp qREGDATE, String qCONTENT,
			String qREPLY, int qREF, int qRESTEP, int qRELEVEL) {
		super();
		QNUM = qNUM;
		QID = qID;
		QSUBJECT = qSUBJECT;
		QPW = qPW;
		QREGDATE = qREGDATE;
		QCONTENT = qCONTENT;
		QREPLY = qREPLY;
		QREF = qREF;
		QRESTEP = qRESTEP;
		QRELEVEL = qRELEVEL;
	}
	public QNABean() {
		super();
	}
	
	
}
