package kr.or.bit.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;


@WebFilter("/Encoding")
public class Encoding implements Filter {

	//변수 생성
	private String encoding;
 
    public Encoding() {
       
    }


	public void destroy() {
		
	}
	public void init(FilterConfig fConfig) throws ServletException {
		//최초 요청시 컴파일 되고 한번만 실행
		//FilterConfig web.xml 설정 변수값 사용 가능
		this.encoding = fConfig.getInitParameter("encoding");
		System.out.println("Filter init 함수 호출 : " + this.encoding);
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		//request 요청이 오면 실행 영역
			if(request.getCharacterEncoding() == null) {
				//공통 관심, 보조관심
				request.setCharacterEncoding(this.encoding);
			}
		
		
		chain.doFilter(request, response);
		//response 응답이 갈때 실행되는 영역
			System.out.println("응당 처리 필터.......");
	
	}


	

}
