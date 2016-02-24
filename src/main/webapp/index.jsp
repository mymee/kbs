<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <!-- head -->
    <jsp:include page="/WEB-INF/views/common/head_setting.jsp"/>

    <script type="text/javascript">

    </script>
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- Left -->
        <jsp:include page="/WEB-INF/views/common/left_setting.jsp"/>

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
                            <tr>
                                <td colspan="2">
                                    <a href="${pageContext.request.contextPath}/operator/status">관리자 팀진행 상태 화면</a>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="${pageContext.request.contextPath}/operator/team/list">관리자 팀기본정보 화면</a>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="${pageContext.request.contextPath}/korean/battle">우리말 겨루기 화면</a>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="${pageContext.request.contextPath}/working/memory">워킹 메모리 화면</a>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="${pageContext.request.contextPath}/books/quiz">독서 퀴즈 화면</a>
                                </td>
                            </tr>
                            <tr>
                                <td class="active text-center"
                                    style="vertical-align: middle;background-color:#fff;">해당 조 선택
                                </td>
                                <td style="text-align:left;padding-left:10px;">
                                    <div class='mem_no'>
                                        <div class='working_team'>
                                            <select id="teamCode" name="teamCode" onFocus='this.initialSelect = this.selectedIndex;'
                                                    onChange='this.selectedIndex = this.initialSelect;'
                                                    style="width: 160px; height: 100px; font-size: 80px; opacity:0.5px;">
                                                <option value="A">A조</option>
                                                <option value="B">B조</option>
                                                <option value="C">C조</option>
                                                <option value="D">D조</option>
                                            </select>
                                            <h3>아래 팀을 선택하세요</h3>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="active text-center"
                                    style="vertical-align: middle;background-color:#fff;">해당 학교 선택
                                </td>
                                <td style="text-align:left;padding-left:10px;">
                                    <div class='mem_no'>
                                        <div class='working_team'>
                                            <select id="schoolName" name="teamCode"
                                                    style="width: 1000px; height: 100px; font-size: 50px; opacity:0.5px;">
                                            </select>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="table-bottom">
                            <div class="grid-btn-group">
                                <div class="btn-group pull-right" role="group" aria-label="..."
                                     style="margin-bottom:20px;">
                                    <button type="button" id="teamInfoCookieRead" name="teamInfoCookieRead"
                                            class="btn btn-info"> 팀 정보 확인
                                    </button>
                                    <button type="button" id="teamInfoCookieCreate" name="teamInfoCookieCreate"
                                            class="btn btn-info"> 팀 정보 설정
                                    </button>
                                    <button type="button" id="teamInfoCookieDelete" name="teamInfoCookieDelete"
                                            class="btn btn-info"> 정보 초기화
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


</body>
</html>
