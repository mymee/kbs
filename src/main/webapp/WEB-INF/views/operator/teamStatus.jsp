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
            $.ajax({
                url: "${pageContext.request.contextPath}/operator/team/list/process",
                type: "GET",
                success: function (datas, textStatus, jqXHR) {
                    console.log("SUCCESS: ", datas);
                    $("#selectDoubleChance").find("option").remove();
                    $("#selectDoubleChance").prepend("<option value=''>내꺼하자팀</option>");
                    $("#selectDoubleTarget").find("option").remove();
                    $("#selectDoubleTarget").prepend("<option value=''>타겟팀</option>");
                    for (var i = 0; i < datas.length; i++) {
                        var data = datas[i];
                        //alert(data.REQUEST_CHANCE_TYPE);

                        $("#selectDoubleChance").append("<option value='" + data.SEQ + "'>" + data.SCHOOL_NAME + "</option>");
                        $("#selectDoubleTarget").append("<option value='" + data.SEQ + "'>" + data.SCHOOL_NAME + "</option>");
//                            $("#selectDoubleChance option:eq(" + i + ")").after("<option value='" + data.SEQ + "'>" + data.SCHOOL_NAME + "</option>");
//                            $("#selectDoubleTarget option:eq(" + i + ")").after("<option value='" + data.SEQ + "'>" + data.SCHOOL_NAME + "</option>");
                        if (data.ANSWER_SCORE == null) {
                            $('#teamTotalScore_' + data.SEQ).html(data.BASE_SCORE + '점');
                        } else {
                            $('#teamTotalScore_' + data.SEQ).html(parseInt(data.BASE_SCORE) + parseInt(data.ANSWER_SCORE) + '점');
                        }

                        switch (data.REQUEST_CHANCE_TYPE) {
                            case 1  :
                                $("#teamTitleLayer_" + data.SEQ).css('background-color', '#f3c241');
                                $('#teamQuizNum_' + data.SEQ).html('우선권 찬스 배정');
                                break;
                            case 2  :
                                $('#teamTitleLayer_' + data.SEQ).css('background-color', '#ffffff');
                                $('#teamQuizNum_' + data.SEQ).html('영상 찬스 배정');
                                break;
                            case 3  :
                                $('#teamTitleLayer_' + data.SEQ).css('background-color', '#17ab36');
                                $('#teamQuizNum_' + data.SEQ).html('더블점수 찬스 배정');
                                break;
                            case 4  :
                                $('#teamTitleLayer_' + data.SEQ).css('background-color', '#2972bf');
                                $('#teamQuizNum_' + data.SEQ).html('내꺼하자 찬스 배정');
                                break;
                            case 5  :
                                $('#teamTitleLayer_' + data.SEQ).css('background-color', '#ffffff');
                                $('#teamQuizNum_' + data.SEQ).html('');
                                break;
                            case 6  :
                                $('#teamTitleLayer_' + data.SEQ).css('background-color', '#ffffff');
                                $('#teamQuizNum_' + data.SEQ).html('');
                                break;

                            default   :
                                $('#teamTitleLayer_' + data.SEQ).css('background-color', '#ffffff');
                                $('#teamQuizNum_' + data.SEQ).html('');
                                break;
                        }
                        if (data.CHANCE_TYPE) {
                            $('#teamQuizChanceColor_' + data.SEQ).attr('class', 'adm_chance_card' + data.CHANCE_TYPE);
                        } else {
                            $('#teamQuizChanceColor_' + data.SEQ).attr('class', 'adm_chance_card');
                        }


                        if (data.QUIZ_ANSWER != null) {
                            $('#teamQuizProcessStatus_' + data.SEQ).html(data.QUIZ_ANSWER);
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
            setInterval(function () {
                $("#teamInfoRefresh").last().trigger("click");
            }, 50000);

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

                        if (parseInt(data.QUIZ_END) > 0) {
                            $('#quizProcessNum').attr('value', data.QUIZ_NUM);
                            $('#quizNumText').html(data.QUIZ_NUM + "번 문제");
                            $("#quizNextButton").text("다음문제").button('refresh');
                        } else {
                            $('#quizProcessNum').attr('value', data.QUIZ_NUM);
                            $('#quizNumText').html(data.QUIZ_NUM + "번 문제");
                            $("#quizNextButton").text(data.QUIZ_NUM + "번 문제 종료").button('refresh');
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("ERROR: ", errorThrown);
                    }
                });
            });
            // 체크 박스 모두 해제
            $("#checkAllDisable").click(function () {
                $("input[name=checkboxChance]:checkbox").each(function () {
                    $(this).attr("checked", false);
                });
            });
            $('#quizDoubleChance').click(function () {
                if ($("#selectDoubleChance option:selected").val() == "") {
                    dalert.alert("내꺼하자 찬스팀을 선택하세요", "선택", "");
                    return false;
                }
                if ($("#selectDoubleTarget option:selected").val() == "") {
                    dalert.alert("내꺼하자 타겟팀을 선택하세요", "선택", "");
                    return false;
                }
                if ($("#selectDoubleChance option:selected").val() == $("#selectDoubleTarget option:selected").val()) {
                    alert($("#selectDoubleChance option:selected").val());
                    dalert.alert("내꺼하자 찬스팀과 타겟팀이 달라야 합니다.", "확인", "");
                    return false;
                }
                var teamSeq = [];
                teamSeq.push($("#selectDoubleChance option:selected").val());
                teamSeq.push($("#selectDoubleTarget option:selected").val());
                console.log(teamSeq);
                $.ajax({
                    url: "${pageContext.request.contextPath}/operator/chance/4/" + teamSeq,
                    type: "POST",
                    success: function (data, textStatus, jqXHR) {
                        console.log("SUCCESS: ", data);

                        dalert.alert(data.returnMessage, "성공", "");
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("ERROR: ", errorThrown);

                        //alert("ERROR : " + errorThrown);
                    }
                });
                $("#teamInfoRefresh").last().trigger("click");
            });

            $('#quizDoubleScoreChance, #quizFirstChance').click(function () {
                //alert($("#teamTitleLayer_" + $("input:radio[name='radioChance']:checked").val()).css('background-color'));

                if (!$("input:checkbox[name='checkboxChance']:checked").val()) {
                    dalert.alert("다음 문제에 찬스권을 배정할 팀을 선택해 주세요", "선택", "");
                    return false;
                }
                var actionUrl = "";
                switch ($(this).attr('id')) {
                    case "quizFirstChance":
                        actionUrl = "${pageContext.request.contextPath}/operator/chance/1/";
                        break;
                    case "quizDoubleScoreChance":
                        actionUrl = "${pageContext.request.contextPath}/operator/chance/3/";
                        break;
                    case "quizDoubleChance":
                        actionUrl = "${pageContext.request.contextPath}/operator/chance/4/";
                        break;
                }
                var teamSeq = [];
                $("input[name=checkboxChance]:checked").each(function () {
                    teamSeq.push($(this).val());
                });
                $.ajax({
                    url: actionUrl + teamSeq,
                    type: "POST",
                    success: function (data, textStatus, jqXHR) {
                        console.log("SUCCESS: ", data);

                        dalert.alert(data.returnMessage, "성공", "");
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("ERROR: ", errorThrown);

                        //alert("ERROR : " + errorThrown);
                    }
                });

                $("#checkAllDisable").last().trigger("click");
                $("#teamInfoRefresh").last().trigger("click");
            });
            <%----%>
            <%--$('#quizDoubleChance').click(function () {--%>
            <%--if (!$("input:checkbox[name='checkboxChance']:checked").val()) {--%>
            <%--alert("팀을 선택해 주세요");--%>
            <%--return false;--%>
            <%--}--%>
            <%--var teamSeq = [];--%>
            <%--$("input[name=checkboxChance]:checked").each(function() {--%>
            <%--teamSeq.push($(this).val());--%>
            <%--});--%>
            <%--//var teamSeq = $("input:checkbox[name='checkboxChance']:checked").val();--%>

            <%--$.ajax({--%>
            <%--url: "${pageContext.request.contextPath}/operator/chance/4/" + teamSeq,--%>
            <%--type: "GET",--%>
            <%--success: function (data, textStatus, jqXHR) {--%>
            <%--console.log("SUCCESS: ", data);--%>

            <%--alert(data.returnMessage);--%>
            <%--},--%>
            <%--error: function (jqXHR, textStatus, errorThrown) {--%>
            <%--console.log("ERROR: ", errorThrown);--%>

            <%--//alert("ERROR : " + errorThrown);--%>
            <%--}--%>
            <%--});--%>
            <%--});--%>
            $('#teamInfoRefresh').click(function () {
                console.log("페이지 Refresh");
                $.ajax({
                    url: "${pageContext.request.contextPath}/operator/team/list/process",
                    type: "GET",
                    success: function (datas, textStatus, jqXHR) {
                        console.log("SUCCESS: ", datas);
//                        $("#selectDoubleChance").find("option").remove();
//                        $("#selectDoubleChance").prepend("<option value=''>내꺼하자팀</option>");
//                        $("#selectDoubleTarget").find("option").remove();
//                        $("#selectDoubleTarget").prepend("<option value=''>타겟팀</option>");
                        for (var i = 0; i < datas.length; i++) {
                            var data = datas[i];
                            //alert(data.REQUEST_CHANCE_TYPE);

                            //$("#selectDoubleChance").append("<option value='" + data.SEQ + "'>" + data.SCHOOL_NAME + "</option>");
                            //$("#selectDoubleTarget").append("<option value='" + data.SEQ + "'>" + data.SCHOOL_NAME + "</option>");
//                            $("#selectDoubleChance option:eq(" + i + ")").after("<option value='" + data.SEQ + "'>" + data.SCHOOL_NAME + "</option>");
//                            $("#selectDoubleTarget option:eq(" + i + ")").after("<option value='" + data.SEQ + "'>" + data.SCHOOL_NAME + "</option>");
                            if (data.ANSWER_SCORE == null) {
                                $('#teamTotalScore_' + data.SEQ).html(data.BASE_SCORE + '점');
                            } else {
                                $('#teamTotalScore_' + data.SEQ).html(parseInt(data.BASE_SCORE) + parseInt(data.ANSWER_SCORE) + '점');
                            }

                            switch (data.REQUEST_CHANCE_TYPE) {
                                case 1  :
                                    $("#teamTitleLayer_" + data.SEQ).css('background-color', '#f3c241');
                                    $('#teamQuizNum_' + data.SEQ).html('우선권 찬스 배정');
                                    break;
                                case 2  :
                                    $('#teamTitleLayer_' + data.SEQ).css('background-color', '#ffffff');
                                    $('#teamQuizNum_' + data.SEQ).html('영상 찬스 배정');
                                    break;
                                case 3  :
                                    $('#teamTitleLayer_' + data.SEQ).css('background-color', '#17ab36');
                                    $('#teamQuizNum_' + data.SEQ).html('더블점수 찬스 배정');
                                    break;
                                case 4  :
                                    $('#teamTitleLayer_' + data.SEQ).css('background-color', '#2972bf');
                                    $('#teamQuizNum_' + data.SEQ).html('내꺼하자 찬스 배정');
                                    break;
                                case 5  :
                                    $('#teamTitleLayer_' + data.SEQ).css('background-color', '#ffffff');
                                    $('#teamQuizNum_' + data.SEQ).html('');
                                    break;
                                case 6  :
                                    $('#teamTitleLayer_' + data.SEQ).css('background-color', '#ffffff');
                                    $('#teamQuizNum_' + data.SEQ).html('');
                                    break;

                                default   :
                                    $('#teamTitleLayer_' + data.SEQ).css('background-color', '#ffffff');
                                    $('#teamQuizNum_' + data.SEQ).html('');
                                    break;
                            }
                            if (data.CHANCE_TYPE) {
                                $('#teamQuizChanceColor_' + data.SEQ).attr('class', 'adm_chance_card' + data.CHANCE_TYPE);
                            } else {
                                $('#teamQuizChanceColor_' + data.SEQ).attr('class', 'adm_chance_card');
                            }


                            if (data.QUIZ_ANSWER != null) {
                                $('#teamQuizProcessStatus_' + data.SEQ).html(data.QUIZ_ANSWER);
                                $('#teamQuizProcessColor_' + data.SEQ).attr('class', 'adm_schbox_cr5');
                            } else {
                                $('#teamQuizProcessStatus_' + data.SEQ).html("문제 풀이 진행중");
                                $('#teamQuizProcessColor_' + data.SEQ).attr('class', 'adm_schbox_cr4');
                            }

                            if (parseInt(data.QUIZ_END) > 0) {
                                $('#quizProcessNum').attr('value', data.QUIZ_NUM);
                                $('#quizNumText').html(data.QUIZ_NUM + "번 문제");
                                $("#quizNextButton").text("다음문제").button('refresh');
                            } else {
                                $('#quizProcessNum').attr('value', data.QUIZ_NUM);
                                $('#quizNumText').html(data.QUIZ_NUM + "번 문제");
                                $("#quizNextButton").text(data.QUIZ_NUM + "번 문제 종료").button('refresh');
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

        });
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
                                    <h2><input id="checkboxChance" name="checkboxChance" type="checkbox" class="flat"
                                               value="${list.SEQ}"
                                               style="width: 15px; height: 15px;"/>
                                        <b>${list.SCHOOL_NAME}</b> : ${list.NAME}</h2>

                                    <div class="clearfix"></div>
                                </div>

                                <div class="x_content">
                                    <div class="adm_schbox">
                                        <div id="teamQuizChanceColor_${list.SEQ}" class="adm_chance_card">

                                            <h2>
                                                <span style="font-size: 25px;" id="teamTotalScore_${list.SEQ}">0점</span><br>
                                                <span style="font-size: 15px;" id="teamQuizNum_${list.SEQ}"></span><br>
                                            </h2>
                                        </div>

                                        <div id="teamQuizProcessColor_${list.SEQ}" style="text-align: center;"
                                             class="adm_schbox_cr4">
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