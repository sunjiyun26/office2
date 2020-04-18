<%@ page language="java" isThreadSafe="true" pageEncoding="utf8" %>

<%@ page contentType="text/html; charset=utf8"%>
<html  >
<title>电力之家</title>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    <title>电力之家</title>--%>
<%--    <link rel='stylesheet prefetch' href='./css/reset.css'>--%>
<%--    <link rel="stylesheet" type="text/css" href="./css/default.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="./css/styles.css">--%>
    <link rel="stylesheet" href="bootstrap-4.1.3-dist/css/bootstrap.css">



    <script src="bootstrap-4.1.3-dist/bootstrap.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>
<header class="htmleaf-header">
    <h1>评审报告生成应用</h1>
    <div class="htmleaf-links">
<%--        <a class="htmleaf-icon icon-htmleaf-home-outline" href="http://www.htmleaf.com/" title="jQuery之家" target="_blank"><span> jQuery之家</span></a>--%>
<%--        <a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="http://www.htmleaf.com/css3/ui-design/201509062532.html" title="返回下载页" target="_blank"><span> 返回下载页</span></a>--%>
    </div>
</header>
<article class="htmleaf-content">
    <!-- multistep form -->
    <form id="msform">
        <!-- progressbar -->
        <div class="btn-group">
            <li class="active">基本信息</li>
            <li>审核内容及范围</li>
            <li>审核依据</li>
            <li>审核原则</li>
            <li>初步设计批复主要原则落实情况</li>
            <li>审核结果</li>
            <li>与初设概算对比分析</li>
        </div>
        <!-- fieldsets -->
        <fieldset>
            <div class="container">

                <div class="row" style="padding: 20px 0">

                    <h3>常用垂直表单布局</h3>

                </div>

                <div class="row form-group">

                    <label class="control-label col-lg-1" for="name">名称</label>

                    <div class="col-lg-5 col-md-6">

                        <input class="form-control" name="name" id="name" type="text">

                    </div>

                </div>

                <div class="row form-group">

                    <label class="control-label col-lg-1">内容</label>

                    <div class="col-lg-5 col-md-6">

                        <textarea class="form-control" rows="5"></textarea>

                    </div>

                </div>

                <div class="row form-group">

                    <label class="control-label col-lg-1">补充</label>

                    <div class="col-lg-5 col-md-6">

                        <textarea class="form-control" rows="5"></textarea>

                    </div>

                </div>

            </div>
            <div>
                <input type="button" name="previous" class="previous action-button" value="Previous" />
                <input type="button" name="next" class="next action-button" value="Next" />
            </div>
        </fieldset>
        <fieldset>
            <h2 class="fs-title">填写社交账号</h2>
            <h3 class="fs-subtitle">填写你的常用社交网络账号</h3>
            <input type="text" name="x-weibo" placeholder="新浪微博" />
            <input type="text" name="t-weibo" placeholder="腾讯微博" />
            <input type="text" name="qq" placeholder="腾讯QQ" />
            <input type="button" name="previous" class="previous action-button" value="Previous" />
            <input type="button" name="next" class="next action-button" value="Next" />
        </fieldset>
        <fieldset>
            <h2 class="fs-title">个人详细信息</h2>
            <h3 class="fs-subtitle">个人详细信息是保密的，不会被泄露</h3>
            <input type="text" name="fname" placeholder="昵称" />
            <input type="text" name="lname" placeholder="姓名" />
            <input type="text" name="phone" placeholder="电话号码" />
            <textarea name="address" placeholder="家庭住址"></textarea>
            <input type="button" name="previous" class="previous action-button" value="Previous" />
            <input type="submit" name="submit" class="submit action-button" value="Submit" />
        </fieldset>
    </form>
</article>

<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/jquery.easing.min.js" type="text/javascript"></script>
<script>
    var current_fs, next_fs, previous_fs;
    var left, opacity, scale;
    var animating;
    $('.next').click(function () {
        if (animating)
            return false;
        animating = true;
        current_fs = $(this).parent();
        next_fs = $(this).parent().next();
        $('#progressbar li').eq($('fieldset').index(next_fs)).addClass('active');
        next_fs.show();
        current_fs.animate({ opacity: 0 }, {
            step: function (now, mx) {
                scale = 1 - (1 - now) * 0.2;
                left = now * 50 + '%';
                opacity = 1 - now;
                current_fs.css({ 'transform': 'scale(' + scale + ')' });
                next_fs.css({
                    'left': left,
                    'opacity': opacity
                });
            },
            duration: 800,
            complete: function () {
                current_fs.hide();
                animating = false;
            },
            easing: 'easeInOutBack'
        });
    });
    $('.previous').click(function () {
        if (animating)
            return false;
        animating = true;
        current_fs = $(this).parent();
        previous_fs = $(this).parent().prev();
        $('#progressbar li').eq($('fieldset').index(current_fs)).removeClass('active');
        previous_fs.show();
        current_fs.animate({ opacity: 0 }, {
            step: function (now, mx) {
                scale = 0.8 + (1 - now) * 0.2;
                left = (1 - now) * 50 + '%';
                opacity = 1 - now;
                current_fs.css({ 'left': left });
                previous_fs.css({
                    'transform': 'scale(' + scale + ')',
                    'opacity': opacity
                });
            },
            duration: 800,
            complete: function () {
                current_fs.hide();
                animating = false;
            },
            easing: 'easeInOutBack'
        });
    });
    $('.submit').click(function () {
        return false;
    });
</script>
</body>
</html>
