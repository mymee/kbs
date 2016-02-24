<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/kbsbook.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/js/jquery-ui-1.11.4.custom/jquery-ui.css"/>
    <title>KBS'책들아놀자' 독서퀴즈쇼!</title>
    <style type="text/css">
        <!--
        table {
            background-image: url(${pageContext.request.contextPath}/resources/images/memory_bg01.png);
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
        .working_team {
            position: absolute;
            left: -430px;
            margin-left: 450px;
            top: 100px;
            z-index: 99;
            height: 100px;
            width: 343px;
            font-size: 32px;
            color: #fff;
        }
        .style2 {color: #666666}
        .style3 {color: #FFFFFF}
        .style4 {font-size: 6pt}
        -->
    </style>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.11.4/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/html2canvas.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/html2canvas.svg.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/canvas2image.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.cookie.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/dalert.jquery.min.js"></script>
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

            if($("#teamCode").val() == ""){
                dalert.alert("팀/조 선택을 다시 해 주세요","선택","");
                return false;
            }
            $('#workingMemorySave').click(function () {
                dalert.confirm($("#teamCode").val() + '조 답안을 저장하고 문제풀이를 종료하시겠습니까?',"문제풀이 저장",function(result){
                    if(result){

                        html2canvas($('#workingMemory'), {
                            //allowTaint: true,
                            //taintTest: false,
                            useCORS: true,
                            proxy: '/etc/proxy_image',
                            onrendered: function (canvas) {
                                var imageData = canvas.toDataURL("image/png");
                                //Canvas2Image.saveAsPNG(canvas);
                                //console.log("IMAGE: ", imageData);
                                var imageDataCompress = LZW.compress(imageData);

                                console.log("xy1", $('#xy1').val());
                                console.log("xy2", $('#xy2').val());
                                console.log("xy3", $('#xy3').val());
                                console.log("xy4", $('#xy4').val());
                                console.log("xy5", $('#xy5').val());
                                console.log("xy6", $('#xy6').val());
                                console.log("xy7", $('#xy7').val());
                                console.log("xy8", $('#xy8').val());
                                console.log("xy9", $('#xy9').val());
                                console.log("xy10", $('#xy10').val());
                                console.log("xy11", $('#xy11').val());
                                console.log("xy12", $('#xy12').val());
                                console.log("xy13", $('#xy13').val());
                                console.log("xy14", $('#xy14').val());
                                console.log("xy15", $('#xy15').val());
                                console.log("xy16", $('#xy16').val());
                                console.log("xy17", $('#xy17').val());
                                console.log("xy18", $('#xy18').val());
                                console.log("xy19", $('#xy19').val());
                                console.log("xy20", $('#xy20').val());

                                var formData = {
                                    teamCode: $("#teamCode").val(),
                                    xy1: $('#xy1').val(),
                                    xy2: $('#xy2').val(),
                                    xy3: $('#xy3').val(),
                                    xy4: $('#xy4').val(),
                                    xy5: $('#xy5').val(),
                                    xy6: $('#xy6').val(),
                                    xy7: $('#xy7').val(),
                                    xy8: $('#xy8').val(),
                                    xy9: $('#xy9').val(),
                                    xy10: $('#xy10').val(),
                                    xy11: $('#xy11').val(),
                                    xy12: $('#xy12').val(),
                                    xy13: $('#xy13').val(),
                                    xy14: $('#xy14').val(),
                                    xy15: $('#xy15').val(),
                                    xy16: $('#xy16').val(),
                                    xy17: $('#xy17').val(),
                                    xy18: $('#xy18').val(),
                                    xy19: $('#xy19').val(),
                                    xy20: $('#xy20').val(),
                                    imageData: imageDataCompress
                                };
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/working/memory/save",
                                    type: "POST",
                                    //cache: false,
                                    //processData: false,
                                    contentType: 'application/json',
                                    data: JSON.stringify(formData),
                                    success: function (data, textStatus, jqXHR) {
                                        dalert.alert("정상적으로 저장 되었습니다.","성공","");
                                        console.log("SUCCESS: ", data);
                                        //alert(data);
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        dalert.alert("저장에 실패하였습니다.","실패","");
                                        console.log("ERROR: ", errorThrown);
                                        //alert("ERROR : " + errorThrown);
                                    }
                                });
                            }
                        });
                    }
                    else{
                        return false;
                    }
                });

            });
        });
    </script>
