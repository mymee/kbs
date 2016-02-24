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
        <jsp:include page="/WEB-INF/views/common/top_setting.jsp"/>

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title"></div>
                <div class="clearfix"></div>

                <div class="row">
                    <table class="table table-striped table-bordered table-hover">
                        <thead style="background-color: #eee;bo">
                        <tr>
                            <th class="text-left" style="padding-left:12px;"><h2><b><i class="fa fa-book"></i> 페이지 이동</b></h2></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="text-left" style="padding-left:12px;"><a href="${pageContext.request.contextPath}/operator/status" target="_blank">관리자 팀 진행상태 화면</a></td>
                        </tr>
                        <tr>
                            <td class="text-left" style="padding-left:12px;"><a href="${pageContext.request.contextPath}/operator/team/list" target="_blank">관리자 팀 기본정보 화면</a></td>
                        </tr>
                        <tr>
                            <td class="text-left" style="padding-left:12px;"><a href="${pageContext.request.contextPath}/korean/battle" target="_blank">우리말겨루기 화면</a></td>
                        </tr>
                        <tr>
                            <td class="text-left" style="padding-left:12px;"><a href="${pageContext.request.contextPath}/working/memory" target="_blank">워킹메모리 화면;</a></td>
                        </tr>
                        <tr>
                            <td class="text-left" style="padding-left:12px;"><a href="${pageContext.request.contextPath}/books/quiz" target="_blank">독서퀴즈 화면;</a></td>
                        </tr>
                        </tbody>
                    </table>
                    <table class="table table-striped table-bordered table-hover">
                        <thead style="background-color: #eee;bo">

                        <tr>
                            <th colspan="2" class="text-left" style="padding-left:12px;"><h2><b><i class="fa fa-book"></i> 해당 팀/학교선택</b></h2></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="active text-left" style="padding-left:12px;width:20%;background-color:#fff;">해당 학교선택</td>
                            <td class="text-left" style="padding-left:12px;width:80%;">
                                <select id="schoolName" name="teamCode"
                                        class="form-control" style="display:inline-block;width:100%; margin-bottom:2px;;padding:2px;">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="active text-left" style="padding-left:12px;width:20%;background-color:#fff;">해당 팀 선택</td>
                            <td class="text-left" style="padding-left:12px;width:80%;">
                                <select id="teamCode" name="teamCode" onFocus='this.initialSelect = this.selectedIndex;'
                                        onChange='this.selectedIndex = this.initialSelect;'
                                        class="form-control" style="display:inline-block;width:100%; margin-bottom:2px;;padding:2px;">
                                    <option value="A">A조</option>
                                    <option value="B">B조</option>
                                    <option value="C">C조</option>
                                    <option value="D">D조</option>
                                </select>
                            </td>
                        </tr>

                        </tbody>
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

<!-- Footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


</body>
</html>
