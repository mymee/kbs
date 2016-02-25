<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <!-- head -->
    <jsp:include page="/WEB-INF/views/common/head.jsp"/>
</head>


<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- Left -->
        <jsp:include page="/WEB-INF/views/common/left_team.jsp"/>

        <!-- Top -->
        <jsp:include page="/WEB-INF/views/common/top.jsp"/>

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title"></div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="box-header">
                        <h3 class="box-title"><i class="fa fa-commenting-o"></i> 기본정보 입력</h3>
                    </div>

                    <div class="x_content">

                        <table class="table table-bordered">
                            <thead>
                            <tr style="background-color:#fff;">
                                <th class="text-center" style="width:5%;">No.</th>
                                <th class="text-center" style="width:5%;">팀그룹(조)</th>
                                <th class="text-center" style="width:35%;">학교이름</th>
                                <th class="text-center" style="width:30%;">팀이름</th>
                                <th class="text-center" style="width:10%;">기본점수</th>
                                <th class="text-center" style="width:10%;">합계점계</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="list" items="${TEAM_INFO_LIST}" varStatus="status">
                            <tr>
                                <td class="text-center" scope="row">${status.index+1}</td>
                                <td class="text-center">${list.TEAM_CODE}</td>
                                <td><a href="${pageContext.request.contextPath}/operator/team/modify?teamSeq=${list.SEQ}">${list.NAME}</a></td>
                                <td>${list.SCHOOL_NAME}</td>
                                <td class="text-center">${list.BASE_SCORE}</td>
                                <td class="text-center">${list.RANK_SCORE}</td>
                            </tr>
                            </c:forEach>
                            <c:if test="${empty TEAM_INFO_LIST }">
                                <tr><td colspan="10" style="text-align:center;">데이터가 존재하지 않습니다.</td></tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                    <!--
                    <div class="box-footer clearfix">
                        <div class="text-center">
                            <ul class="pagination">
                                <li><a href="#">prev</a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">next</a></li>
                            </ul>
                        </div>
                    </div>-->

                    <div class="table-bottom">
                        <div class="grid-btn-group">
                            <div class="btn-group pull-right" role="group" aria-label="..." style="margin-bottom:20px;">
                                <button type="button" id="teamInfoInput" name="teamInfoInput" class="btn btn-info"> 기본정보 입력</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</div>
<!-- /page content -->
</div>
</div>

<div id="custom_notifications" class="custom-notifications dsp_none">
    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
    </ul>
    <div class="clearfix"></div>
    <div id="notif-group" class="tabbed_notifications"></div>
</div>


</body>

</html>