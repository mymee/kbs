<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/kbsbook.css"/>

    <title>KBS'책들아놀자' 독서퀴즈쇼!</title>
    <style type="text/css">
        <!--
        table {
            background-image: url(${pageContext.request.contextPath}/resources/images/woori_bg01.png);
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
    <script src="${pageContext.request.contextPath}/resources/js/html2canvas.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/html2canvas.svg.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/canvas2image.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.cookie.js"></script>
    <script type="text/javascript">
        //LZW Compression/Decompression for Strings
        var LZW = {
            compress: function (uncompressed) {
                "use strict";
                // Build the dictionary.
                var i,
                        dictionary = {},
                        c,
                        wc,
                        w = "",
                        result = [],
                        dictSize = 256;
                for (i = 0; i < 256; i += 1) {
                    dictionary[String.fromCharCode(i)] = i;
                }

                for (i = 0; i < uncompressed.length; i += 1) {
                    c = uncompressed.charAt(i);
                    wc = w + c;
                    //Do not use dictionary[wc] because javascript arrays
                    //will return values for array['pop'], array['push'] etc
                    // if (dictionary[wc]) {
                    if (dictionary.hasOwnProperty(wc)) {
                        w = wc;
                    } else {
                        result.push(dictionary[w]);
                        // Add wc to the dictionary.
                        dictionary[wc] = dictSize++;
                        w = String(c);
                    }
                }

                // Output the code for w.
                if (w !== "") {
                    result.push(dictionary[w]);
                }
                return result;
            },


            decompress: function (compressed) {
                "use strict";
                // Build the dictionary.
                var i,
                        dictionary = [],
                        w,
                        result,
                        k,
                        entry = "",
                        dictSize = 256;
                for (i = 0; i < 256; i += 1) {
                    dictionary[i] = String.fromCharCode(i);
                }

                w = String.fromCharCode(compressed[0]);
                result = w;
                for (i = 1; i < compressed.length; i += 1) {
                    k = compressed[i];
                    if (dictionary[k]) {
                        entry = dictionary[k];
                    } else {
                        if (k === dictSize) {
                            entry = w + w.charAt(0);
                        } else {
                            return null;
                        }
                    }

                    result += entry;

                    // Add w+entry[0] to the dictionary.
                    dictionary[dictSize++] = w + entry.charAt(0);

                    w = entry;
                }
                return result;
            }
        }
        //                , // For Test Purposes
        //                comp = LZW.compress("TOBEORNOTTOBEORTOBEORNOT"),
        //                decomp = LZW.decompress(comp);
        //                document.write(comp + '<br>' + decomp);
    </script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#teamCode").val($.cookie("TEAM_CODE"));
            $('#teamName').html($.cookie("NAME"));
            $('#schoolName').html($.cookie("SCHOOL_NAME"));
            $('#quizStart').click(function () {
                $("#quizAnswer1").prop('readonly', false);
                $("#quizAnswer2").prop('readonly', false);
                $("#quizAnswer3").prop('readonly', false);
                $("#quizAnswer4").prop('readonly', false);
                $("#quizAnswer5").prop('readonly', false);
                $("#quizAnswer6").prop('readonly', false);
                $("#quizAnswer7").prop('readonly', false);
                $("#quizAnswer8").prop('readonly', false);
            });
            $('#battleEndSave').click(function () {

                var result = confirm($("#teamCode").val() + '조 문제풀이를 종료하시겠습니까?');
                if (!result) {
                    return false;
                }
                $('body').css('cursor', 'wait');

                html2canvas($('#koreanBattle'), {
                    //allowTaint: true,
                    //taintTest: false,
                    useCORS: true,
                    proxy: '/etc/proxy_image',
                    onrendered: function (canvas) {
                        var imageData = canvas.toDataURL("image/png");
                        //Canvas2Image.saveAsPNG(canvas);
                        //console.log("IMAGE: ", imageData);
                        var imageDataCompress = LZW.compress(imageData);

                        console.log("quizAnswer1", $('#quizAnswer1').val());
                        console.log("quizAnswer2", $('#quizAnswer2').val());
                        console.log("quizAnswer3", $('#quizAnswer3').val());
                        console.log("quizAnswer4", $('#quizAnswer4').val());
                        console.log("quizAnswer5", $('#quizAnswer5').val());
                        console.log("quizAnswer6", $('#quizAnswer6').val());
                        console.log("quizAnswer7", $('#quizAnswer7').val());
                        console.log("quizAnswer8", $('#quizAnswer8').val());

                        var formData = {
                            teamCode: $("#teamCode").val(),
                            quizAnswer1: $('#quizAnswer1').val(),
                            quizAnswer2: $('#quizAnswer2').val(),
                            quizAnswer3: $('#quizAnswer3').val(),
                            quizAnswer4: $('#quizAnswer4').val(),
                            quizAnswer5: $('#quizAnswer5').val(),
                            quizAnswer6: $('#quizAnswer6').val(),
                            quizAnswer7: $('#quizAnswer7').val(),
                            quizAnswer8: $('#quizAnswer8').val(),
                            imageData: imageDataCompress
                        };
                        $.ajax({
                            url: "${pageContext.request.contextPath}/korean/battle/save",
                            type: "POST",
                            //cache: false,
                            //processData: false,
                            contentType: 'application/json',
                            data: JSON.stringify(formData),
                            success: function (data, textStatus, jqXHR) {
                                $('body').css('cursor', 'auto');
                                alert("정상적으로 저장 되었습니다.");
                                console.log("SUCCESS: ", data);
                                //alert(data);
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                $('body').css('cursor', 'auto');
                                alert("저장에 실패하였습니다.");
                                console.log("ERROR: ", errorThrown);
                                //alert("ERROR : " + errorThrown);
                            }
                        });
                    }
                });
                $('body').css('cursor', 'auto');
            });
        });
    </script>
