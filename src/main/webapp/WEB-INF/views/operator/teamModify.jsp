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
        <jsp:include page="/WEB-INF/views/common/left.jsp"/>

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
                        <form id="teamInfoForm" name="teamInfoForm" method="POST" action="${pageContext.request.contextPath}/operator/team/update">
                            <input type="hidden" id="teamSeq" name="teamSeq" value="${TEAM_INFO.SEQ}"/>
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td class="active text-center"
                                        style="vertical-align: middle;width:10%;background-color:#fff;">학교이름
                                    </td>
                                    <td style="text-align:left;padding-left:10px;width:90%;">
                                        <input class="form-control" style="display:inline-block;;" type="text"
                                               id="schoolName" name="schoolName" maxlength="20" value="${TEAM_INFO.SCHOOL_NAME}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="active text-center"
                                        style="vertical-align: middle;width:10%;background-color:#fff;">팀이름
                                    </td>
                                    <td style="text-align:left;padding-left:10px;width:90%;">
                                        <input class="form-control" style="display:inline-block;;" type="text"
                                               id="teamName" name="teamName" maxlength="20" value="${TEAM_INFO.NAME}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="active text-center"
                                        style="vertical-align: middle;background-color:#fff;">기본점수
                                    </td>
                                    <td style="text-align:left;padding-left:10px;">
                                        <input class="form-control" style="display:inline-block;" type="text"
                                               id="teamBaseScore" name="teamBaseScore" maxlength="20" value="${TEAM_INFO.BASE_SCORE}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="active text-center"
                                        style="vertical-align: middle;background-color:#fff;">우선권카드
                                    </td>
                                    <td style="text-align:left;padding-left:10px;">
                                        <input type="checkbox" id="chance1" name="chance1" value="1" <c:if test="${TEAM_INFO.CHANCE_1 eq 1}">checked</c:if> class="minimal" style="width:18px;height:18px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="active text-center"
                                        style="vertical-align: middle;background-color:#fff;">영상힌트카트
                                    </td>
                                    <td style="text-align:left;padding-left:10px;">
                                        <input type="checkbox" id="chance2" name="chance2" value="1" <c:if test="${TEAM_INFO.CHANCE_2 eq 1}">checked</c:if> class="minimal" style="width:18px;height:18px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="active text-center"
                                        style="vertical-align: middle;background-color:#fff;">더블점수카드
                                    </td>
                                    <td style="text-align:left;padding-left:10px;">
                                        <input type="checkbox" id="chance3" name="chance3" value="1" <c:if test="${TEAM_INFO.CHANCE_3 eq 1}">checked</c:if> class="minimal" style="width:18px;height:18px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="active text-center"
                                        style="vertical-align: middle;background-color:#fff;">더블찬스카드
                                    </td>
                                    <td style="text-align:left;padding-left:10px;">
                                        <input type="checkbox" id="chance4" name="chance4" value="1" <c:if test="${TEAM_INFO.CHANCE_4 eq 1}">checked</c:if> class="minimal" style="width:18px;height:18px;">
                                    </td>
                                </tr>
                                <!--
                                <tr>
                                    <td class="active text-center"
                                        style="vertical-align: middle;background-color:#fff;">찬스권5
                                    </td>
                                    <td style="text-align:left;padding-left:10px;">
                                        <input type="checkbox" class="minimal" style="width:18px;height:18px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="active text-center"
                                        style="vertical-align: middle;background-color:#fff;">찬스권6
                                    </td>
                                    <td style="text-align:left;padding-left:10px;">
                                        <input type="checkbox" class="minimal" style="width:18px;height:18px;">
                                    </td>
                                </tr>-->
                                <tr>
                                    <td class="active text-center"
                                        style="vertical-align: middle;background-color:#fff;">팀그룹
                                    </td>
                                    <td style="text-align:left;padding-left:10px;">
                                        <select class="form-control" id="teamCode" name="teamCode" style="width:245px;">
                                            <option selected value="">선택</option>
                                            <option value="A" <c:if test="${TEAM_INFO.TEAM_CODE eq 'A'}">selected</c:if>>A그룹</option>
                                            <option value="B" <c:if test="${TEAM_INFO.TEAM_CODE eq 'B'}">selected</c:if>>B그룹</option>
                                            <option value="C" <c:if test="${TEAM_INFO.TEAM_CODE eq 'C'}">selected</c:if>>C그룹</option>
                                            <option value="D" <c:if test="${TEAM_INFO.TEAM_CODE eq 'D'}">selected</c:if>>D그룹</option>
                                        </select>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </form>
                        <br>

                        <div class="table-bottom">
                            <div class="grid-btn-group">
                                <div class="btn-group pull-right" role="group" aria-label="..."
                                     style="margin-bottom:20px;">
                                    <button type="button" id="teamInfoUpdate" name="teamInfoUpdate"
                                            class="btn btn-info"> 수정
                                    </button>
                                    <button type="button" id="teamInfoDelete" name="teamInfoDelete"
                                            class="btn btn-info"> 삭제
                                    </button>
                                    <button type="button" id="teamInfoCancel" name="teamInfoCancel"
                                            class="btn btn-info"> 목록
                                    </button>
                                </div>
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