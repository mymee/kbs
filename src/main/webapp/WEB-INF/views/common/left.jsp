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

            <div class="menu_section">

                <!--
                <ul class="nav side-menu">
                    <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu" style="display: none">
                            <li><a href="index.html">Dashboard</a></li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu" style="display: none">
                            <li><a href="form.html">General Form</a>
                            </li>
                            <li><a href="form_advanced.html">Advanced Components</a></li>
                        </ul>
                    </li>
                </ul>
                -->
            </div>
            <div class="x_content text-center">
                <h1><span id="quizNumText">0번문제</span></h1>
            </div>
            <div class="x_content text-center">
                <button type="button" id="quizNextButton" name="quizNextButton" class="btn btn-info btn-lg">다음문제</button>
            </div>
            <div class="x_content text-center"  style="margin-top:50px;">
                <button type="button" id="quizFirstChance" name="quizFirstChance" class="btn btn-default btn-lg" style="background-color: #f3c241;">우선풀이</button><br><br>
                <button type="button" id="quizDoubleChance" name="quizDoubleChance" class="btn btn-default btn-lg" style="background-color: #2972bf;">더블찬스</button><br><br><br><br>
            </div>
            <div class="x_content text-center">
                <button type="button" id="teamInfoRefresh" name="teamInfoRefresh" class="btn btn-info btn-lg">새로고침</button>
            </div>
            <div class="x_content text-center" style="margin-top:100px;">
                <button type="button" id="koreanBattle" name="koreanBattle" class="btn btn-default btn-lg">우리말겨루기 시작</button>
            </div>
            <div class="x_content text-center" >
                <button type="button" id="koreanBattleResult" name="koreanBattle" class="btn btn-default btn-lg">우리말겨루기 결과</button>
            </div>
            <div class="x_content text-center" >
                <button type="button" id="workingMemoryResult" name="koreanBattle" class="btn btn-default btn-lg">워킹메모리 결과</button>
            </div>
            <div class="x_content text-center" style="margin-top:50px;">
                <button type="button" id="teamInfoList" name="teamInfoList" class="btn btn-default btn-lg">팀기본정보</button>
            </div>

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