</head>

<body>
<table id="workingMemory" width="1920" height="1080" border="0" cellspacing="0" cellpadding="0">
    <tbody>
    <tr>
        <td>
            <!-- 메모리퀴즈 조이름 부분 -->
            <div class='mem_no'>
                <div class='working_team'>
                    <select id="teamCode" name="teamCode" onFocus='this.initialSelect = this.selectedIndex;'
                            onChange='this.selectedIndex = this.initialSelect;'
                            style="width: 180px; height: 85px; font-size: 80px; opacity:0.5;">
                        <option value="" selected>조별</option>
                        <option value="A">A조</option>
                        <option value="B">B조</option>
                        <option value="C">C조</option>
                        <option value="D">D조</option>
                    </select>
                </div>
            </div>
            <!-- 메모리퀴즈 조이름 부분 -->

            <!-- 메모리퀴즈 정답카드 부분 : 개발no -->
            <div class='mem_card'>
                <span><a href="#"><img src="${pageContext.request.contextPath}/resources/images/mem_card01.png" style="border:none"></a></span>
                <span><a href="#"><img src="${pageContext.request.contextPath}/resources/images/mem_card02.png" style="border:none"></a></span>
                <span><a href="#"><img src="${pageContext.request.contextPath}/resources/images/mem_card03.png" style="border:none"></a></span>
                <span><a href="#"><img src="${pageContext.request.contextPath}/resources/images/mem_card04.png" style="border:none"></a></span>
                <span><a href="#"><img src="${pageContext.request.contextPath}/resources/images/mem_card05.png" style="border:none"></a></span>
            </div>
            <!-- 메모리퀴즈 정답카드 부분 : 개발no -->

            <!-- 메모리퀴즈 좌표입력 부분 -->
            <div class='mem_inpt1'>
                <input id="xy1" name="xy1" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt2'>
                <input id="xy2" name="xy2" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt3'>
                <input id="xy3" name="xy3" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt4'>
                <input id="xy4" name="xy4" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt5'>
                <input id="xy5" name="xy5" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt6'>
                <input id="xy6" name="xy6" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt7'>
                <input id="xy7" name="xy7" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt8'>
                <input id="xy8" name="xy8" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt9'>
                <input id="xy9" name="xy9" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt10'>
                <input id="xy10" name="xy10" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt11'>
                <input id="xy11" name="xy11" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt12'>
                <input id="xy12" name="xy12" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt13'>
                <input id="xy13" name="xy13" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt14'>
                <input id="xy14" name="xy14" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt15'>
                <input id="xy15" name="xy15" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt16'>
                <input id="xy16" name="xy16" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt17'>
                <input id="xy17" name="xy17" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt18'>
                <input id="xy18" name="xy18" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt19'>
                <input id="xy19" name="xy19" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <div class='mem_inpt20'>
                <input id="xy20" name="xy20" type="text" value="" style="width: 120px; height: 80px; text-align:center; font-size: 64px; opacity:0.5;">
            </div>
            <!-- 메모리퀴즈 좌표입력 부분 -->

            <!-- 메모리퀴즈 좌표입력 저장 부분 -->
            <div class='mem_btn'>
                <span><a id="workingMemorySave" name="workingMemorySave" href="#"><img id="workingMemorySaveImage" src="${pageContext.request.contextPath}/resources/images/btn_save2.png" style="border:none"></a></span>
            </div>
            <!-- 메모리퀴즈 좌표입력 저장 부분 -->
        </td>
    </tr>
    </tbody>
</table>

</body>
</html>
