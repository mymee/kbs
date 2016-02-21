<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>KBS'책들아놀자'</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/fonts/css/font-awesome.min.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/animate.min.css" rel="stylesheet"/>
<!-- Custom styling plus plugins -->
<link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet"/>

<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.11.4/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/html2canvas.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/html2canvas.svg.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.cookie.js"></script>

<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/resources/assets/js/ie8-responsive-file-warning.js"></script>
<![endif]-->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/resources/js/html5shiv.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/operator/team/list/json",
            type: "GET",
            contentType: 'application/json',
            success: function (datas, textStatus, jqXHR) {
                console.log("SUCCESS: ", datas);
                var teamSeq = $.cookie("SEQ");
                //alert($.cookie("TEAM_CODE"))
                for(var i = datas.length; i--;) {
                    var data = datas[i];
                    $("#schoolName").append("<option value='" + data.SEQ + "'>" + data.SCHOOL_NAME + " : " + data.NAME + "</option>");

                    if(teamSeq == data.SEQ){

                        //alert(data.TEAM_CODE);
                        $("#teamCode").val(data.TEAM_CODE);
                        $("#schoolName").val(data.SEQ);
                    }
                }

                //alert(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("ERROR: ", errorThrown);
                alert("ERROR : " + errorThrown);
            }
        });
        $('#teamInfoCookieCreate').click(function () {
            //alert($("#schoolName").val());
            var formData = {teamCode: $("#teamCode").val(), teamSeq: $("#schoolName").val()};
            $.ajax({
                url: "${pageContext.request.contextPath}/operator/team/info/json",
                type: "GET",
                //contentType: 'application/json',
                data: formData,
                success: function (datas, textStatus, jqXHR) {
                    console.log("SUCCESS: ", datas);
                    $.cookie('SEQ', datas.SEQ);
                    $.cookie('NAME', datas.NAME);
                    $.cookie('SCHOOL_NAME', datas.SCHOOL_NAME);
                    $.cookie('BASE_SCORE', datas.BASE_SCORE);
                    $.cookie('RANK_SCORE', datas.RANK_SCORE);
                    $.cookie('CHANCE1', datas.CHANCE_1);
                    $.cookie('CHANCE2', datas.CHANCE_2);
                    $.cookie('CHANCE3', datas.CHANCE_3);
                    $.cookie('CHANCE4', datas.CHANCE_4);
                    $.cookie('CHANCE5', datas.CHANCE_5);
                    $.cookie('TEAM_CODE', datas.TEAM_CODE);
                    $.cookie('TEAM_INFO', datas);
                    //alert(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("ERROR: ", errorThrown);
                    alert("ERROR : " + errorThrown);
                }
            });

        });
        $('#teamInfoCookieRead').click(function () {

            alert("현재 " + $.cookie('TEAM_CODE') + "조 " + $.cookie('SCHOOL_NAME') + " : " + $.cookie('NAME') + "팀으로 선택되어 있습니다.");
            console.log('SEQ',$.cookie('SEQ'));
            console.log('NAME',$.cookie('NAME'));
            console.log('SCHOOL_NAME',$.cookie('SCHOOL_NAME'));
            console.log('BASE_SCORE',$.cookie('BASE_SCORE'));
            console.log('RANK_SCORE',$.cookie('RANK_SCORE'));
            console.log('CHANCE1',$.cookie('CHANCE1'));
            console.log('CHANCE2',$.cookie('CHANCE2'));
            console.log('CHANCE3',$.cookie('CHANCE3'));
            console.log('CHANCE4',$.cookie('CHANCE4'));
            console.log('CHANCE5',$.cookie('CHANCE5'));
            console.log('TEAM_CODE',$.cookie('TEAM_CODE'));
            console.log('TEAM_INFO',$.cookie('TEAM_INFO'));
        });
        $('#teamInfoCookieDelete').click(function () {
            $.removeCookie('SEQ');
            $.removeCookie('NAME');
            $.removeCookie('SCHOOL_NAME');
            $.removeCookie('BASE_SCORE');
            $.removeCookie('RANK_SCORE');
            $.removeCookie('CHANCE1');
            $.removeCookie('CHANCE2');
            $.removeCookie('CHANCE3');
            $.removeCookie('CHANCE4');
            $.removeCookie('CHANCE5');
            $.removeCookie('TEAM_CODE');
            $.removeCookie('TEAM_INFO');
        });
    });
</script>