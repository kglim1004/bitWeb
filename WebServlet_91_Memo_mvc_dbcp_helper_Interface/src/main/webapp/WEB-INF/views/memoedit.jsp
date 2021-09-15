<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	
</head>
<body>

<div align=center>
<hr color=green width=400>
		<h2> Line Memo EDIT </h2>
<hr color=green width=400>
<c:set var="memo" value="${requestScope.memo}"></c:set>

<div style="margin-top:70px;"></div> 
<!--  html 파일  action="MemoServlet"  -->
<form name="f" action="MemoEditOk.memo" method="post"> 
 <div align="center"> 
    <table width="600" border="0" cellpadding="7" > 
        <tr align="center" bgcolor="gold" height="50"> 
            <td colspan="2"> 
                <font size="4" color="#0033CC" face="굴림체"> 
                <b> 
                   Servlet Memo
                </b> 
                </font> 
            </td> 
        </tr> 
        <tr> 
            <td width="25%" align="center" > 
                <b>ID</b> 
            </td> 
            <td> 
                <input type="text" size="40" id="id" name="id" maxlength="10" value="${memo.id}"  readonly>
            </td> 
        </tr>     
        <tr> 
            <td width="25%" align="center"> 
                <b>EMAIL</b> 
            </td> 
            <td> 
                <input type="text" size="40" id="email" name="email" maxlength="60" value="${memo.email}" > 
            </td> 
        </tr> 
        <tr> 
            <td width="25%" align="center"> 
                <b>MEMO</b> 
            </td> 
            <td> 
                <textarea name="memo" cols="50" class="box2">${memo.content}</textarea> 
            </td> 
        </tr> 
        <tr bgcolor="gold"> 
            <td colspan="2" align="center" class="c2"> 
                <input type="submit" value="전송" >
                <input type="reset" value="취소"> 
            </td> 
        </tr> 
     
    </table> 
 </div>
</form>
<a href="MemoList.memo">목록보기</a> 
</body>
</html>