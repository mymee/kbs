<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <!-- head -->
    <jsp:include page="/WEB-INF/views/common/head.jsp"/>
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
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>우리말겨루기 <small>정답-캡쳐 화면</small></h2>
                                <ul class="nav navbar-right panel_toolbox">

                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <br />
                                <table width="100%" border="1" cellspacing="1" cellpadding="1">
                                    <tr>
                                        <td><img src="${pageContext.request.contextPath}/resources/upload/battle/${A_TEAM_RESULT.ANSWER_FILE}" width="100%" /></td>
                                        <td><img src="${pageContext.request.contextPath}/resources/upload/battle/${B_TEAM_RESULT.ANSWER_FILE}" width="100%" /></td>
                                    </tr>
                                    <tr>
                                        <td><img src="${pageContext.request.contextPath}/resources/upload/battle/${C_TEAM_RESULT.ANSWER_FILE}" width="100%" /></td>
                                        <td><img src="${pageContext.request.contextPath}/resources/upload/battle/${D_TEAM_RESULT.ANSWER_FILE}" width="100%" /></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</div>
<!-- /page content -->
</div>
</div>

<div id="custom_notifications" class="custom-notifications dsp_none">
    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
    </ul>
    <div class="clearfix"></div>
    <div id="notif-group" class="tabbed_notifications"></div>
</div>

</body>

</html>