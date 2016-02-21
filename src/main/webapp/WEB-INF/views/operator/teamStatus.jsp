<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <!-- head -->
    <jsp:include page="/WEB-INF/views/common/head.jsp"/>


    <script type="text/javascript">
        $(document).ready(function () {

            setInterval(function () {
                $("#teamInfoRefresh").last().trigger("click");
            }, 5000);

            $('#quizNextButton').click(function () {

                var actionUrl = "";

                if ($(this).text().indexOf("다음문제") > -1) {

                    actionUrl = "${pageContext.request.contextPath}/books/quiz/next/" + (parseInt($('#quizProcessNum').val()) + 1);
                } else {
                    actionUrl = "${pageContext.request.contextPath}/books/quiz/end/" + $('#quizProcessNum').val();
                }
                $.ajax({
                    url: actionUrl,
                    type: "POST",
                    success: function (data, textStatus, jqXHR) {
                        console.log("SUCCESS: ", data);
                        if (!data) {
                            $("#quizNextButton").text("다음문제").button('refresh');
                        } else {
                            $('#quizProcessNum').attr('value', data.NUM);
                            $('#quizNumText').html(data.NUM + "번 문제");
                            $("#quizNextButton").text(data.NUM + "번 문제 종료").button('refresh');
                        }
                        //alert(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("ERROR: ", errorThrown);

                        //alert("ERROR : " + errorThrown);
                    }
                });
            });
            $('#quizFirstChance').click(function () {
                //alert($("#teamTitleLayer_" + $("input:radio[name='radioChance']:checked").val()).css('background-color'));

                if (!$("input:radio[name='radioChance']:checked").val()) {
                    alert("팀을 선택해 주세요");
                    return false;
                }
                var teamSeq = $("input:radio[name='radioChance']:checked").val();
                $.ajax({
                    url: "${pageContext.request.contextPath}/operator/chance/1/" + teamSeq,
                    type: "POST",
                    success: function (data, textStatus, jqXHR) {
                        console.log("SUCCESS: ", data);

                        alert(data.returnMessage);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("ERROR: ", errorThrown);

                        //alert("ERROR : " + errorThrown);
                    }
                });

            });
            $('#quizDoubleChance').click(function () {
                if (!$("input:radio[name='radioChance']:checked").val()) {
                    alert("팀을 선택해 주세요");
                    return false;
                }
                var teamSeq = $("input:radio[name='radioChance']:checked").val();
                $.ajax({
                    url: "${pageContext.request.contextPath}/operator/chance/4/" + teamSeq,
                    type: "POST",
                    success: function (data, textStatus, jqXHR) {
                        console.log("SUCCESS: ", data);

                        alert(data.returnMessage);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("ERROR: ", errorThrown);

                        //alert("ERROR : " + errorThrown);
                    }
                });
            });
            $('#teamInfoRefresh').click(function () {
                console.log("페이지 Refresh");
                $.ajax({
                    url: "${pageContext.request.contextPath}/operator/team/list/process",
                    type: "GET",
                    success: function (datas, textStatus, jqXHR) {
                        console.log("SUCCESS: ", datas);
                        for (var i = datas.length; i--;) {
                            var data = datas[i];
                            //alert(data.REQUEST_CHANCE_TYPE);

                            if (data.ANSWER_SCORE == null) {
                                $('#teamTotalScore_' + data.SEQ).html(data.BASE_SCORE + '점');
                            } else {
                                $('#teamTotalScore_' + data.SEQ).html(parseInt(data.BASE_SCORE) + parseInt(data.ANSWER_SCORE) + '점');
                            }

                            switch (data.REQUEST_CHANCE_TYPE) {
                                case 1  :
                                    $("#teamTitleLayer_" + data.SEQ).css('background-color', '#f3c241');
                                    break;
                                case 2  :
                                    $('#teamTitleLayer_' + data.SEQ).css('background-color', '#ffffff');
                                    break;
                                case 3  :
                                    $('#teamTitleLayer_' + data.SEQ).css('background-color', '#17ab36');
                                    break;
                                case 4  :
                                    $('#teamTitleLayer_' + data.SEQ).css('background-color', '#2972bf');
                                    break;
                                case 5  :
                                    $('#teamTitleLayer_' + data.SEQ).css('background-color', '#ffffff');
                                    break;
                                case 6  :
                                    $('#teamTitleLayer_' + data.SEQ).css('background-color', '#ffffff');
                                    break;

                                default   :
                                    $('#teamTitleLayer_' + data.SEQ).css('background-color', '#ffffff');
                                    break;
                            }
                            if (data.CHANCE_TYPE) {
                                $('#teamQuizChanceColor_' + data.SEQ).attr('class', 'adm_chance_card' + data.CHANCE_TYPE);
                            } else {
                                $('#teamQuizChanceColor_' + data.SEQ).attr('class', 'adm_chance_card');
                            }

                            $('#teamQuizNum_' + data.SEQ).html(data.QUIZ_NUM + '번 문제');

                            if (data.QUIZ_ANSWER != null) {
                                $('#teamQuizProcessStatus_' + data.SEQ).html("문제 풀이 완료");
                                $('#teamQuizProcessColor_' + data.SEQ).attr('class', 'adm_schbox_cr5');
                            } else {
                                $('#teamQuizProcessStatus_' + data.SEQ).html("문제 풀이 진행중");
                                $('#teamQuizProcessColor_' + data.SEQ).attr('class', 'adm_schbox_cr4');
                            }
                        }
                        //alert(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("ERROR: ", errorThrown);

                        //alert("ERROR : " + errorThrown);
                    }
                });
            });

        })
        ;
    </script>
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
                    <c:forEach var="list" items="${TEAM_INFO_LIST}" varStatus="status">
                        <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="tile-stats">
                                <div id="teamTitleLayer_${list.SEQ}" class="x_title"
                                     style="margin:4px; background-color: #ffffff">
                                    <h2><input id="radioChance" name="radioChance" type="radio" class="flat"
                                               value="${list.SEQ}"
                                               style="width: 15px; height: 15px;"/>
                                        <b>${list.SCHOOL_NAME}</b> : ${list.NAME}</h2>

                                    <div class="clearfix"></div>
                                </div>

                                <div class="x_content">
                                    <div class="adm_schbox">
                                        <div id="teamQuizChanceColor_${list.SEQ}" class="adm_chance_card">

                                            <h2>
                                                <span id="teamQuizNum_${list.SEQ}">0번 문제</span><br>
                                                <span id="teamTotalScore_${list.SEQ}">0점</span><br>
                                            </h2>
                                        </div>
                                        <div id="teamQuizProcessColor_${list.SEQ}" class="adm_schbox_cr4">
                                            <h2>
                                                <span id="teamQuizProcessStatus_${list.SEQ}">문제풀이 진행중</span><br>
                                            </h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<div id="custom_notifications" class="custom-notifications dsp_none">
    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
    </ul>
    <div class="clearfix"></div>
    <div id="notif-group" class="tabbed_notifications"></div>
</div>
<input type="hidden" id="quizProcessNum" name="quizProcessNum" value="0">
</body>

</html>