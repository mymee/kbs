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
<link href="${pageContext.request.contextPath}/resources/css/kbsbook.css" rel="stylesheet"/>

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
            url: "${pageContext.request.contextPath}/korean/battle/start",
            type: "GET",
            success: function (data, textStatus, jqXHR) {
                console.log("SUCCESS: ", data);

                if(data.PROCESS_YN) {
                    $("#koreanBattle").text('우리말겨루기 종료').button('refresh');
                }else{
                    $("#koreanBattle").text('우리말겨루기 시작').button('refresh');
                }
                console.log("TEXT: ", $("#koreanBattle").text());
                //alert(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("ERROR: ", errorThrown);
                $("#koreanBattle").attr('value','우리말겨루기 시작').button('refresh');
                alert("ERROR : " + errorThrown);
            }
        });
        $.ajax({
            url: "${pageContext.request.contextPath}/books/quiz/process",
            type: "GET",
            success: function (data, textStatus, jqXHR) {
                console.log("SUCCESS: ", data);

                if(!data || data.QUIZ_NUM == 0){
                    $("#quizNextButton").text("다음문제").button('refresh');
                }else {
                    $('#quizProcessNum').attr('value', data.QUIZ_NUM);
                    $('#quizNumText').html(data.QUIZ_NUM + "번 문제");
                    if(data.QUIZ_END == 0){
                        $("#quizNextButton").text(data.QUIZ_NUM + "번 문제 종료").button('refresh');
                    }else{
                        $("#quizNextButton").text("다음문제").button('refresh');
                    }

                }
                //alert(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("ERROR: ", errorThrown);
                //alert("ERROR : " + errorThrown);
            }
        });
        $('#teamInfoList, #teamInfoCancel').click(function () {
            window.location.href = "${pageContext.request.contextPath}/operator/team/list";
        });
        $('#teamInfoCreate').click(function () {
            $("#teamInfoForm").submit();
        });
        $('#teamInfoInput').click(function () {
            window.location.href = "${pageContext.request.contextPath}/operator/team/create";
        });
        $('#teamInfoUpdate').click(function () {
            $("#teamInfoForm").submit();
        });
        $('#teamInfoDelete').click(function () {
            $("#teamInfoForm").attr("action", "${pageContext.request.contextPath}/operator/team/delete");
            $("#teamInfoForm").submit();
        });
        $('#koreanBattle').click(function () {
            var formData = 0;

            if($(this).text().indexOf("우리말겨루기 시작") > -1){
                formData = {quizNum: 1, quizProcessYN: 1};
            }else{
                formData = {quizNum: 1, quizProcessYN: 0};
            }

            $.ajax({
                url: "${pageContext.request.contextPath}/korean/battle/process",
                type: "POST",
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function (data, textStatus, jqXHR) {
                    console.log("SUCCESS: ", data);

                    if($("#koreanBattle").text().indexOf("우리말겨루기 시작") > -1) {
                        $("#koreanBattle").text('우리말겨루기 종료').button('refresh');
                    }else{
                        $("#koreanBattle").text('우리말겨루기 시작').button('refresh');
                    }
                    console.log("TEXT: ", $("#koreanBattle").text());
                    //alert(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("ERROR: ", errorThrown);
                    $("#koreanBattle").attr('value','우리말겨루기 시작').button('refresh');
                    alert("ERROR : " + errorThrown);
                }
            });
        });
        $('#koreanBattleResult').click(function () {
            window.location.href = "${pageContext.request.contextPath}/operator/battle/result";
        });
        $('#workingMemoryResult').click(function () {
            window.location.href = "${pageContext.request.contextPath}/operator/working/result";
        });
        $('#battleEndSave').click(function (event) {
            event.preventDefault();
            alert("11");
            html2canvas($('#koreanBattle'), {
                //allowTaint: true,
                //taintTest: false,
                useCORS: true,
                proxy: '/etc/proxy_image',
                onrendered: function (canvas) {
                    var imageData = canvas.toDataURL("image/png");
                    var formData = {teamCode: "A", imageData: imageData};
                    $.ajax({
                        url: "${pageContext.request.contextPath}/korean/submit",
                        type: "POST",
                        data: formData,
                        success: function (data, textStatus, jqXHR) {
                            console.log("SUCCESS: ", data);
                            alert(data);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("ERROR: ", errorThrown);
                            alert("ERROR : " + errorThrown);
                        }
                    });
                }
            });
        });

    });
</script>