package kr.or.bit.action;

//요청
//1. 화면
//2. 처리

//화면이냐 처리 결정 여부
//뷰의 경로 설정 여부

public class ActionForward {
	private boolean isRedirect = false; //화면 전환 여부
	private String path=null; //뷰의 이동 주소
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}
