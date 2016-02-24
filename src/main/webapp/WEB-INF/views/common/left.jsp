<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="col-md-3 left_col">
    <div class="left_col scroll-view">

        <div class="navbar nav_title" style="border: 0;">
            <a href="${pageContext.request.contextPath}/operator/status" class="site_title"><img src="${pageContext.request.contextPath}/resources/images/logo01.png"></a>
        </div>
        <div class="clearfix"></div>

        <br />

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <!-- 사이드바 메뉴 내용 변경_20150224 -->
            <div class="menu_section">
                <h1><span id="quizNumText">0번문제</span></h1>
            </div>

            <div class="x_content text-center">
                <button type="button" id="quizNextButton" name="quizNextButton" class="btn btn-info btn-lg" style="width:170px;">다음문제</button>
            </div>

            <div class="x_content text-center"  style="margin-top:50px;">
                <button type="button" id="quizDoubleScoreChance" name="quizDoubleScoreChance" class="btn btn-default btn-lg" style="background-color: #17ab36;color:#fff;width:170px;">더블점수</button><br>
                <button type="button" id="quizFirstChance" name="quizFirstChance" class="btn btn-default btn-lg" style="background-color: #f3c241;width:170px;">우선풀이</button>
            </div>
            <div class="x_content text-center">
                <select id="selectDoubleChance" name="selectDoubleChance" style="width:170px;height:30px;padding:2px;"><option value="" selected>내꺼하자팀</option></select><br>
                <select id="selectDoubleTarget" name="selectDoubleTarget" style="width:170px;height:30px;padding:2px;"><option value="" selected>타겟팀</option></select>
            </div>
            <div class="x_content text-center">
                <button type="button" id="quizDoubleChance" name="quizDoubleChance" class="btn btn-default btn-lg" style="background-color: #2972bf;color:#fff;width:170px;">내꺼하자</button><br><br><br><br>
            </div>

            <div class="x_content text-center">
                <button type="button" id="teamInfoRefresh" name="teamInfoRefresh" class="btn btn-info btn-lg" style="width:170px;">새로고침</button><br><br>
            </div>

            <div class="x_content text-center" style="margin-top:10px;">
                <button type="button" id="koreanBattle" name="koreanBattle" class="btn btn-default btn-lg" style="width:170px;">우리말겨루기 시작</button>
            </div>
            <div class="x_content text-center" >
                <button type="button" id="koreanBattleResult" name="koreanBattle" class="btn btn-default btn-lg" style="width:170px;">우리말겨루기 결과</button>
            </div>
            <div class="x_content text-center" >
                <button type="button" id="workingMemoryResult" name="koreanBattle" class="btn btn-default btn-lg" style="width:170px;">워킹 메모리 결과</button>
            </div>
            <div class="x_content text-center" style="margin-top:30px;">
                <button type="button" id="teamInfoList" name="teamInfoList" class="btn btn-info btn-lg" style="width:170px;">팀 기본정보 입력</button>
            </div>
            <div class="x_content text-center">
                <button type="button" id="systemDataClean" name="systemDataClean" class="btn btn-default btn-lg"  style="width:170px;">데이터 초기화</button>
            </div>
            <!-- 사이드바 메뉴 내용 변경_20150224 -->

        </div>
        <!-- /sidebar menu -->

        <!-- /menu footer buttons -->
        <!--
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
        </div>
        -->
        <!-- /menu footer buttons -->
    </div>
</div>
