<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
    <table style="width:700px">
        <c:forEach var="row" items="${list}">
        <tr>    
            <td>
                ${row.userName}
                <br>
                ${row.replytext}
                <br>
                <!-- 본인 댓글만 수정버튼 생성되도록 처리 -->
                <c:if test="${sessionScope.userId == row.replyer}">
                    <input type="button" id="btnModify" value="수정" onclick="showReplyModify('${row.replyidx}')">
                </c:if>
                <hr>
            </td>
        </tr>
        </c:forEach>
    </table>
    <!-- 댓글 수정 영역-->
    <div id="modifyReply"></div>
</body>
</html>