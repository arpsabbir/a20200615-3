<?php /*a:2:{s:62:"/www/wwwroot/77q73.cn/application/index/view/machine/shop.html";i:1547107182;s:62:"/www/wwwroot/77q73.cn/application/index/view/common/world.html";i:1551429184;}*/ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="robots" content="noindex,nofollow">
    <meta name="robots" content="noarchive">
    <title>BTE</title>
    <meta name="keywords" content=" ">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="IE=9; IE=EDGE" http-equiv="X-UA-Compatible">
    <link rel="stylesheet" href="/static/images/sm.css">
    <script src="/static/images/jquery-1.10.2.min.js"></script>
    <link rel="stylesheet" href="/static/images/sm-extend.css">
    <link rel="stylesheet" href="/static/images/iconfont.css">
    <link rel="stylesheet" href="/static/images/main.css">
    <link rel="stylesheet" href="/static/images/order.css">
    
<style type="text/css">
    body{ background: #FFF;}
    .li_touxiang img {
        width: 80px;
        height: 80px;
        border-radius: 50%;
    }
</style>

</head>

<body>
<!-- content -->
<div class="page">
    <header class="bar bar-nav">

        <a style="position: absolute;z-index: 19;width: 94%;text-align: center;display: inline-block;line-height: 50px;font-size: 1.1rem; color:#FFF;">
            蚁后购买
        </a>
        <div class="logo">
             <a id="cancle" href="javascript:history.go(-1)"><i class="icon icon-left"></i></a>
        </div>
        <a class="icon pull-right open-panel"></a>
    </header>
    
    <nav class="foot-bar">
        <div class="foot-menu"><a href="/account.html">
            <i class="iconfont icon-shouye"></i><span>首页</span></a></div>
        <div class="foot-menu"><a href="/machine.html">
            <i class="iconfont icon-wxbmingxingdianpu"></i><span>我的蚁后</span></a></div>
        <div class="foot-menu"><a href="/team.html">
            <i class="iconfont icon-friend"></i><span>我的团队</span></a></div>
        <div class="foot-menu"><a href="/market.html">
            <i class="iconfont icon-wxbdingwei"></i><span>交易中心</span></a></div>
        <div class="foot-menu"><a href="/home.html">
            <i class="iconfont icon-geren"></i><span>会员中心</span></a></div>
    </nav>
    

    <div class="content" id="main_content">
        
<div class="list-block">

    <ul>
        <li>
            <div class="item-content">
                <div class="item-media"><i class="icon icon-form-name"></i></div>
                <div class="item-inner">
                    <div class="item-title label">名称</div>
                    <div class="item-input"><?php echo htmlentities($machine['title']); ?></div>
                </div>
            </div>
        </li>
        <li>
            <div class="item-content">
                <div class="item-media"><i class="icon icon-form-name"></i></div>
                <div class="item-inner">
                    <div class="item-title label">价格</div>
                    <div class="item-input"><?php echo htmlentities(money($machine['price'])); ?></div>
                </div>
            </div>
        </li>

        <li>
            <div class="item-content">
                <div class="item-media"><i class="icon icon-form-name"></i></div>
                <div class="item-inner">
                    <div class="item-title label">产量</div>
                    <div class="item-input"><?php echo htmlentities(money($machine['chanliang'])); ?></div>
                </div>
            </div>
        </li>

        <li>
        </li><li>
        <div class="item-content">
            <div class="item-media"><i class="icon icon-form-name"></i></div>
            <div class="item-inner">
                <div class="item-title label">周期</div>
                <div class="item-input"><?php echo htmlentities($machine['cycle']); ?>小时
                </div>
            </div>
        </div>
    </li>
        <li>
            <div class="item-content">
                <div class="item-media"><i class="icon icon-form-name"></i></div>
                <div class="item-inner">
                    <div class="item-title label">预计收入</div>
                    <div class="item-input"><?php echo htmlentities(money($machine['income'])); ?></div>
                </div>
            </div>
        </li>
        <li>
            <div class="item-content">
                <div class="item-media"><i class="icon icon-form-name"></i></div>
                <div class="item-inner">
                    <div class="item-title label">账户</div>
                    <div class="item-input">
                        <input type="radio" name="type" checked="checked" value="1"/>钱包 <?php echo htmlentities(money_four($user['wallet']['mpocket'])); ?>
                        <input type="radio" name="type" value="2"/>可售YCB <?php echo htmlentities(money_four($user['wallet']['money'])); ?>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="content-block">
                <div class="row">
                    <div class="col-100">
                        <input id="btnn" type="button" class="button button-big button-fill button-success js-submit" style="width: 100%;" value="购买"/>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</div>

    </div>
</div>
<script type="text/javascript" src="/static/images/alert.js"  ></script>
<script type="text/javascript" src="/assets/js/require.min.js"></script>
<script type="text/javascript" src="/static/js/global.js?3"></script>

<script>

    $(document).ready(function(){
        $('#btnn').click(function(){
            $('#btnn').attr("disabled","true");
            $(function() {
                var params = {
                    id : <?php echo htmlentities($id); ?>,
                    type : $("input[name='type']:checked").val()
                };
                $.ajax({
                    type: 'post',
                    url: api.machine.buy,
                    cache: false,
                    data: params,
                    dataType: 'json',
                    success: function(data){

                        alert(data.message);
                        if (data.code == 200) {
                            window.setTimeout("window.location='/account.html'",1000);
                            //window.location.href="/myshop.html";//需要跳转的地址
                            return true;
                        }else{
                            $("#btnn").removeAttr('disabled');
                        }
                    },
                });
            });

            return false;
        });
    });

</script>

</body>
</html>