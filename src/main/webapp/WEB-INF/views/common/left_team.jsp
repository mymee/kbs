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

            <div class="x_content text-center" style="margin-top:30px;">
                <button type="button" id="teamInfoList" name="teamInfoList" class="btn btn-info btn-lg" style="width:170px;">팀 기본정보 입력</button>
            </div>
            <div class="x_content text-center" style="margin-top:750px;">
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
