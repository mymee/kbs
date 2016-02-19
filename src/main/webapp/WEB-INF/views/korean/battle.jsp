<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
<head>
    <title></title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.11.4/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/html2canvas.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/html2canvas.svg.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#add_button').click(function () {
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
</head>
<body>
<div id="koreanBattle">
    <input id="teamCode" name="teamCode" value="A">
    <textarea id="battleQuize" name="battleQuize">
            동해물과 백두산이
    </textarea>
    <textarea id="battleQuizeSubmit" name="battleQuizeSubmit">
            마르고 닳도록
    </textarea>
    <input type="submit" id="add_button" value="Take Screenshot Of Div" " />
</div>
</body>
</html>
