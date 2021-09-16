<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="kr.or.bit.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//json객체 변환
	//jsonlib 사용
	//1. JSONObject 사용 >> { } 객체 하나
    //2. JSONArray  사용 >> [{},{},{}]
	
    		
     Member member = new Member();
    
     JSONObject objmember = JSONObject.fromObject(member);
     //{"address":"서울시 강남구","admin":"1","password":"1004","username":"bit"}
%>
<%=objmember%>
<hr>
<%
	List<Member> memberlist = new ArrayList<>();
	memberlist.add(new Member("hong","1004","서울시 강남구","0"));
	memberlist.add(new Member("kim","1004","서울시 강남구","0"));
	memberlist.add(new Member("lee","1004","서울시 강남구","0"));
	memberlist.add(new Member("park","1004","서울시 강남구","0"));
	
	JSONArray memberarray = JSONArray.fromObject(memberlist);
	/*
		[
		 {"address":"서울시 강남구","admin":"0","password":"1004","username":"hong"},
		 {"address":"서울시 강남구","admin":"0","password":"1004","username":"kim"},
		 {"address":"서울시 강남구","admin":"0","password":"1004","username":"lee"},
		 {"address":"서울시 강남구","admin":"0","password":"1004","username":"park"}
		]
	*/
%>
<%=memberarray%>