</head>

<body>
<div>
    <form id="koreaBattleForm" name="koreaBattleForm" method="POST">
        <table id="koreanBattle" name="koreanBattle" width="1920" height="1080" border="0" cellspacing="0"
               cellpadding="0">
            <tbody>
            <tr>
                <td>

                    <!-- 우리말겨루기 팀명/팀구호 부분 -->
                    <div class='tit_div_w'>
                        <h1><span id="teamName">팀명</span></h1>
                    </div>
                    <!-- 우리말겨루기 팀명/팀구호 부분 -->

                    <!-- 우리말겨루기 학교명 부분 -->
                    <div class='tit_div2'>
                        <h1><span id="schoolName">학교명</span></h1>
                    </div>
                    <!-- 우리말겨루기 학교명 부분 -->

                    <!-- 우리말겨루기 점수 부분 -->
                    <div class='tit_div33'>
                        <h1>0</h1>
                    </div>
                    <!-- 우리말겨루기 점수 부분 -->

                    <c:if test="${!empty BATTLE_QUIZ }">
                        <!-- 우리말겨루기 오자, 띄어쓰기 문제를 보고 하단에 정담으로 입력하는 부분 -->
                        <div class='woori_tit3'>
                            <h1>${BATTLE_QUIZ.TEXT_1}</h1>
                        </div>
                        <div class='woori_tit3_inpt'>
                            <input id="quizAnswer1" name="quizAnswer1" type="text" value="${BATTLE_QUIZ.TEXT_1}"
                                   readonly
                                   style="width: 1000px; height: 30px; font-size: 29px; opacity:0.5;">
                        </div>
                        <div class='woori_tit4'>
                            <h1>${BATTLE_QUIZ.TEXT_2}</h1>
                        </div>
                        <div class='woori_tit4_inpt'>
                            <input id="quizAnswer2" name="quizAnswer2" type="text" value="${BATTLE_QUIZ.TEXT_2}"
                                   readonly
                                   style="width: 1000px; height: 30px; font-size: 29px; opacity:0.5;">
                        </div>
                        <div class='woori_tit5'>
                            <h1>${BATTLE_QUIZ.TEXT_3}</h1>
                        </div>
                        <div class='woori_tit5_inpt'>
                            <input id="quizAnswer3" name="quizAnswer3" type="text" value="${BATTLE_QUIZ.TEXT_3}"
                                   readonly
                                   style="width: 1000px; height: 30px; font-size: 29px; opacity:0.5;">
                        </div>
                        <div class='woori_tit6'>
                            <h1>${BATTLE_QUIZ.TEXT_4}</h1>
                        </div>
                        <div class='woori_tit6_inpt'>
                            <input id="quizAnswer4" name="quizAnswer4" type="text" value="${BATTLE_QUIZ.TEXT_4}"
                                   readonly
                                   style="width: 1000px; height: 30px; font-size: 29px; opacity:0.5;">
                        </div>
                        <div class='woori_tit7'>
                            <h1>${BATTLE_QUIZ.TEXT_5}</h1>
                        </div>
                        <div class='woori_tit7_inpt'>
                            <input id="quizAnswer5" name="quizAnswer5" type="text" value="${BATTLE_QUIZ.TEXT_5}"
                                   readonly
                                   style="width: 1000px; height: 30px; font-size: 29px; opacity:0.5;">
                        </div>
                        <div class='woori_tit8'>
                            <h1>${BATTLE_QUIZ.TEXT_6}</h1>
                        </div>
                        <div class='woori_tit8_inpt'>
                            <input id="quizAnswer6" name="quizAnswer6" type="text" value="${BATTLE_QUIZ.TEXT_6}"
                                   readonly
                                   style="width: 1000px; height: 30px; font-size: 29px; opacity:0.5;">
                        </div>
                        <div class='woori_tit9'>
                            <h1>${BATTLE_QUIZ.TEXT_7}</h1>
                        </div>
                        <div class='woori_tit9_inpt'>
                            <input id="quizAnswer7" name="quizAnswer7" type="text" value="${BATTLE_QUIZ.TEXT_7}"
                                   readonly
                                   style="width: 1000px; height: 30px; font-size: 29px; opacity:0.5;">
                        </div>
                        <div class='woori_tit10'>
                            <h1>${BATTLE_QUIZ.TEXT_8}</h1>
                        </div>
                        <div class='woori_tit10_inpt'>
                            <input id="quizAnswer8" name="quizAnswer8" type="text" value="${BATTLE_QUIZ.TEXT_8}"
                                   readonly
                                   style="width: 1000px; height: 30px; font-size: 29px; opacity:0.5;">
                        </div>
                        <!-- 우리말겨루기 오자, 띄어쓰기 문제를 보고 하단에 정담으로 입력하는 부분 -->
                    </c:if>
                    <!-- 우리말겨루기 시작(문제 풀이 시작) / 종료(화면 캡쳐) 부분 -->
                    <div class='woori_btn1'>
                    <span><a id="quizStart" name="quizStart" href="#"><img id="quizStartImage"
                                                                           src="${pageContext.request.contextPath}/resources/images/btn_start.png"
                                                                           style="border:none"></a></span>
                    </div>
                    <div class='woori_team'>
                        <select id="teamCode" name="teamCode" onFocus='this.initialSelect = this.selectedIndex;'
                                onChange='this.selectedIndex = this.initialSelect;'
                                style="width: 160px; height: 85px; font-size: 80px; opacity:0.5;">
                            <option value="A">A조</option>
                            <option value="B">B조</option>
                            <option value="C">C조</option>
                            <option value="D">D조</option>
                        </select>
                    </div>
                    <div class='woori_btn2'>
                    <span><a id="battleEndSave" class="battleEndSave" href="#"><img
                            src="${pageContext.request.contextPath}/resources/images/btn_end.png"
                            style="border:none"></a></span>
                    </div>
                    <!-- 우리말겨루기 시작(문제 풀이 시작) / 종료(화면 캡쳐) 부분 -->
                </td>
            </tr>
            </tbody>
        </table>

    </form>
</div>

</body>
</html>
