package kr.or.bit.dto;
/*
create table memo(
	id varchar2(15) not null,
	email varchar2(20) not null,
	content varchar2(100)
);

 
select id , email , content from memo where id=kglim 데이터 1건을 담을 수 있는 클래스
>> Memo memo = new Memo("kglim","i7027@naver.com","방가방가"); 

DTO == DB 테이블 구조와 동일 

>>여러건 데이터
select id , email , content from memo 
List<Memo> memolist = new ArrayList<>();
memolist.add(new Memo("kglim","i7027@naver.com","방가방가"));
memolist.add(new Memo("kglim","i7027@naver.com","방가방가"));
memolist.add(new Memo("kglim","i7027@naver.com","방가방가"));

 */
public class Memo {
	private String id;
	private String email;
	private String content;
	
	public Memo() {}

	public Memo(String id, String email, String content) {
		super();
		this.id = id;
		this.email = email;
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Memo [id=" + id + ", email=" + email + ", content=" + content + "]";
	}
	
	
	
}
