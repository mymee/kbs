<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/kbsbook.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/js/jquery-ui-1.11.4.custom/jquery-ui.css"/>
    <title>KBS'책들아놀자' 독서퀴즈쇼!</title>

    <style type="text/css">
        <!--
        table {
            background-image: url(${pageContext.request.contextPath}/resources/images/bookq_bg01.png);
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }

        .style2 {
            color: #666666
        }

        .style3 {
            color: #FFFFFF
        }

        .style4 {
            font-size: 6pt
        }

        -->
    </style>

    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.11.4/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/html2canvas.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/html2canvas.svg.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/canvas2image.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.cookie.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/dalert-1.1.1/js/dalert.jquery.js"></script>

    <script>
        $(function () {
            var cssTop = parseInt($('#move_div').css('top'));
            $(window).scroll(function () {
                var position = $(window).scrollTop();
                $('#move_pop').stop().animate({'top': position + cssTop + 'px'}, 300);
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#radio").buttonset();

            $("#teamSeq").val($.cookie("SEQ"));

            if ($("#teamSeq").val() == "") {

                dalert.alert("팀/조 선택을 다시 해 주세요","선택","");

                return false;
            }

            <%--setInterval(function () {--%>
//            var formData = {teamCode: $.cookie("TEAM_CODE"), teamSeq: $.cookie("SEQ")};
            <%--$.ajax({--%>
            <%--url: "${pageContext.request.contextPath}/operator/team/info/json",--%>
            <%--type: "GET",--%>
            <%--//contentType: 'application/json',--%>
            <%--data: formData,--%>
            <%--success: function (datas, textStatus, jqXHR) {--%>
            <%--console.log("SUCCESS: ", datas);--%>
            <%--//alert($.cookie("TEAM_CODE"))--%>
            <%--$('#teamName').html(datas.NAME);--%>
            <%--$('#schoolName').html(datas.SCHOOL_NAME);--%>
            <%--if (datas.ANSWER_SCORE == null) {--%>
            <%--$('#teamTotalScore').val(datas.BASE_SCORE);--%>
            <%--} else {--%>
            <%--$('#teamTotalScore').val(parseInt(datas.BASE_SCORE) + parseInt(datas.ANSWER_SCORE));--%>
            <%--}--%>

            <%--$('#teamScore').html($('#teamTotalScore').val());--%>
            <%--if (datas.CHANCE_1) {--%>
            <%--switch (datas.CHANCE_1) {--%>
            <%--case 1  :--%>
            <%--$('#chance1').attr('src', '${pageContext.request.contextPath}/resources/images/first.png');--%>
            <%--break;--%>
            <%--case 2  :--%>
            <%--$('#chance1').attr('src', '${pageContext.request.contextPath}/resources/images/first_ask.png');--%>
            <%--break;--%>
            <%--case 3  :--%>
            <%--$('#chance1').attr('src', '${pageContext.request.contextPath}/resources/images/first_asn.png');--%>
            <%--break;--%>
            <%--case 4  :--%>
            <%--$('#chance1').attr('src', '${pageContext.request.contextPath}/resources/images/first_use.png');--%>
            <%--break;--%>
            <%--default   :--%>
            <%--$('#chance1').attr('src', '${pageContext.request.contextPath}/resources/images/first.png');--%>
            <%--break;--%>
            <%--}--%>
            <%--} else {--%>
            <%--$('#chance1').attr('src', '${pageContext.request.contextPath}/resources/images/play_use.png');--%>
            <%--}--%>
            <%--if (datas.CHANCE_2) {--%>
            <%--$('#chance2').attr('src', '${pageContext.request.contextPath}/resources/images/play_use.png');--%>
            <%--} else {--%>
            <%--$('#chance2').attr('src', '${pageContext.request.contextPath}/resources/images/play_use.png');--%>
            <%--}--%>
            <%--if (datas.CHANCE_3) {--%>
            <%--switch (datas.CHANCE_1) {--%>
            <%--case 1  :--%>
            <%--$('#chance3').attr('src', '${pageContext.request.contextPath}/resources/images/dbpoint.png');--%>
            <%--break;--%>
            <%--case 2  :--%>
            <%--$('#chance3').attr('src', '${pageContext.request.contextPath}/resources/images/dbpoint_ask.png');--%>
            <%--break;--%>
            <%--case 3  :--%>
            <%--$('#chance3').attr('src', '${pageContext.request.contextPath}/resources/images/dbpoint_asn.png');--%>
            <%--break;--%>
            <%--case 4  :--%>
            <%--$('#chance3').attr('src', '${pageContext.request.contextPath}/resources/images/dbpoint_use.png');--%>
            <%--break;--%>
            <%--default   :--%>
            <%--$('#chance3').attr('src', '${pageContext.request.contextPath}/resources/images/dbpoint.png');--%>
            <%--break;--%>
            <%--}--%>
            <%--} else {--%>
            <%--$('#chance3').attr('src', '${pageContext.request.contextPath}/resources/images/play_use.png');--%>
            <%--}--%>
            <%--if (datas.CHANCE_4) {--%>
            <%--switch (datas.CHANCE_1) {--%>
            <%--case 1  :--%>
            <%--$('#chance4').attr('src', '${pageContext.request.contextPath}/resources/images/dbchance.png');--%>
            <%--break;--%>
            <%--case 2  :--%>
            <%--$('#chance4').attr('src', '${pageContext.request.contextPath}/resources/images/dbchance_ask.png');--%>
            <%--break;--%>
            <%--case 3  :--%>
            <%--$('#chance4').attr('src', '${pageContext.request.contextPath}/resources/images/dbchance_asn.png');--%>
            <%--break;--%>
            <%--case 4  :--%>
            <%--$('#chance4').attr('src', '${pageContext.request.contextPath}/resources/images/dbchance_use.png');--%>
            <%--break;--%>
            <%--default   :--%>
            <%--$('#chance4').attr('src', '${pageContext.request.contextPath}/resources/images/dbchance.png');--%>
            <%--break;--%>
            <%--}--%>

            <%--} else {--%>
            <%--$('#chance4').attr('src', '${pageContext.request.contextPath}/resources/images/play_use.png');--%>
            <%--}--%>
            <%--if (datas.CHANCE_5) {--%>
            <%--$('#chance5').attr('src', '${pageContext.request.contextPath}/resources/images/play_use.png');--%>
            <%--} else {--%>
            <%--$('#chance5').attr('src', '${pageContext.request.contextPath}/resources/images/play_use.png');--%>
            <%--}--%>
            <%--if (datas.CHANCE_6) {--%>
            <%--$('#chance6').attr('src', '${pageContext.request.contextPath}/resources/images/play_use.png');--%>
            <%--} else {--%>
            <%--$('#chance6').attr('src', '${pageContext.request.contextPath}/resources/images/play_use.png');--%>
            <%--}--%>


            <%--//출제영역--%>
            <%--$("#quizDisplayNumber").html("");--%>
            <%--$("#quizDisplayLayer").html("");--%>

            <%--switch (datas.QUIZ_TYPE) {--%>
            <%--case 1:--%>
            <%--$("#quizDisplayNumber").append('<h1>');--%>
            <%--$("#quizDisplayNumber").append('<sapn id="quizNumView">' + datas.PROCESS_QUIZ_NUM + '번 문제</sapn>');--%>
            <%--$("#quizDisplayNumber").append('<span>(객관식)</span>');--%>
            <%--$("#quizDisplayNumber").append('</h1>');--%>

            <%--$("#quizDisplayLayer").append('<div id="radio" style="text-align:center; margin:0 auto; font-size: 55px;">');--%>
            <%--$("#quizDisplayLayer").append('<input type="radio" id="quizAnswer1" name="quizAnswer" value="1"><label for="quizAnswer1">1번</label>');--%>
            <%--$("#quizDisplayLayer").append('<input type="radio" id="quizAnswer2" name="quizAnswer" value="2"><label for="quizAnswer2">2번</label>');--%>
            <%--$("#quizDisplayLayer").append('<input type="radio" id="quizAnswer3" name="quizAnswer" value="3"><label for="quizAnswer3">3번</label>');--%>
            <%--$("#quizDisplayLayer").append('<input type="radio" id="quizAnswer4" name="quizAnswer" value="4"><label for="quizAnswer4">4번</label>');--%>
            <%--$("#quizDisplayLayer").append('<input type="radio" id="quizAnswer5" name="quizAnswer" value="5"><label for="quizAnswer5">5번</label>');--%>
            <%--$("#quizDisplayLayer").append('</div>');--%>
            <%--break;--%>
            <%--case 2:--%>
            <%--$("#quizDisplayNumber").append('<h1>');--%>
            <%--$("#quizDisplayNumber").append('<sapn id="quizNumView">' + datas.PROCESS_QUIZ_NUM + '번 문제</sapn>');--%>
            <%--$("#quizDisplayNumber").append('<span>(OX)</span>');--%>
            <%--$("#quizDisplayNumber").append('</h1>');--%>

            <%--$("#quizDisplayLayer").append('<div id="radio" style="text-align:center; margin:0 auto; font-size: 90px;">');--%>
            <%--$("#quizDisplayLayer").append('    <input type="radio" id="quizAnswer1" name="quizAnswer" value="O"><label for="quizAnswer1">O</label>');--%>
            <%--$("#quizDisplayLayer").append('    <input type="radio" id="quizAnswer2" name="quizAnswer" value="X"><label for="quizAnswer2">X</label>');--%>
            <%--$("#quizDisplayLayer").append('</div>');--%>
            <%--break;--%>
            <%--case 3:--%>
            <%--$("#quizDisplayNumber").append('<h1>');--%>
            <%--$("#quizDisplayNumber").append('<sapn id="quizNumView">' + datas.PROCESS_QUIZ_NUM + '번 문제</sapn>');--%>
            <%--$("#quizDisplayNumber").append('<span>(주관식)</span>');--%>
            <%--$("#quizDisplayNumber").append('</h1>');--%>

            <%--$("#quizDisplayLayer").append('<textarea id="quizAnswer" name="quizAnswer" wrap="VIRTUAL" style="text-align:center; color: #fff; font-size: 100px;font-weight: bold; border: 0px; overflow-y: hidden; margin: 0px; width: 1122px; height: 394px; background-color: transparent;"></textarea>');--%>
            <%--break;--%>
            <%--default:--%>
            <%--break;--%>
            <%--}--%>

            <%--//                        $("#quizDisplayNumber").page("destroy").page();--%>
            <%--//                        $("#quizDisplayLayer").page();--%>

            <%--//alert(data);--%>
            <%--},--%>
            <%--error: function (jqXHR, textStatus, errorThrown) {--%>
            <%--console.log("ERROR: ", errorThrown);--%>
            <%--alert("ERROR : " + errorThrown);--%>
            <%--}--%>
            <%--});--%>
            <%--$("#radio").buttonset().buttonset('refresh');--%>
            <%--}, 5000);--%>

            setInterval(function () {
                var formData = {teamCode: $.cookie("TEAM_CODE"), teamSeq: $.cookie("SEQ")};
                $.ajax({
                    url: "${pageContext.request.contextPath}/operator/team/info/json",
                    type: "GET",
                    //contentType: 'application/json',
                    data: formData,
                    success: function (datas, textStatus, jqXHR) {
                        console.log("SUCCESS: ", datas);
                        var processQuizNum = datas.PROCESS_QUIZ_NUM.toString();
                        var oldProcessQuizNum = $("#quizNum").val().toString();
                        //alert(processQuizNum);
                        console.log("QUIZ_NUM",processQuizNum,oldProcessQuizNum);
                        if(processQuizNum != oldProcessQuizNum){
                            console.log("RELOAD: ", processQuizNum);
                            location.reload();
                        }
                        //alert(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("ERROR: ", errorThrown);

                        //alert(errorThrown);
                    }
                });
            }, 5000);
            $('#quizAnswerSave').click(function () {

                var quizAnswer = "";
                <c:if test="${TEAM_QUIZ_PROCESS.QUIZ_TYPE == 1 || TEAM_QUIZ_PROCESS.QUIZ_TYPE == 2 }">
                quizAnswer = $("input[name=quizAnswer]:checked").val();
                //result = confirm($("input[name=quizAnswer]:checked").val() + " 선택하셨습니다.\n정답을 입력 하시겠습니까?");
                </c:if>

                <c:if test="${TEAM_QUIZ_PROCESS.QUIZ_TYPE == 3}">
                quizAnswer = $("textarea[name=quizAnswer]").val();
                //result = confirm($("textarea[name=quizAnswer]").val() + "\n정답을 입력 하시겠습니까?");
                </c:if>

                if (quizAnswer == null || quizAnswer == "") {
                    dalert.alert("답을 입력해주세요","입력","");

                    return false;
                }
                dalert.confirm("입력한 '" + quizAnswer + "'을(를) \n답으로 입력 하시겠습니까?","문제풀이 저장",function(result){
                    if(result){
                        var formData = {
                            teamSeq: $("#teamSeq").val(),
                            quizNum: $("#quizNum").val(),
                            quizAnswer: quizAnswer,
                            quizChance: $("#quizChance").val()
                        };
                        $.ajax({
                            url: '${pageContext.request.contextPath}/books/quiz/submit',
                            type: "POST",
                            contentType: 'application/json',
                            data: JSON.stringify(formData),
                            success: function (data, textStatus, jqXHR) {
                                console.log("SUCCESS: ", data);
                                dalert.alert(data.returnMessage,"성공","");

                                //location.reload();
                                //alert(data);
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log("ERROR: ", errorThrown);
                                dalert.alert(errorThrown,"실패","");
                            }
                        });
                    }
                    else{
                        return false;
                    }
                });

            });
            //우선권찬스
            $('#quizChance1,#quizChance2,#quizChance3,#quizChance4,#quizChance5,#quizChance6').click(function () {

                return false;
                if ($(this).children().first().attr('src') == "/resources/images/play_use.png") {
                    return false;
                }

                var quizChanceType = 0;
                switch ($(this).attr('id')) {
                    case 'quizChance1'  :
                        quizChanceType = 1;
                        break;
                    case 'quizChance2'  :
                        quizChanceType = 2;
                        break;
                    case 'quizChance3'  :
                        quizChanceType = 3;
                        break;
                    case 'quizChance4'  :
                        quizChanceType = 4;
                        break;
                    case 'quizChance5'  :
                        quizChanceType = 5;
                        break;
                    case 'quizChance6'  :
                        quizChanceType = 6;
                        break;
                    default   :
                        quizChanceType = 0;
                        break;
                }
                var actionUrl = "${pageContext.request.contextPath}/books/quiz/" + quizChanceType + "/" + $.cookie("SEQ");

                $.ajax({
                    url: actionUrl,
                    type: "POST",
                    success: function (data, textStatus, jqXHR) {
                        console.log("SUCCESS: ", data);
                        if (data.returnCode > 0) {
                            switch (quizChanceType) {
                                case 1 :
                                    $('#chance1').attr('src', '${pageContext.request.contextPath}/resources/images/first_ask.png');
                                    break;
                                case 2 :
                                    $('#chance2').attr('src', '${pageContext.request.contextPath}/resources/images/play_use.png');
                                    break;
                                case 3 :
                                    $('#chance3').attr('src', '${pageContext.request.contextPath}/resources/images/dbpoint_ask.png');
                                    break;
                                case 4 :
                                    $('#chance4').attr('src', '${pageContext.request.contextPath}/resources/images/dbchance_ask.png');
                                    break;
                                case 5 :
                                    $('#chance5').attr('src', '${pageContext.request.contextPath}/resources/images/play_use.png');
                                    break;
                                case 6 :
                                    $('#chance6').attr('src', '${pageContext.request.contextPath}/resources/images/play_use.png');
                                    break;
                                default   :
                                    $('#chance1').attr('src', '${pageContext.request.contextPath}/resources/images/play_use.png');
                                    break;
                            }

                            $("#quizChance").val(quizChanceType);
                        }
                        dalert.alert(data.returnMessage,"성공","");
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("ERROR: ", errorThrown);
                        dalert.alert(errorThrown,"실패","");
                    }
                });
            });
//
//            //영상찬스
//            $('#quizChance2').click(function () {
//                if($('#chance2').attr('src') == "/resources/images/play.png"){
//                    return false;
//                }
//            });
//            //더블점수찬스
//            $('#quizChance3').click(function () {
//                if($('#chance3').attr('src') == "/resources/images/play.png"){
//                    return false;
//                }
//            });
//            //더블찬스
//            $('#quizChance4').click(function () {
//                if($('#chance4').attr('src') == "/resources/images/play.png"){
//                    return false;
//                }
//            });
//            $('#quizChance5').click(function () {
//                if($('#chance5').attr('src') == "/resources/images/play.png"){
//                    return false;
//                }
//            });
//            $('#quizChance6').click(function () {
//                if($('#chance6').attr('src') == "/resources/images/play.png"){
//                    return false;
//                }
//            });
        });
    </script>
</head>

<body>
<form id="quizForm" method="GET" action="">
    <table width="1920" height="1080" border="0" cellspacing="0" cellpadding="0">
        <tbody>
        <tr>
            <td>
                <!-- 독서퀴즈 팀명/팀구호 부분 -->
                <div class='tit_div'>
                    <h1><span id="teamName">${TEAM_QUIZ_PROCESS.NAME}</span></h1>
                </div>
                <!-- 독서퀴즈 팀명/팀구호 부분 -->

                <!-- 독서퀴즈 학교명 부분 -->
                <div class='tit_div23'>
                    <h1><span id="schoolName">${TEAM_QUIZ_PROCESS.SCHOOL_NAME}</span></h1>
                </div>
                <!-- 독서퀴즈 학교명 부분 -->

                <!-- 독서퀴즈 점수 부분 -->
                <div class='tit_div3'>
                    <h1><span id="teamScore">${TEAM_QUIZ_PROCESS.TOTAL_SCORE}</span></h1>
                </div>
                <!-- 독서퀴즈 점수 부분 -->

                <!-- 독서퀴즈 찬스카드 부분 -->
                <div class='tit_div4'>
                    <span><a id="quizChance1" name="quizChance1" href="#"><img id="chance1"
                                                                               src="${pageContext.request.contextPath}/resources/images/dbpoint.png"
                                                                               style="border:none"></a></span>
                    <span><a id="quizChance2" name="quizChance2" href="#"><img id="chance2"
                                                                               src="${pageContext.request.contextPath}/resources/images/first.png"
                                                                               style="border:none"></a></span>
                    <span><a id="quizChance3" name="quizChance3" href="#"><img id="chance3"
                                                                               src="${pageContext.request.contextPath}/resources/images/dbchance.png"
                                                                               style="border:none"></a></span>
                    <span><a id="quizChance4" name="quizChance4" href="#"><img id="chance4"
                                                                               src="${pageContext.request.contextPath}/resources/images/play.png"
                                                                               style="border:none"></a></span>
                    <span><a id="quizChance5" name="quizChance5" href="#"><img id="chance5"
                                                                               src="${pageContext.request.contextPath}/resources/images/play.png"
                                                                               style="border:none"></a></span>
                    <span><a id="quizChance6" name="quizChance6" href="#"><img id="chance6"
                                                                               src="${pageContext.request.contextPath}/resources/images/play.png"
                                                                               style="border:none"></a></span>
                </div>
                <!-- 독서퀴즈 찬스카드 부분 -->

                <!-- 독서퀴즈 문제번호 부분 -->
                <div id="quizDisplayNumber" class='ques_no'>
                    <h1>
                        <c:if test="${!empty TEAM_QUIZ_PROCESS.PROCESS_QUIZ_NUM && TEAM_QUIZ_PROCESS.PROCESS_QUIZ_NUM != '0'}">
                            <sapn id="quizNumView">${TEAM_QUIZ_PROCESS.PROCESS_QUIZ_NUM}번 문제</sapn>
                        </c:if>
                        <c:if test="${TEAM_QUIZ_PROCESS.QUIZ_TYPE == 1}">
                            <span>(객관식)</span>
                        </c:if>
                        <c:if test="${TEAM_QUIZ_PROCESS.QUIZ_TYPE == 2}">
                            <span>(OX)</span>
                        </c:if>
                        <c:if test="${TEAM_QUIZ_PROCESS.QUIZ_TYPE == 3}">
                            <span>(주관식)</span>
                        </c:if>
                    </h1>
                </div>
                <!-- 독서퀴즈 문제번호 부분 -->

                <!-- 독서퀴즈 문제 부분 -->
                <div id="quizDisplayLayer" class='ques_tit'>
                    <c:if test="${TEAM_QUIZ_PROCESS.QUIZ_TYPE == 1}">
                        <div id="radio" style="text-align:center; margin:0 auto; font-size: 55px;">
                            <input type="radio" id="quizAnswer1" name="quizAnswer" value="1"><label
                                for="quizAnswer1">1번</label>
                            <input type="radio" id="quizAnswer2" name="quizAnswer" value="2"><label
                                for="quizAnswer2">2번</label>
                            <input type="radio" id="quizAnswer3" name="quizAnswer" value="3"><label
                                for="quizAnswer3">3번</label>
                            <input type="radio" id="quizAnswer4" name="quizAnswer" value="4"><label
                                for="quizAnswer4">4번</label>
                            <input type="radio" id="quizAnswer5" name="quizAnswer" value="5"><label
                                for="quizAnswer5">5번</label>
                        </div>
                    </c:if>
                    <c:if test="${TEAM_QUIZ_PROCESS.QUIZ_TYPE == 2}">
                        <div id="radio" style="text-align:center; margin:0 auto; font-size: 90px;">
                            <input type="radio" id="quizAnswer1" name="quizAnswer" value="O"><label
                                for="quizAnswer1">O</label>
                            <input type="radio" id="quizAnswer2" name="quizAnswer" value="X"><label
                                for="quizAnswer2">X</label>
                        </div>
                    </c:if>
                    <c:if test="${TEAM_QUIZ_PROCESS.QUIZ_TYPE == 3}">
                        <textarea id="quizAnswer" name="quizAnswer" wrap="VIRTUAL"
                                  style="text-align:center; color: #fff; font-size: 100px;font-weight: bold; border: 0px; overflow-y: hidden; margin: 0px; width: 1122px; height: 394px; background-color: transparent;"></textarea>
                    </c:if>
                </div>
                <!-- 독서퀴즈 문제 부분 -->
                <c:if test="${!empty TEAM_QUIZ_PROCESS.PROCESS_QUIZ_NUM && TEAM_QUIZ_PROCESS.PROCESS_QUIZ_NUM != '0'}">
                    <!-- 독서퀴즈 정답입력 버튼 부분 -->
                    <div class='ques_btn'>
                        <span><a id="quizAnswerSave" href="#"><img
                                src="${pageContext.request.contextPath}/resources/images/btn_save2.png" style="border:none"></a></span>
                    </div>
                    <!-- 독서퀴즈 정답입력 버튼 부분 -->
                </c:if>
            </td>
        </tr>
        </tbody>
    </table>
    <input type="hidden" id="teamSeq" name="teamSeq" value="">
    <input type="hidden" id="quizType" name="quizType" value="${TEAM_QUIZ_PROCESS.QUIZ_TYPE}">
    <input type="hidden" id="quizNum" name="quizNum" value="${TEAM_QUIZ_PROCESS.PROCESS_QUIZ_NUM}">
    <input type="hidden" id="quizChance" name="quizChance" value="">
    <input type="hidden" id="teamTotalScore" name="teamTotalScore" value="0">
</form>
</body>
</html>
